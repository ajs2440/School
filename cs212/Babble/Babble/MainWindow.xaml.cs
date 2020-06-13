/* Babble - a program that computes n-order word-occurence statistics
 * Initial setup code given by Prof. H. Plantinga
 * Advait Scaria - Babble, nOrder, firstOrder methods
 * 10/11/19
 */
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;

namespace BabbleSample
{
    /// Babble framework
    /// Starter code for CS212 Babble assignment
    public partial class MainWindow : Window
    {
        private string input;                           // input file
        private string[] words;                         // input file broken into array of words
        private int wordCount = 200;                    // number of words to babble

        // Additional local variables used later
        private string currentWord;                     // loads the current word being processed to be used as a key
        private int orderN = 1;                         // stores which level of n is selected to execute correct methods
        int numTotalWords = 0;                          // stores number of total words in the loaded text
        int numUniqueWords = 0;                         // stores the unique number of words appearing in the loaded text
        private string numberTotal = "";                // string used to indicate how many total words are in loaded text
        private string numberUnique= "";                // stores used to indicate how many unique words are in loaded text

        char[] stringSeparator = { '-' };               // array containing the hyphen separator to separate a string of words
        string[] separatedWords;                        // an array to store the separated words from the key

        private Random randomIndex = new Random();      // to get a random value from hashtable list to use as next word


        public MainWindow()
        {
            InitializeComponent();
        }

        // 
        private void loadButton_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();
            ofd.FileName = "Sample"; // Default file name
            ofd.DefaultExt = ".txt"; // Default file extension
            ofd.Filter = "Text documents (.txt)|*.txt"; // Filter files by extension

            // Show open file dialog box
            if ((bool)ofd.ShowDialog())
            {
                textBlock1.Text = "Loading file " + ofd.FileName + "\n";
                input = System.IO.File.ReadAllText(ofd.FileName);  // read file
                words = Regex.Split(input, @"\s+");       // split into array of words
            }
        }

        private void analyzeInput(int order)
        {
            if (order > 0)
            {
                MessageBox.Show("Analyzing at order: " + order);
            }
        }

        //Function that determines what order statistics is called and calls the corresponding order function
        private void babbleButton_Click(object sender, RoutedEventArgs e)
        {
            //Clear text
            textBlock1.Text = " ";

            //Clear the number of words and number of unique words text blocks
            numTotalWords = 0;
            numUniqueWords = 0;
            numberTotal = " ";
            numberUnique = " ";

            // Order 1 statistics calls method firstOrder()
            if (orderN == 1)
            {
                firstOrder();
            }
            // Order n statistics calls method nOrder()
            else
            {
                nOrder(orderN);
            }
        }

        // firstOrder performs first order statistics which uses one word keys and hashtables to generate random text
        // and compute word statistics in that randomly generated text
        private void firstOrder()
        {
            // hashTable (a Dictionary type) made to store string keys and next word values of those keys in an ArrayList
            Dictionary<string, ArrayList> hashTable = new Dictionary<string, ArrayList>();

            // Loop through text till second to last word
                
                
                    
                // add the next word as a value in the ArrayList of the current word
            for (int i = 0; i < words.Count() - 1; i++) 
            {
                numTotalWords++;                                    // increment total words counter variable
                string word = words[i];                             // start at first word in text,
                if (!hashTable.ContainsKey(word))                   // if hashTable doesn't yet contain a key for that word
                {   
                    hashTable.Add(word, new ArrayList());           // make a key
                    numUniqueWords++;                               // increment unique key counter
                }
                hashTable[word].Add(words[i + 1]);                  // add next appearing word to the list of this key
            }

            // Update the total number of words and number of unique words strings
            numberTotal = "There are " + Convert.ToString(numTotalWords) + " total words.";
            numberUnique = "There are " + Convert.ToString(numUniqueWords) + " unique words."; ;
            textBlock1.Text = numberTotal + "\n" + numberUnique + "\n\n";

            // Start by writing the first word to the text block
            currentWord = words[0];
            textBlock1.Text += "-->  " + currentWord;

            // Loop through and generate a random nextWord using the babble method and the hashtable
            // add the next word to text block and set currentWord = nextWord to continue generating new nextWords
            for (int i = 0; i < 200; i++)
            {
                string nextWord = Babble(hashTable, 1);  // returns a random word using class var. 'currentWord' as key
                textBlock1.Text += " " + nextWord;
                currentWord = nextWord; 
            }
        }

        private void nOrder(int n)
        {
            // hashTable (a Dictionary type) made to store string keys and next word values of those keys in an ArrayList
            Dictionary<string, ArrayList> hashTable = new Dictionary<string, ArrayList>();

            numTotalWords = n;
            numUniqueWords = 0;

            // Loop through text till the last word - n            
            for (int i = 0; i < words.Count() - (n + 1); i++)
            {
                string word = words[i];                                // start at beginning, loop j to appropriate n limit...
                for (int j = i + 1; j < n + i; j++)                    // ...to get the right key size
                {
                    word += "-" + words[j];
                }
                numTotalWords ++;                                       // increment total words counter variable
                if (!hashTable.ContainsKey(word))                      // if hashTable doesn't yet contain a key for that word, make a key
                {
                    hashTable.Add(word, new ArrayList());
                    numUniqueWords++;                                  // increment unique words counter variable
                }
                hashTable[word].Add(words[i + n]);                     // add the nth word from beginning of this key as value in list
            }

            // Update the total number of words and number of unique words strings
            numberTotal = "There are " + Convert.ToString(numTotalWords) + " total words.";
            numberUnique = "There are " + Convert.ToString(numUniqueWords) + " unique words."; ;
            textBlock1.Text = numberTotal + "\n" + numberUnique + "\n\n";

            // Store first word in currentWord, then loop i < nOrder times to get key of right size
            currentWord = words[0];
            for (int i = 1; i < n; i++) 
            {
                currentWord += "-" + words[i];
            }

            // correctly outputing the text so first n words are outputted at first without dashes
            textBlock1.Text += "-->  ";
            separatedWords = currentWord.Split(stringSeparator);
            for (int k = 0; k < separatedWords.Length; k++)
            {
                textBlock1.Text += separatedWords[k] + " ";
            }
            // Loop through and generate a random nextWord using the babble method and the hashtable
            // add the next word to text block and set currentWord = nextWord to continue generating new nextWords
            for (int i = 0; i < 200; i++)
            {
                string nextWord = Babble(hashTable, n);  // returns a random word using class var. 'currentWord' as key
                textBlock1.Text += nextWord + " ";
                separatedWords = currentWord.Split(stringSeparator);
                currentWord = "";
                for (int k = 1; k < separatedWords.Length; k++)
                {
                    currentWord += separatedWords[k] + "-";    // update currentWord to discard first word (since k starts at 1)
                }
                currentWord += nextWord;                // add nextWord to currentWord sequence of words
            }
        }

        // Babble generates a random word to return to the methods above
        private string Babble(Dictionary<string, ArrayList> hashTable, int order)
        {
            // If key not found, then it must be the last word(s) in the text which may not have a key for itself
            // So reset the currentWord to the beginning of the text to then get a valid key
            if (!hashTable.ContainsKey(currentWord))
            {
                if (orderN == 1)
                {
                    currentWord = words[0];
                }
                else
                {
                    currentWord = words[0];
                    for (int i = 1; i < order; i++)
                    {
                        currentWord += "-" + words[i];
                    }
                }
            }

            // Get a random number within the size of the list of the current key in hashtable
            int randomChoice = randomIndex.Next(hashTable[currentWord].Count);

            // Store the list that hashTable has for currentWord in an ArrayList variable called list
            ArrayList list = hashTable[currentWord];

            // Make a newWord variable which stores a random word from list
            string newWord = Convert.ToString(list[randomChoice]);

            // Return newWord to the caller of this function
            return newWord;
        }

        private void orderComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            orderN = orderComboBox.SelectedIndex;
            analyzeInput(orderComboBox.SelectedIndex);            
        }
    }
}