# CS 232 Homework 5 - Adding Context Switching to CalOS
# Name: Advait Scaria
# Date: 3/31/2020
# Added code to these methods:
#   timer_isr(self)
#   context_switch(self)
#   run()

DEFAULT_QUANTUM = 3   # very short -- for pedagogical reasons.

class CalOS:

    # Refers to the current process's PCB
    current_proc = None

    def __init__(self, ram, debug=False):
        self.syscalls = { "test_syscall": self.test_syscall }
        self._ready_q = []
        self._ram = ram
        self._timer_controller = None
        self._cpu = None
        self._debug = debug

    def set_cpu(self, cpu):
        self._cpu = cpu

    def set_debug(self, debug):
        self._debug = debug

    def syscall(self, fname, val0, val1, val2):
        if not fname in self.syscalls:
            print("ERROR: unknown system call", fname)
            return
        self.syscalls[fname](val0, val1, val2)

    def test_syscall(self, val0, val1, val2):
        print("Test system call called!")

    def set_timer_controller(self, t):
        self._timer_controller = t

    def add_to_ready_q(self, pcb):
        '''Add pcb to the ready queue, and set the state of the process to READY.'''
        pcb.set_state(PCB.READY)
        self._ready_q.append(pcb)

        if self._debug:
            print("add_to_ready_q: queue is now:")
            for p in self._ready_q:
                print("\t" + str(p))
            print("Num ready processes = {}".format(len(self._ready_q)))

    def timer_isr(self):
        '''Called when the timer expires. If there is no process in the
        ready queue, reset the timer and continue.  Else, context_switch.
        '''
        if self._debug:
            print('End of quantum!')
        CalOS.current_proc.set_registers(self._cpu.get_registers())     # save CPU's registers into current_proc's registers
        if not self._ready_q:                                           # if _ready_q is empty
            self.reset_timer()                                          # reset timer
            CalOS.current_proc.set_registers({                          # restore registers to 0
                'reg0': 0,
                'reg1': 0,
                'reg2': 0,
                'pc': 0,
            })
            return                                                      # return
        self.context_switch()                                           # call context_switch()
        self.reset_timer()                                              # call reset_timer()

    def context_switch(self):
        '''Do a context switch between the current_proc and the process
        on the front of the ready_q.
        '''
        new_proc = self._ready_q.pop(0)                                   # get new process's PCB from first item in ready_q
        if self._debug:
            print('Switching procs from ' + CalOS.current_proc.get_name() + ' to ' + new_proc.get_name())
        CalOS.current_proc.set_registers(self._cpu.get_registers())       # save CPU's registers into currently running process's registers
        self._cpu.set_registers(new_proc.get_registers())                 # load CPU's registers with registers stored in new process's PCB
        self._ready_q.append(CalOS.current_proc)                          # put old process at end of ready_q
        new_proc.set_state(PCB.RUNNING)                                   # set new process to RUNNING state
        CalOS.current_proc = new_proc                                     # set current_proc to new process

    def run(self):
        '''Startup the timer controller and execute processes in the ready
        queue on the given cpu -- i.e., run the operating system!
        '''
        while self._ready_q:                                              # while ready_q is not empty                                    
            CalOS.current_proc = self._ready_q.pop(0)                     # set current_proc to refer to the PCB from the front of the ready_q 
            self.reset_timer()                                            # reset timer
            self._cpu.set_registers(CalOS.current_proc.get_registers())   # load cpu's registers with registers stored in current_proc
            self._cpu.run_process()                                       # call cpu's run process
            CalOS.current_proc.set_state(PCB.DONE)                        # set current_proc's state to DONE

    def reset_timer(self):
        '''Reset the timer's countdown to the value in the current_proc's
        PCB.'''
        self._timer_controller.set_countdown(CalOS.current_proc.get_quantum())
        


class PCB:
    '''Process control block'''

    NEW, READY, RUNNING, WAITING, DONE = "NEW", "READY", "RUNNING", "WAITING", "DONE"
    LEGAL_STATES = NEW, READY, RUNNING, WAITING, DONE

    # PID 0 is reserved for the IDLE process, which runs when there are no other
    # ready processes.
    next_pid = 1
    
    def __init__(self, name, pid=None):

        self._name = name
        if pid is None:
            self._pid = PCB.next_pid
            PCB.next_pid += 1
        else:
            self._pid = pid

        self._entry_point = None
        self._mem_low = None
        self._mem_high = None
        self._state = PCB.NEW

        # Used for storing state of the process's registers when it is not running.
        self._registers = {
            'reg0' : 0,
            'reg1' : 0,
            'reg2' : 0,
            'pc': 0
            }

        # Quantum: how long this process runs before being interrupted.
        self._quantum = DEFAULT_QUANTUM

    def set_entry_point(self, addr):
        self._entry_point = addr
        self._registers['pc'] = addr

    def get_entry_point(self):
        return self._entry_point

    def set_memory_limits(self, low, high):
        self._mem_low = low
        self._mem_high = high

    def set_state(self, st):
        assert st in self.LEGAL_STATES
        self._state = st

    def get_state(self):
        return self._state

    def set_registers(self, registers):
        self._registers = registers
        
    def get_registers(self):
        return self._registers

    def get_quantum(self):
        return self._quantum

    def set_quantum(self, q):
        self._quantum = q

    def get_pid(self):
        return self._pid

    def get_name(self):
        return self._name

    def __str__(self):
        return "PCB({}): {}, state {}, entrypoint {}".format(self._pid, self._name, self._state,
                                                             self._entry_point)
    