# This Makefile includes the text file stringtable.txt into the
#   executable gcc-embed-data, as a raw block of data.

# Include the string data in the dependencies of the final executable,
#   so that 'make' will re-link if the stringtable changes.
gcc-embed-data: gcc-embed-data.o stringtable.txt 
	gcc -o gcc-embed-data \
	-Wl,--format=binary stringtable.txt \
	-Wl,--format=default \
	gcc-embed-data.o

# Ordinary compilation of the C source
gcc-embed-data.o: gcc-embed-data.c
	gcc -g -Wall -Werror -o gcc-embed-data.o -c gcc-embed-data.c

clean:
	rm -f *.o gcc-embed-data

