/* Client side for utilizing the CaesarCipher application to which the server responds to
 * 
 * CS 232 - Homework 8
 * Advait Scaria
 * May 9, 2020
 * 
 * Source used: https://www.javaworld.com/article/2077322/core-java/core-java-sockets-programming-in-java-a-tutorial.html
 */

import java.util.*;
import java.io.*;
import java.net.*;

public class CaesarCipherClient {
    public static void main(String[] args) {
        String hostname = "";
        int port =-1;
        // Check to see only 2 arguments provided
        if (args.length == 2) {
            hostname = args[0];
            // try to initialize port with provided argument, prompt error if invalid port argument
            try {
                port = Integer.parseInt(args[1]);
            } catch (NumberFormatException e) {
                System.out.println("Please enter an appropriate number for argument: <port>");
                System.exit(1);
            }
        } 
        // Prompt error message if exactly 2 arguments is not given
        else {
            System.out.println(
                    "Please enter two arguments for CaesarCipherClient, Usage: java CaesarCipherClient <hostname> <port>\n");
            System.exit(1);
        }

        // Prompt user input
        System.out.println("\n------Welcome to the Caesar Cipher Client------\n");
        System.out.print("Enter the shift number n (0 < n < 26): ");

        // Get n, the shift/rotation number
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));

        // Instance variables to handle n
        String shiftVal = "";
        int shift = -1;

        // try to read input and assign it to shiftVal if input doesn't have any problems
        try {shiftVal = input.readLine();} 
        catch(Exception e) {
            System.out.println("Error: " + e);
            System.exit(1);
        }

        // try to assign the integer value of shiftVal to the shift int instance variable
        try { shift = Integer.parseInt(shiftVal);} 
        catch(Exception e) {
            System.out.println("Error: " + e);
            System.exit(1);
        }

        // Connect socket to server and continuously prompt for user input
        try {
            System.out.printf("\nAttempting to connect...\n\tserver: %s\n\tport: %d\n", hostname, port);
            
            // Connect to server
            Socket socket = new Socket(hostname, port);
            System.out.println("Connection established!\n");

            // Create input and output streams to read from and write to the server
            PrintStream out = new PrintStream(socket.getOutputStream());
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            // Send Caesar Cipher shift value to server
            out.println(Integer.toString(shift));
            out.flush();

            // Display what server received and send that back for clarification
            String serverLine = in.readLine();
            System.out.println("Server received shift number 'n': " + serverLine);

            // If input is not quit: read input text, send text to server, display whatever server sent back and loop
            while (true) {
                System.out.print("Enter text to encrypt or type \"quit\" to exit: ");
                String text = "";
                try {
                    text = input.readLine();
                } catch (Exception e) {
                    System.out.println(e);
                }
                if (text.equals("quit")) {
                    break;
                }

                out.println(text);
                out.flush();

                serverLine = in.readLine();
                System.out.println("Your encrypted text is: " + serverLine + "\n");
            }

            // Close streams
            in.close();
            out.close();
            socket.close();
            input.close();

        } catch (Exception e) {
            System.out.println("Error: " + e + "\n");
            e.printStackTrace();
            System.exit(1);
        }
    }
}
