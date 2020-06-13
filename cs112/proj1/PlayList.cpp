 /* PlayList.cpp defines the PlayList methods.
    *
    * Student Name: Advait Scaria
    * Date: 09/11/2018
    * Begun by: Joel Adams, for CS 112 at Calvin College.
    */

#include "PlayList.h"
#include <fstream>      // ifstream
#include <cassert>      // assert()
using namespace std;

   /* PlayList constructor
    * @param: fileName, a string
    * Precondition: fileName contains the name of a playlist file.
    */
   PlayList::PlayList(const string& fileName) {
      // open a stream to the playlist file
      ifstream fin( fileName.c_str() );
      file = fileName;
      assert( fin.is_open() );

      // read each song and append it to mySongs
      Song s;
      string separator;
      while (true) {
          s.readFrom(fin);
          if ( !fin ) { break; }
          getline(fin, separator);
          mySongs.push_back(s);
      }

      // close the stream
      fin.close();
   }

   unsigned PlayList::getNumSongs() const {
	   return mySongs.size();
   }

   /* Search by artist
       * @param: artist, a string.
       * Precondition: artist must be a string
       * Return: a vector containing all the Songs in mySongs by artist.
       */
   vector<Song> PlayList::searchByArtist(const string& artist) const {
       vector<Song> v;

       for (unsigned i = 0; i < mySongs.size(); i++) {
          if ( mySongs[i].getArtist().find(artist) != string::npos ) {
               v.push_back( mySongs[i] );
          }
       }

       return v;
   }

   /* Search by year
          * @param: year, unsigned.
          * Return: a vector containing all the Songs in mySongs by year.
          */
   vector<Song> PlayList::searchByYear(unsigned year) {
	   vector<Song> w;

	   for (unsigned i = 0; i < mySongs.size(); i++) {
    	  if ( mySongs[i].getYear() == year ) {
    		  w.push_back( mySongs[i] );
    	  }
	   }

	   return w;
   }

   /* Search by title phrase
          * @param: phrase, a string.
          * Return: a vector containing all the Songs in mySongs that contains "phrase".
          */
   vector<Song> PlayList::searchByTitlePhrase(const string& phrase) {
   	   vector<Song> x;

   	   for (unsigned i = 0; i < mySongs.size(); i++) {
   		   if ( mySongs[i].getTitle().find(phrase) != string::npos ) {
   			   x.push_back( mySongs[i] );
   		   }
   	   }
   	   return x;
   }

   /* Add song -- adds the specified Song object to the mySongs vector
          * @param: newSong, a Song object.
          * Return: adds newSong to mySongs vector
          */
   void PlayList::addSong(const Song& newSong) {
	   mySongs.push_back(newSong);
   }

   /* Remove song -- removes the specified Song object from mySongs vector
            * @param: aSong, a Song object.
            * Return: removes aSong from mySongs vector
            */
   void PlayList::removeSong(const Song& aSong) {
	   for (unsigned i = 0; i < mySongs.size(); i++) {
		   if ( mySongs[i] == aSong ) {
			   mySongs.erase(mySongs.begin() + i);
	       }
	   }
   }

   /* Save -- updates the text file that was used to make the playlist by writing the contents of the playlist back to the text file
            * @param: none
            * Return: none
            */
   void PlayList::save() const {
	   ofstream fout( file.c_str() );
	   assert( fout.is_open() );

	   for (unsigned i = 0; i < mySongs.size(); i++) {
		   mySongs[i].writeTo(fout);
		   fout << '\n';
	   }
	   fout.close();
   }
