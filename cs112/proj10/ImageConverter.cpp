/*
 * ImageConverter.cpp declares a class for
 *  various image conversion operations.
 *
 *  Author:  Joel Adams, CS112 @ Calvin College.
 *  Student: Advait Scaria
 *  Date: 12/01/2018
 *  Created: March 2015
 *  Revised: November 2016
 */

#include "ImageConverter.h"
#include <unistd.h>            // sleep()

//-----------------  Method definitions ------------------------------

/* explicit constructor
 *
 * @param imageFileName, a string.
 * @param width, an int.
 * @param height, an int.
 *
 * Precondition: imageFileName contains the name of a valid image file
 *               && width > 0 && height > 0
 * Postcondition: myImageFileName == imageFileName
 *                && myWidth == width && myHeight = height
 *                && width x height Canvas containing the image
 *                    from imageFileName has been displayed on screen.
 */
ImageConverter::ImageConverter(const std::string& imageFileName, int width, int height)
 : myCanvas1(0, 0, width, height, imageFileName),
   myImageFileName(imageFileName),
   myWidth(width),
   myHeight(height)
{
    myCanvas1.start();
    myCanvas1.drawImage(myImageFileName, 0, 0, width, height);
    sleep(1);
}

/* destructor
 *
 * Precondition: this ImageConverter object is going out of scope.
 * Postcondition: myCanvas1 has disappeared from the screen.
 */
ImageConverter::~ImageConverter() {
    myCanvas1.wait();
    cout << "\nImageConverter terminated normally." << endl;
}

/* invertImage() inverts the image from myImageFileName.
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be inverted
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the inverse of the image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::invertImage() {
	// record starting time
	double startTime = omp_get_wtime();

	Canvas canvas2(myWidth + 50, 0, myWidth, myHeight,
			myImageFileName + " Inverted");
	canvas2.start();

	// loop through the image rows
	#pragma omp parallel for
	for (int row = 0; row < myHeight; row++) {
		// slow the processing to simulate a very large image
		canvas2.sleep();
		// loop through the image columns
		for (int col = 0; col < myWidth; col++) {
			// read the pixel at canvas1[row][col]
			ColorInt pixelColor = myCanvas1.getPixel(row, col);
			// compute its inverse
			int invertedR = 255 - pixelColor.R;
			int invertedG = 255 - pixelColor.G;
			int invertedB = 255 - pixelColor.B;
			// draw the inverse at the same spot in canvas2
			canvas2.drawPixel(row, col, ColorInt(invertedR, invertedG, invertedB));
		} // inner for
	} // outer for

	// compute and display the time difference
	double totalTime = omp_get_wtime() - startTime;
	cout << "\n\nImage inversion took " << totalTime << " seconds.\n" << endl;

	//save converted image
	canvas2.takeScreenShot();
	canvas2.wait();
} // invertImage

/* invertImage2() inverts the image from myImageFileName using a chunk sized 1 approach
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be inverted
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the inverse of the image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */
void ImageConverter::invertImage2() {

	Canvas canvas3(myWidth + 50, 0, myWidth, myHeight,
			myImageFileName + " Inverted, Chunk-Size 1");
	canvas3.start();

	// launch additional threads
	#pragma omp parallel
	{
		// how many workers do we have?
		unsigned numThreads = omp_get_num_threads();
		// which one am I?
		unsigned id = omp_get_thread_num();

		// loop through the image rows
		for (int row = id; row < myHeight; row += numThreads) {
			// slow the processing to simulate a very large image
			canvas3.sleep();
			// loop through the image columns
			for (int col = 0; col < myWidth; col++) {
				// read the pixel at canvas1[row][col]
				ColorInt pixelColor = myCanvas1.getPixel(row, col);
				// compute its inverse
				int invertedR = 255 - pixelColor.R;
				int invertedG = 255 - pixelColor.G;
				int invertedB = 255 - pixelColor.B;
				// draw the inverse at the same spot in canvas2
				canvas3.drawPixel(row, col, ColorInt(invertedR, invertedG, invertedB));
			} // inner for
		} // outer for
	} // #pragma omp parallel

	canvas3.wait();
} // invertImage2

/* invertImage3() inverts the image from myImageFileName using an equal sized chunk approach
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be inverted
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the inverse of the image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */
void ImageConverter::invertImage3() {

	Canvas canvas4(myWidth + 50, 0, myWidth, myHeight,
			myImageFileName + " Inverted, Equal-Sized Chunks ");
	canvas4.start();

	// launch additional threads
	#pragma omp parallel
	{
		// how many workers do we have?
		unsigned numThreads = omp_get_num_threads();
		// which one am I?
		unsigned id = omp_get_thread_num();

		// compute size of chunks (iterations % numThreads may != 0)
		double iterations = myHeight;
		unsigned chunkSize = (unsigned) ceil(iterations / numThreads);

		// compute starting and stopping index values
		int start = id * chunkSize;
		int stop = 0;
		if (id < numThreads - 1) {
			stop = start + chunkSize;
		} else {
			stop = myHeight;
		}

		// loop through image rows in equal-sized chunks
		for (int row = start; row < stop; row++) {
			// slow the processing to simulate a very large image
			canvas4.sleep();
			// loop through the image columns
			for (int col = 0; col < myWidth; col++) {
				// read the pixel at canvas1[row][col]
				ColorInt pixelColor = myCanvas1.getPixel(row, col);
				// compute its inverse
				int invertedR = 255 - pixelColor.R;
				int invertedG = 255 - pixelColor.G;
				int invertedB = 255 - pixelColor.B;
				// draw the inverse at the same spot in canvas2
				canvas4.drawPixel(row, col, ColorInt(invertedR, invertedG, invertedB));
			} // inner for
		} // outer for
	} // #pragma omp parallel

	canvas4.wait();
} // invertImage3

/* convertToBnW()--sequential: converts the image from myImageFileName to a black and white image.
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be converted
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the converted black and white image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::convertToBnW() {
	// record starting time
	double startTime = omp_get_wtime();

	Canvas canvas2(myWidth + 50, 0, myWidth, myHeight,
			myImageFileName + " Black and White");
	canvas2.start();

	for (int row = 0; row < myHeight; row++) {
		// slow the processing to simulate a very large image
		canvas2.sleep();
		// loop through the image columns
		for (int col = 0; col < myWidth; col++) {
			// read the pixel at canvas1[row][col]
			ColorInt pixelColor = myCanvas1.getPixel(row, col);
			int R; int G; int B;
			if (pixelColor.R + pixelColor.G + pixelColor.B > 383) {
				R = 255; G = 255; B = 255;
			} else {
				R = 0; G = 0; B = 0;
			}
			// draw the black and white pixel at the same spot in canvas2
			canvas2.drawPixel(row, col, ColorInt(R, G, B));
		} // inner for
	} // outer for

	// compute and display the time difference
	double totalTime = omp_get_wtime() - startTime;
	cout << "\n\nB&W image conversion took " << totalTime << " seconds.\n" << endl;

	//save converted image
	canvas2.takeScreenShot();
	canvas2.wait();
} // convertToBnW

/* convertToBnW2()--parallel: converts the image from myImageFileName to a black and white image
 * 							  using OpenMP parallel computing
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be converted
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the converted black and white image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::convertToBnW2() {
	// record starting time
	double startTime = omp_get_wtime();

	Canvas canvas2(myWidth + 50, 0, myWidth, myHeight,
			myImageFileName + " Black and White, Equal-Sized Chunks ");
	canvas2.start();

	#pragma omp parallel for
	for (int row = 0; row < myHeight; row++) {
		// slow the processing to simulate a very large image
		canvas2.sleep();
		// loop through the image columns
		for (int col = 0; col < myWidth; col++) {
			// read the pixel at canvas1[row][col]
			ColorInt pixelColor = myCanvas1.getPixel(row, col);
			int R; int G; int B;
			if (pixelColor.R + pixelColor.G + pixelColor.B > 383) {
				R = 255; G = 255; B = 255;
			} else {
				R = 0; G = 0; B = 0;
			}
			// draw the black and white pixel at the same spot in canvas2
			canvas2.drawPixel(row, col, ColorInt(R, G, B));
		} // inner for
	} // outer for

	// compute and display the time difference
	double totalTime = omp_get_wtime() - startTime;
	cout << "\n\nB&W parallel image conversion took " << totalTime << " seconds.\n" << endl;

	//save converted image
	canvas2.takeScreenShot();
	canvas2.wait();
} // convertToBnW2


/* flipV() -- sequential: flips the image from myImageFileName vertically.
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be flipped vertically
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the flipped version of the image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::flipV() {
	// record starting time
	double startTime = omp_get_wtime();

	Canvas canvas2(myWidth + 50, 0, myWidth, myHeight,
			myImageFileName + " Flip Vertically, ");
	canvas2.start();

	// loop through the image rows
	for (int row = 0; row < myHeight; row++) {
		// slow the processing to simulate a very large image
		canvas2.sleep();
		// loop through the image columns
		for (int col = 0; col < myWidth; col++) {
			// read the pixel at canvas1[row][col]
			ColorInt pixelColor = myCanvas1.getPixel(row, col);
			// draw the pixel
			canvas2.drawPixel(myHeight - row, col, pixelColor);
		} // inner for
	} // outer for

	// compute and display the time difference
	double totalTime = omp_get_wtime() - startTime;
	cout << "\n\nVertical flipping took " << totalTime << " seconds.\n" << endl;

	//save flipped image
	canvas2.takeScreenShot();
	canvas2.wait();
} // flipV

/* flipV2() -- parallel: flips the image from myImageFileName vertically.
 *
 * Precondition: myCanvas1 contains a TSGL Image that is to be flipped vertically
 *               && myWidth contains the number of columns in which to display the image
 *               && myHeight contains the number of rows in which to display the image.
 *
 * Postcondition: a myWidth x myHeight Canvas has been displayed
 *                 containing the flipped version of the image from myCanvas1
 *                 (which contains the image from myImageFileName).
 */

void ImageConverter::flipV2() {
	// record starting time
	double startTime = omp_get_wtime();

	Canvas canvas2(myWidth + 50, 0, myWidth, myHeight,
			myImageFileName + " Flip Vertically, ");
	canvas2.start();

	// loop through the image rows
	#pragma omp parallel for
	for (int row = 0; row < myHeight; row++) {
		// slow the processing to simulate a very large image
		canvas2.sleep();
		// loop through the image columns
		for (int col = 0; col < myWidth; col++) {
			// read the pixel at canvas1[row][col]
			ColorInt pixelColor = myCanvas1.getPixel(row, col);
			// draw the pixel
			canvas2.drawPixel(myHeight - row, col, pixelColor);
		} // inner for
	} // outer for

	// compute and display the time difference
	double totalTime = omp_get_wtime() - startTime;
	cout << "\n\nVertical flipping took " << totalTime << " seconds.\n" << endl;

	//save flipped image
	canvas2.takeScreenShot();
	canvas2.wait();
} // flipV2
