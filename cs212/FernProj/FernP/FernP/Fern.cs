/*
 * Advait Scaria
 * CS 212 Program 3 - Fractal Fern
 * 11/1/19
 * 
 * Note: I have tried to make a fractal tree and intended to populate it with leaves using clusters, 
 * but unfortunately I couldn't get the time to finish or figure out how to do many parts of this 
 * program. As a result: 
 *        -- the clusters generated on the canvas (that are supposed to be leaves) do not appear at the correct location to make them look like leaves on a tree
 *           and have quite random behavior
 *        -- the documentation isn't of the best quality
 * 
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Animation;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace FernP
{ 
    /*
     * this class draws a fractal fern when the constructor is called.
     * Written as sample C# code for a CS 212 assignment -- October 2011.
     *
     * Bugs: WPF and shape objects are the wrong tool for the task
     */
    class Fern
    {
        // Declara variables to be used later
        private static int branches = 10;
        private static int tendrils = 5;
        private static int minTendrils = 10;
        private static double dir = 0.1;
        private static double Length = 4.0;
        private static double DELTATHETA = Math.PI / 5;
        private static double LENGTHSCALE = 0.75;
        Random random = new Random();

        /*
         * Fern constructor erases screen and draws a fern
         *
         * Size: number of 3-pixel segments of tendrils
         * Redux: how much smaller children clusters are compared to parents
         * Turnbias: how likely to turn right vs. left (0=always left, 0.5 = 50/50, 1.0 = always right)
         * canvas: the canvas that the fern will be drawn on
         */
        public Fern(double size, double redux, double turnbias, Canvas canvas)
        {
            canvas.Children.Clear();                                // delete old canvas contents

            double length = 0.2 * canvas.Width;
            double theta = -Math.PI / 2;

            // Rectangle that contains the sky
            Rectangle r1 = new Rectangle();
            r1.Stroke = new SolidColorBrush(Colors.CadetBlue);
            r1.Fill = new SolidColorBrush(Colors.CadetBlue);
            r1.Width = canvas.Width;
            r1.Height = canvas.Height;
            canvas.Children.Add(r1);

            // Rectangle that represents the land
            Rectangle r2 = new Rectangle();
            r2.Stroke = new SolidColorBrush(Colors.LightGreen);
            r2.Fill = new SolidColorBrush(Colors.LightGreen);
            r2.Width = 650;
            r2.Height = 500;
            Canvas.SetLeft(r2, 0);
            Canvas.SetTop(r2, 400);
            canvas.Children.Add(r2);

            int x1 = (int)canvas.Width / 2;
            int y1 = 400;


            // Draws the main trunk of the tree using previously defined variables
            mainTrunk(x1, y1, size, length, theta, canvas);
            x1 = x1 + (int)(length * Math.Cos(theta));
            y1 = y1 + (int)(size * Math.Sin(theta));

            // Recursively draws the branches of the tree using smaller branches each time
            int thickness = random.Next(0, 15);
            branch(x1, y1, size, size, redux, ((size / 2) - 1) / thickness, theta, turnbias, canvas);

            

        }

        /*
        * draw the main trunk of the tree with given length, size, direction on canvas
        */
        private void mainTrunk(int x1, int y1, double size, double length, double direction, Canvas canvas)
        {
            Line myLine = new Line();
            SolidColorBrush mySolidColorBrush = new SolidColorBrush();
            mySolidColorBrush.Color = Color.FromArgb(255, 100, 40, 20);
            myLine.X1 = x1;
            myLine.Y1 = y1;
            myLine.X2 = x1 + length * Math.Cos(direction);
            myLine.Y2 = y1 + size * Math.Sin(direction);
            myLine.Stroke = mySolidColorBrush;
            myLine.VerticalAlignment = VerticalAlignment.Center;
            myLine.HorizontalAlignment = HorizontalAlignment.Left;
            myLine.StrokeThickness = size / 4;
            canvas.Children.Add(myLine);
        }

        /*
         * draw branches with given length, size, thickness on canvas and draw a cluster of points each time a branch is drawn
         */ 
        private void branch(int x1, int y1, double length, double size, double redux, double thickness, double direction, double turnbias, Canvas canvas)
        {
            double guess = random.NextDouble();
            double nDirection = DELTATHETA * guess;

            (int x2, int y2, int size_c) = (x1, y1, 12);

            for (int i = 0; i < 2; i++)
            {

                if (i == 0)
                    direction += nDirection;
                if (i == 1)
                    direction += -nDirection * 2;
                line(x1, y1, 100, 40, 20, length, direction, thickness, canvas);
                
                x2 = x1 + (int)(length * Math.Cos(direction));
                y2 = y1 + (int)(length * Math.Sin(direction));

                if (size <= 1)
                    cluster(x2, y2, size_c, redux, turnbias, canvas);
                

                if (size > 1)
                    branch(x2, y2, length * LENGTHSCALE, size / redux, redux, thickness / 2, direction, turnbias, canvas);
            }


        }

        /*
         * draw a line segment (x1,y1) to (x2,y2) with given color, thickness on canvas
         */
        private void line(int x, int y, byte r, byte g, byte b, double length, double direction, double thickness, Canvas canvas)
        {

            Line myLine = new Line();
            SolidColorBrush mySolidColorBrush = new SolidColorBrush();
            mySolidColorBrush.Color = Color.FromArgb(255, r, g, b);
            myLine.X1 = x;
            myLine.Y1 = y;
            myLine.X2 = x + length * Math.Cos(direction);
            myLine.Y2 = y + length * Math.Sin(direction);
            myLine.Stroke = mySolidColorBrush;
            myLine.VerticalAlignment = VerticalAlignment.Center;
            myLine.HorizontalAlignment = HorizontalAlignment.Left;
            myLine.StrokeThickness = thickness;
            canvas.Children.Add(myLine);
        }

        /*
         * cluster draws a cluster at the given location and then draws a bunch of tendrils out in 
         * regularly-spaced directions out of the cluster.
         */
        private void cluster(int x, int y, double size, double redux, double turnbias, Canvas canvas)
        {
            for (int i = 0; i < tendrils; i++)
            {
                // compute the angle of the outgoing tendril
                double theta = i * 2 * Math.PI / tendrils;
                tendril(x, y, size, redux, turnbias, theta, canvas);
                if (size > branches)
                    berry(x, y, 5, canvas);
            }
        }

        /*
         * tendril draws a tendril (a randomly-wavy line) in the given direction, for the given length, 
         * and draws a cluster at the other end if the line is big enough.
         */
        private void tendril(int x1, int y1, double size, double redux, double turnbias, double direction, Canvas canvas)
        {
            int x2 = x1, y2 = y1;
            Random random = new Random();

            for (int i = 0; i < size; i++)
            {
                direction += (random.NextDouble() > turnbias) ? -1 * dir : dir;
                x1 = x2; y1 = y2;
                x2 = x1 + (int)(Length * Math.Sin(direction));
                y2 = y1 + (int)(Length * Math.Cos(direction));
                byte red = (byte)(100 + size / 2);
                byte green = (byte)(220 - size / 3);
                //if (size>120) red = 138; green = 108;
                line(x1, y1, red, green, 20, Length, dir, 11, canvas);
            }
            if (size > minTendrils)
                cluster(x2, y2, size / redux, redux, turnbias, canvas);
        }

        /*
         * draw a red circle centered at (x,y), radius radius, with a black edge, onto canvas
         */
        private void berry(int x, int y, double radius, Canvas canvas)
        {
            Ellipse myEllipse = new Ellipse();
            SolidColorBrush mySolidColorBrush = new SolidColorBrush();
            mySolidColorBrush.Color = Color.FromArgb(255, 255, 0, 0);
            myEllipse.Fill = mySolidColorBrush;
            myEllipse.StrokeThickness = 1;
            myEllipse.Stroke = Brushes.Black;
            myEllipse.HorizontalAlignment = HorizontalAlignment.Center;
            myEllipse.VerticalAlignment = VerticalAlignment.Center;
            myEllipse.Width = 2 * radius;
            myEllipse.Height = 2 * radius;
            myEllipse.SetCenter(x, y);
            canvas.Children.Add(myEllipse);
        }
    }
}

/*
 * this class is needed to enable us to set the center for an ellipse (not built in?!)
 */
public static class EllipseX
{
    public static void SetCenter(this Ellipse ellipse, double X, double Y)
    {
        Canvas.SetTop(ellipse, Y - ellipse.Height / 2);
        Canvas.SetLeft(ellipse, X - ellipse.Width / 2);
    }
}