/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/23/2019s
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {
      System.out.println("\nWelcome to the Bird Park!\n");

      // Bird bird0 = new Bird();
      // Bird bird1 = new Bird("Hawkeye");
      Bird bird2 = new Duck("Donald");
      Bird bird3 = new Penguin("Peter");
      Bird bird4 = new Goose("Mother");
      Bird bird5 = new Ostrich("Orville");
      Bird bird6 = new Owl("Woodsey");
      Bird bird7 = new Kiwi("Kool");


      // bird1.print();
      bird2.print();
      bird3.print();
      bird4.print();
      bird5.print();
      bird6.print();
      bird7.print();
      System.out.println();
    }
}

