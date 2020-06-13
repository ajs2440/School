############################################################################
# CS 232 Homework 7
# Edited by: Advait Scaria
#   added an MMU class to handle address checking
############################################################################

RAM_SIZE = 1024


class RAM:
    def __init__(self, size=RAM_SIZE):
        self._minAddr = 0
        self._maxAddr = RAM_SIZE - 1
        self._memory = []   # a list of values.  Could be #s or instructions.
        for i in range(size):
            self._memory.append(0)

    def __getitem__(self, addr):
        return self._memory[addr]

    def __setitem__(self, addr, val):
        self._memory[addr] = val

    def is_legal_addr(self, addr):
        return self._minAddr <= addr <= self._maxAddr


    # The MMU Class:

    class MMU:
        def __init__(self, ram):
            self._ram = ram
            self._reloc = 0
            self._limit = 0

        def __getval__(self, addr):
            if (addr >= self._limit):
                print("BAD ADDRESS: %d too high" % addr)
            return self._ram.__getitem__(addr + self._reloc)

        def __storeval__(self, addr, val):
            if (addr >= self._limit):
                print("BAD ADDRESS: %d too high" % addr)
            self._ram.__setitem__(addr + self._reloc, val)

        def set_reloc_register(self, val):
            self._reloc = val

        def set_limit_register(self, val):
            self._limit = val
