 /* PlayList.h declares class PlayList.
    * Student Name: Advait Scaria
    * Date: 09/11/2018
    * Begun by: Joel Adams, for CS 112 at Calvin College.
    */

#ifndef PLAYLIST_H_
#define PLAYLIST_H_

#include "Song.h"
#include <vector>		//STL vector
#include <string>
using namespace std;

class PlayList {
public:
   PlayList(const string& fileName);
   unsigned getNumSongs() const;
   vector<Song> searchByArtist(const string& artist) const;
   vector<Song> searchByYear(unsigned year);
   void addSong(const Song& newSong);
   void removeSong(const Song& aSong);
   vector<Song> searchByTitlePhrase(const string& phrase);
   void save() const;
private:
   vector<Song> mySongs;
   string file;
};

#endif /*PLAYLIST_H_*/
