/*
 * main.cpp is a driver for an ImageConverter program
 *  using OpenMP to parallelize the image processing
 *  and TSGL to view the processing in near real time.
 *
 * Author: Joel Adams, for CS 112 at Calvin College.
 * Student: Advait Scaria
 * Date: 12/01/2018
 * Created: March 2015.
 * Revised: November 2016.
 */

#include "ImageConverter.h"

int main() {
	omp_set_num_threads(16);

    ImageConverter iConverter("pics/beads.jpg", 800, 800);
//  iConverter.invertImage();
//  iConverter.invertImage2();
//  iConverter.invertImage3();

    iConverter.convertToBnW();			// Black & White sequential
    iConverter.convertToBnW2();			// Black & White parallel

    iConverter.flipV();					// Vertical Flip sequential
    iConverter.flipV2();				// Vertical Flip parallel
}
