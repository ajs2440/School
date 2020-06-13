/*
 * Dutch Bingo - Project 4 CS 212
 * Student: Advait Scaria
 * Date: 11/22/2019
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;

namespace Bingo
{
    class Program
    {
        private static RelationshipGraph rg;

        // Read RelationshipGraph whose filename is passed in as a parameter.
        // Build a RelationshipGraph in RelationshipGraph rg
        private static void ReadRelationshipGraph(string filename)
        {
            rg = new RelationshipGraph();                           // create a new RelationshipGraph object

            string name = "";                                       // name of person currently being read
            int numPeople = 0;
            string[] values;
            Console.Write("Reading file " + filename + "\n");
            try
            {
                string input = System.IO.File.ReadAllText(filename);// read file
                input = input.Replace("\r", ";");                   // get rid of nasty carriage returns 
                input = input.Replace("\n", ";");                   // get rid of nasty new lines
                string[] inputItems = Regex.Split(input, @";\s*");  // parse out the relationships (separated by ;)
                foreach (string item in inputItems) 
		{
                    if (item.Length > 2)                            // don't bother with empty relationships
                    {
                        values = Regex.Split(item, @"\s*:\s*");     // parse out relationship:name
                        if (values[0] == "name")                    // name:[personname] indicates start of new person
                        {
                            name = values[1];                       // remember name for future relationships
                            rg.AddNode(name);                       // create the node
                            numPeople++;
                        }
                        else
                        {               
                            rg.AddEdge(name, values[1], values[0]); // add relationship (name1, name2, relationship)

                            // handle symmetric relationships -- add the other way
                            if (values[0] == "hasSpouse" || values[0] == "hasFriend")
                                rg.AddEdge(values[1], name, values[0]);

                            // for parent relationships add child as well
                            else if (values[0] == "hasParent")
                                rg.AddEdge(values[1], name, "hasChild");
                            else if (values[0] == "hasChild")
                                rg.AddEdge(values[1], name, "hasParent");
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Console.Write("Unable to read file {0}: {1}\n", filename, e.ToString());
            }
            Console.WriteLine(numPeople + " people read");
        }

        // Show the relationships a person is involved in
        private static void ShowPerson(string name)
        {
            GraphNode n = rg.GetNode(name);
            if (n != null)
                Console.Write(n.ToString());
            else
                Console.WriteLine("\t{0} not found", name);
        }

        // Show a person's friends
        private static void ShowFriends(string name)
        {
            GraphNode n = rg.GetNode(name);
            if (n != null)
            {
                Console.Write("{0}'s friends: ",name);
                List<GraphEdge> friendEdges = n.GetEdges("hasFriend");
                foreach (GraphEdge e in friendEdges) {
                    Console.Write("\t{0} ",e.To());
                }
                Console.WriteLine();
            }
            else
                Console.WriteLine("\t{0} not found", name);     
        }

        // Show all orphans
        private static void ShowOrphans()
        {
            Console.Write("Orphan(s): \n");
            List<string> orphanNodes = new List<string>();
            int counter = 1;
            foreach (GraphNode n in rg.nodes)
            {
                if (n.GetEdges("hasParent").Count == 0)
                    Console.Write("\t" + counter + ". " + n.Name + "\n");
                    orphanNodes.Add(n.Name);
                    counter++;
            }
            if (orphanNodes.Count == 0)
                Console.Write("\n\tno orphans found");
            Console.WriteLine();
        }

        // Show a person's siblings
            // assumes that siblings don't share the same name (because if they do, then the later occurrence of the sibling
            // with the same name won't be recorded)
        private static void ShowSiblings(string name)
        {
            GraphNode n = rg.GetNode(name);
            if (n != null)
            {
                Console.Write("{0}'s siblings: ", name);
                List<GraphEdge> parentEdges = n.GetEdges("hasParent");
                List<GraphNode> parentNodes = new List<GraphNode>();
                List<GraphNode> childNodes = new List<GraphNode>();

                // get this person's parents
                foreach (GraphEdge e in parentEdges)
                {
                    parentNodes.Add(e.ToNode());
                }

                // for each parent node
                foreach (GraphNode p in parentNodes)
                {
                    // for each child edge of this parent
                    foreach(GraphEdge c in p.GetEdges("hasChild"))
                    {
                        // set copy to false
                        bool copy = false;
                        // for each child in childNodes list so far
                        foreach (GraphNode d in childNodes)
                        {
                            // if 'd' (a node in childNodes) is the same as 'c', then don't add it again by setting copy to true
                            if (d.GetName() == c.ToNode().GetName())
                                copy = true;
                        }

                        // if this node is not a copy and is not the same as the person being passed in, then add it to childNodes
                        if (!copy && c.ToNode().GetName() != name)
                            childNodes.Add(c.ToNode());
                    }
                }
                if (childNodes.Count != 0)
                {
                    Console.WriteLine();
                    int counter = 1;
                    foreach (GraphNode c in childNodes)
                    {
                        Console.WriteLine("\t" + counter + ". " + c.GetName());
                        counter++;
                    }
                }
                else { Console.Write("\n\tno siblings found for {0}", name); }
                
            }
            else
                Console.WriteLine("\t{0} not found", name);
            Console.WriteLine();
        }

        // show all descendents of person, arranged by generation
        private static void ShowDescendents(string name)
        {
            GraphNode root = rg.GetNode(name);

            // name not in file
            if (root == null)
                Console.WriteLine("\t{0} not found", name);

            // this person has no descendents
            else if (root.GetEdges("hasChild").Count == 0)
                Console.WriteLine("\t{0} has no descendents", name);
            
            // this person has some descendents
            else
            {
                Console.WriteLine("{0}'s descendents:", name);
                List<GraphNode> currentGenNodes = new List<GraphNode>();
                currentGenNodes.Add(root);
                // root has been visited, so set its label to "Visited" to avoid cycles, if any in file
                root.Label = "Visited";

                List<GraphNode> nextGenNodes = new List<GraphNode>();

                // generation counter (to determine the number of 'Great's in output)
                int generation = 0;
                List<string> children = new List<string>();

                // while there are some descendents
                while (currentGenNodes.Count > 0)
                {
                    children = new List<string>();
                    // for each descendent
                    foreach (GraphNode n in currentGenNodes)
                    {
                        // set label for each visited node to "Visited" to avoid cycles, if any
                        n.Label = "Visited";
                        // for each child of descendent, add them to the appropriate lists if unvisited
                        foreach (GraphEdge e in n.GetEdges("hasChild"))
                        {
                            if (e.ToNode().Label != "Visited")
                            {
                                nextGenNodes.Add(e.ToNode());
                                children.Add(e.To());
                            }
                        }
                    }

                    // output descendents with labels appropriately
                    if (generation == 0 && children.Count > 0)
                    {
                        Console.Write("\tChildren: ");
                        Console.WriteLine("\t" + String.Join(", ", (String[])children.ToArray()));
                    }
                    else if (generation == 1 && children.Count > 0) 
                    {
                        Console.Write("\tGrandchildren: ");
                        Console.WriteLine("\t" + String.Join(", ", (String[])children.ToArray()));
                    }
                    else if (generation > 1 && children.Count > 0)
                    {
                        Console.Write("\tGreat ");
                        for (int i = generation - 1; i > 1; i--)
                        {
                            Console.Write("Great ");
                        }
                        Console.Write("Grandchildren: ");
                        Console.WriteLine("\t" + String.Join(", ", (String[])children.ToArray()));
                    }
                    // make currentGenNodes point to the next generation of descendents,
                    // generate a new list for the next generation to compute in the next iteration of the loop
                    // increment generation counter variable
                    currentGenNodes = nextGenNodes;
                    nextGenNodes = new List<GraphNode>();
                    generation++;
                }
            }
        }

        // show shortest chain of relationships between name1 and name2
        private static void ShowBingo(string name1, string name2)
        {
            GraphNode start = rg.GetNode(name1);
            GraphNode end = rg.GetNode(name2);

            // invalid case - start not in file
            if (start == null)
            {
                Console.WriteLine("\t{0} not found", name1);
            }

            // invalid case - end not in file
            else if (end == null)
            {
                Console.WriteLine("\t{0} not found", name2);
            }
            // invalid case - start is same as end 
            else if (start == end)
            {
                Console.WriteLine("\t{0} and {1} are the same", name1, name2);
            }

            // valid case - start and end are in file, and are different nodes
            else
            {
                // list of nodes that will store the shortest path nodes
                List<GraphNode> shortestPath = new List<GraphNode>();

                // list of list of nodes that will store different paths from start to end
                List<List<GraphNode>> paths = new List<List<GraphNode>>();

                // list of nodes that will store the information of current depth nodes
                List<GraphNode> currentDepth = new List<GraphNode>();

                // dictionary to keep track of which nodes have been added and visited
                Dictionary<string, bool> check = new Dictionary<string, bool>();
                currentDepth.Add(start);
                paths.Add(currentDepth);
                int depthCount = 0;

                while (true)
                {
                    // new unique path
                    currentDepth = new List<GraphNode>();
                    
                    // BFS
                    // for each node in the last path stored
                    foreach (GraphNode n in paths[paths.Count - 1])
                    {
                        // for each edge for the current node
                        foreach (GraphEdge e in n.GetEdges())
                        {
                            // if this edge leads to end, go to label
                            if (e.To() == end.GetName())
                            {
                                goto Found;
                            }
                            // otherwise update current path, and add it to our dictionary if not in there already
                            if (!check.ContainsKey(e.To()))
                            {
                                currentDepth.Add(e.ToNode());
                                check.Add(e.To(), true);
                            }
                        }
                    }
                    // add new unique path to list of paths
                    paths.Add(currentDepth);
                }
            Found:
                shortestPath.Add(end);
                depthCount = paths.Count - 1;

                // while the last node in shortest path is not the same as start node, keep adding nodes to shortestPath list
                // from end to start checking to see if they are in our paths list
                while (shortestPath[shortestPath.Count - 1] != start && depthCount >= 0)
                {
                    // for each edge of last node in shortest path
                    foreach (GraphEdge e in shortestPath[shortestPath.Count - 1].GetEdges())
                    {
                        if (paths[depthCount].Contains(e.ToNode()))
                        {
                            shortestPath.Add(e.ToNode());
                            goto NextLoop;
                        }
                    }

                    // for each node in this depth
                    foreach (GraphNode n in paths[depthCount])
                    {
                        foreach (GraphEdge e in n.GetEdges())
                        {
                            if (e.ToNode() == shortestPath[shortestPath.Count - 1])
                            {
                                shortestPath.Add(n);
                                goto NextLoop;
                            }
                        }
                    }
                // decrement depthCount for next iteration
                NextLoop:
                    depthCount--;
                }
                // reverse order shortestPath to get order from start to end, since it is in reverse order (end to start) right now
                shortestPath.Reverse();
                
                // output in line the relationship sentence for each edge in shortest path
                for (int i = 1; i < shortestPath.Count; i++)
                {
                    foreach (GraphEdge e in shortestPath[i - 1].GetEdges())
                    {
                        if (e.ToNode() == shortestPath[i])
                            Console.WriteLine("\t" + shortestPath[i - 1].GetName() + " is a " + e.Label.Substring(3).ToLower() + " of " + shortestPath[i].GetName());
                    }
                }
            }
        }

            // accept, parse, and execute user commands
            private static void CommandLoop()
        {
            string command = "";
            string[] commandWords;
            Console.Write("Welcome to Harry's Dutch Bingo Parlor!\n");

            while (command != "exit")
            {
                Console.Write("\nEnter a command: ");
                command = Console.ReadLine();
                commandWords = Regex.Split(command, @"\s+");        // split input into array of words
                command = commandWords[0];

                if (command == "exit")
                    ;                                               // do nothing

                // read a relationship graph from a file
                else if (command == "read" && commandWords.Length > 1)
                    ReadRelationshipGraph(commandWords[1]);

                // show information for one person
                else if (command == "show" && commandWords.Length > 1)
                    ShowPerson(commandWords[1]);

                else if (command == "friends" && commandWords.Length > 1)
                    ShowFriends(commandWords[1]);

                // show all orphans in given file
                else if (command == "orphans")
                    ShowOrphans();

                // show siblings of a person
                else if (command == "siblings" && commandWords.Length > 1)
                    ShowSiblings(commandWords[1]);

                // show all descendents of a person, labeled by generation
                else if (command == "descendents" && commandWords.Length > 1)
                    ShowDescendents(commandWords[1]);

                // show all descendents of a person, labeled by generation
                else if (command == "bingo" && commandWords.Length > 1)
                    ShowBingo(commandWords[1], commandWords[2]);

                // dump command prints out the graph
                else if (command == "dump")
                    rg.Dump();

                // illegal command
                else
                    Console.Write("\nLegal commands: read [filename], dump, show [personname],\n  friends [personname], orphans,\n" +
                        "siblings [personname], descendents [personname],\n bingo [personname1] [personname2], exit\n");
            }
        }

        static void Main(string[] args)
        {
            CommandLoop();
        }
    }
}
