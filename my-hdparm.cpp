#include <stdio.h>
#include <sys/types.h>
#include "libhdparm/hdparm.h"

#define MAXCOUNT 1024

void print_usage(char *program);

int main(int argc, char **argv)
{
	char *file_name;
	struct block_info result[MAXCOUNT];
	int i, count;

	if (argc != 2) {
		print_usage(argv[0]);
		return -1;
	}

	file_name = argv[1];
	my_do_filemap(file_name, result, MAXCOUNT, &count);

	if (count > MAXCOUNT) {
		fprintf(stderr, "count (%d) > maxcount (%d)\n", count, MAXCOUNT);
		return -1;
	}
	
	for (i = 0; i < count; i++) {
		printf("%lu %u\n", result[i].begin_lba, result[i].length);
	}

	return 0;
}

void print_usage(char *program)
{
	fprintf(stderr, "usage: %s filename\n", program);	
}