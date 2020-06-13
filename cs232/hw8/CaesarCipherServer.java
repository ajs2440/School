/* Server side for handling the CaesarCipher application to respond to the client
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CaesarCipherServer {
    public static void main(String[] args) {
        // Check to see only 1 argument provided
        if (args.length != 1) {
            // Prompt error message if exactly 1 argument is not given
            System.out.println(
                    "Please enter one argument for CaesarCipherServer, Usage: java CaesarCipherClient <port>\n");
            System.exit(1);
        }

        // Initialize port with provided argument
        int port = Integer.parseInt(args[0]);

        // Try to connect server to given port
        try {
            ServerSocket serverSocket = new ServerSocket(port);     // TODO: when to close this??

            while (true) {
                // Call accept() to receive the next connection
                Socket client = serverSocket.accept();
                // Pass this socket to RequestHandler thread for processing
                RequestHandler rh = new RequestHandler(client);
                rh.start();
            }

        } catch (Exception e) {
            System.out.print("Error: " + e + "\n");
            e.printStackTrace();
            System.exit(1);
        }
    }
}

class RequestHandler extends Thread {
    // Instance variable for established client socket connections
    private Socket socket;

    // RequestHandler constructor which establishes the connection in the class
    // and displays date, time, ip address info for each connected client
    RequestHandler(Socket socket) {
        this.socket = socket;
        DateTimeFormatter date = DateTimeFormatter.ofPattern("MM/dd/yyy HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        System.out.println(
                "[" + date.format(now) + "] Received connection from: " + socket.getRemoteSocketAddress().toString());
    }

    public void run() {
        try {
            // Get input and output streams
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream());

            // Get value of n from client input and send back to output stream if n is valid
            String clientLine = in.readLine();
            int n = -1;
            try {
                n = Integer.parseInt(clientLine);
                if (n < 1 || n > 25) {
                    out.println("Error: Invalid input for shift number 'n' -- (0 < n < 26)");
                    out.flush();

                } else {
                    out.println(n);
                    out.flush();
                }
            } catch (Exception e) {
                out.println(e);
                e.printStackTrace();
                System.exit(1);
            }

            // Call caesarCipher on each input line of text this client gives
            while (clientLine != null && clientLine.length() > 0) {
                clientLine = in.readLine();
                try {out.println(caesarCipher(clientLine, n));}
                catch (Exception e) {
                    System.out.println("Error: " + e);
                    e.printStackTrace();
                    break;
                }
                out.flush();
            }

            // Close our connection
            in.close();
            out.close();
            socket.close();

            System.out.println("Closing connection to: " + socket.getRemoteSocketAddress().toString());

        } catch (Exception e) {
            System.out.print("Error: " + e + "\n");
            e.printStackTrace();
            System.exit(1);
        }
    }

    /*
     * caesarCipher() method takes in text and rotates it by amount specified in
     * shift to provide a simple caesar cipher encryption
     * 
     * Sources used: https://www.baeldung.com/java-caesar-cipher
     *               https://stackoverflow.com/questions/4047808/what-is-the-best-way-to-tell-if-a-character-is-a-letter-or-number-in-java-withou
     */
    public String caesarCipher(String text, int shift) {
        String encrypted = "";

        // The algorithm shifts letters only and keeps their case; it ignores any special characters
        for (char character : text.toCharArray()) {

            // If the character is a letter
            if (Character.isLetter(character)) {

                // If it is lower case, find it's appropriate shifted character
                if (Character.isLowerCase(character)) {
                    int originalAlphabetPosition = character - 'a';
                    int newAlphabetPosition = (originalAlphabetPosition + shift) % 26;
                    char newCharacter = (char) ('a' + newAlphabetPosition);
                    encrypted += newCharacter;
                } 
                
                // If it is upper case, find it's appropriate shifted character
                else {
                    int originalAlphabetPosition = character - 'A';
                    int newAlphabetPosition = (originalAlphabetPosition + shift) % 26;
                    char newCharacter = (char) ('A' + newAlphabetPosition);
                    encrypted += newCharacter;
                }

            } 
            
            // Otherwise, it is a special character so just append it to the encrypted text
            else {
                encrypted += character;
            }
        } return encrypted;
    }

}