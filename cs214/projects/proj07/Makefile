all: java ada

java: Names.class

Names.class: Names.java
	javac -deprecation Names.java


ada: names

names: names.adb
	gnatmake names -gnata


clean:
	rm -f *.class *.o *.ali *~ names

