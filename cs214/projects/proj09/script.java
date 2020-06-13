Script started on Tue 23 Apr 2019 07:28:46 PM EDT
ajs244@gold09:~/cs214/projects/proj09/java$ cat Sr earchList.java
/* SearchList.java finds the position of a value within a given
 * list.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/23/2019
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

public class SearchList {

  public static void main(String [] args) {
    LinkedList<Integer> list1 = new LinkedList<Integer>();
    LinkedList<Integer>	list2 = new LinkedList<Integer>();
    LinkedList<Integer>	list3 = new LinkedList<Integer>();
    LinkedList<Integer> list4 = new LinkedList<Integer>();	

    list1.add(99);    // 99 is first, should return 0
    list1.add(88);    
    list1.add(77);
    list1.add(66);  
    list1.add(55);

    list2.add(55);    // 99 is last, should return 4
    list2.add(66);    
    list2.add(77);  
    list2.add(88);  
    list2.add(99);  
  
    list3.add(55);    // 99 is in middle, should return 2
    list3.add(77);    
    list3.add(99);  
    list3.add(88);  
    list3.add(66);

    list4.add(5);     // 99 not present, should return -1
    list4.add(6);
    list4.add(7);
    list4.add(8);
    list4.add(9); 
  
   System.out.println();   
   System.out.print("list1: "); print(list1); 
   System.out.print("list2: "); print(list2);
   System.out.print("list3: "); print(list3); 
   System.out.print("list4: "); print(list4); 

   System.out.println();
   System.out.println("Position of 99 in list1: " + search(list1, 99));
   System.out.println("Position of 99 in list2: " + search(list2, 99));
   System.out.println("Position of 99 in list3: " + search(list3, 99));
   System.out.println("Position of 99 in list4: " + search(list4, 99));
   System.out.println();
  }

  /** print() displays a LinkedList on the console.
   *
   * @param: aList, a LinkedList<Integer>
   * 
   * Postcondition: the Integer values in aList
   *                 have been displayed to System.out,
   *                 separated by spaces.
   */
  public static void print(LinkedList<Integer> aList) {
  	Iterator<Integer> listIterator = aList.iterator();
  	while (listIterator.hasNext()){
	    System.out.print(listIterator.next() + " ");
	  }
	  System.out.print('\n');
  }

  /** search() searches a LinkedList for a given value and
   *  returns its position if in List or -1.
   *
   *  Receive: aList, a list of integers; and
   *           aValue, an integer.
   *  Return: the position of aValue within aList, if aValue 
   *          is present in aList; -1, otherwise.
   */
  public static int search(LinkedList<Integer> aList, int aValue) {
    Iterator<Integer> listIterator = aList.iterator();
    int counter = 0;
    while (listIterator.hasNext()){
      if (listIterator.next() == aValue) {
        return counter;
      }
      counter++;
    }
    return -1;
  }


}

ajs244@gold09:~/cs214/projects/proj09/java$ make
make: 'SearchList.class' is up to date.
ajs244@gold09:~/cs214/projects/proj09/java$ java SearchList

list1: 99 88 77 66 55 
list2: 55 66 77 88 99 
list3: 55 77 99 88 66 
list4: 5 6 7 8 9 

Position of 99 in list1: 0
Position of 99 in list2: 4
Position of 99 in list3: 2
Position of 99 in list4: -1

ajs244@gold09:~/cs214/projects/proj09/java$ exit

Script done on Tue 23 Apr 2019 07:28:59 PM EDT
