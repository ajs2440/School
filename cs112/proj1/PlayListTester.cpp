/* PlayListTester.cpp defines the PlayList test-methods.
    * Student Name: Advait Scaria
    * Date: 09/11/2018
    * Begun by: Joel Adams, for CS 112 at Calvin College.
    */

#include "PlayListTester.h"
#include "PlayList.h"
#include "Song.h"
#include <iostream>
#include <ostream>
#include <fstream>
#include <cassert>
using namespace std;

void PlayListTester::runTests() {
   cout << "\nTesting class PlayList..." << endl;
   testConstructors();
   cout << "All tests passed!" << endl;
}

void PlayListTester::testConstructors() {
      cout << "- constructors..." << flush;
      PlayList pList("testSongs.txt");
      assert( pList.getNumSongs() == 4 );
      cout << " 0 " << flush;
      cout << " Passed!" << endl;
      testSearchByArtist();
      testSearchByYear();
      testSearchByTitlePhrase();
      testAddSong();
      testRemoveSong();
      testSave();
}

void PlayListTester::testSearchByArtist() {
      cout << "- searchByArtist()... " << flush;
      // load a playlist with test songs

      PlayList pList("testSongs.txt");
      // empty case (0)
      vector<Song> searchResult = pList.searchByArtist("Cream");
      assert( searchResult.size() == 0 );
      cout << " 0 " << flush;

      // case of 1
      searchResult = pList.searchByArtist("Baez");
      assert( searchResult.size() == 1 );
      assert( searchResult[0].getTitle() == "Let It Be" );
      cout << " 1 " << flush;

      // case of 2
      searchResult = pList.searchByArtist("Beatles");
      assert( searchResult.size() == 2 );
      assert( searchResult[0].getTitle() == "Let It Be" );
      assert( searchResult[1].getTitle() == "Penny Lane" );
      cout << " 2 " << flush;

      cout << " Passed!" << endl;
}

void PlayListTester::testSearchByYear() {
      cout << "- searchByYear()... " << flush;
      // load a playlist with test songs
      PlayList pList("testSongs.txt");

      // empty case (0)
      vector<Song> searchResult = pList.searchByYear (2015);
      assert( searchResult.size() == 0 );
      cout << " 0 " << flush;

      // case of 1 -- returns 1 song
      searchResult = pList.searchByYear (2012);
      assert( searchResult.size() == 1 );
      assert( searchResult[0].getTitle() == "Call Me Maybe" );
      cout << " 1 " << flush;

      // case of 2 -- returns 2 songs
      searchResult = pList.searchByYear (1967);
      assert( searchResult.size() == 2 );
      assert( searchResult[0].getTitle() == "Let It Be" );
      assert( searchResult[1].getTitle() == "Penny Lane" );
      cout << " 2 " << flush;

      cout << " Passed!" << endl;
}

void PlayListTester::testSearchByTitlePhrase() {
	cout << "- searchByTitlePhrase()... " << flush;

	// load a playlist with test songs
	PlayList pList("testSongs.txt");

	// empty case (0)
	vector<Song> searchResult = pList.searchByTitlePhrase("LOL");
	assert( searchResult.size() == 0 );
	cout << " 0 " << flush;

	// case of 1 -- returns 1 song
	searchResult = pList.searchByTitlePhrase ("Maybe");
	assert( searchResult.size() == 1 );
	assert( searchResult[0].getTitle() == "Call Me Maybe" );
	cout << " 1 " << flush;

	// case of 2 -- returns 2 songs
	searchResult = pList.searchByTitlePhrase ("Let");
	assert( searchResult.size() == 2 );
	assert( searchResult[0].getTitle() == "Let It Be" );
	assert( searchResult[1].getTitle() == "Let It Be" );
	cout << " 2 " << flush;

	cout << " Passed!" << endl;
}

void PlayListTester::testAddSong() {
	cout << "- addSong()... " << flush;

	// declare a song and playlist
	Song s1("Badge", "Cream", 1969);
	PlayList p1("testSongs.txt");

	// add declared song to playlist
	p1.addSong(s1);

	// check the size of the playlist, if it's 5 the new song was added,
	// search for the song that was added, and assert that it's the same song by checking for title
	assert (p1.getNumSongs() == 5);
	vector<Song> searchResult = p1.searchByTitlePhrase("Badge");
	assert (searchResult.size() == 1);
	assert (searchResult[0].getTitle() == "Badge");
	cout << " 0 " << flush;

	cout << " Passed!" << endl;
}

void PlayListTester::testRemoveSong() {
	cout << "- removeSong()... " << flush;

	// declare the song to remove and the playlist
	Song s1("Badge", "Cream", 1969);
	PlayList p1("testSongs.txt");

	// remove declared song from playlist
	p1.removeSong(s1);

	// check the size of the playlist, if it's 4 the specified song was removed
	assert (p1.getNumSongs() == 4);

	// check that there's no song in the playlist called "Badge"
	vector<Song> searchResult = p1.searchByTitlePhrase("Badge");
	assert (searchResult.size() == 0);
	cout << " 0 " << flush;

	cout << " Passed!" << endl;
}

void PlayListTester::testSave() {
	cout << "- save()... " << flush;

	// Make playlist object, add song to playlist object, save object
	Song s1("Lol", "What", 2017);
	PlayList p1("testSongs.txt");
	assert (p1.getNumSongs() == 4);
	p1.addSong(s1);
	p1.save();

	// Test that playlist has 5 items now, and that there's the new song object in the playlist
	assert (p1.getNumSongs() == 5);
	vector<Song> searchResult = p1.searchByTitlePhrase("Lol");
	assert (searchResult.size() == 1);
	assert (searchResult[0].getTitle() == "Lol");
	cout << " 0 " << flush;

	// Remove the song you just added (so that other test code works)
	p1.removeSong(s1);
	p1.save();
	assert (p1.getNumSongs() == 4);
	vector<Song> searchResult2 = p1.searchByTitlePhrase("Lol");
	assert(searchResult2.size() == 0);
	cout << " 1 " << flush;

	cout << " Passed!" << endl;
}
