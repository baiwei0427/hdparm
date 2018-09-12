CC ?= g++
STRIP ?= strip

CFLAGS := -O2 -W -Wall -Wbad-function-cast -Wcast-align -Wpointer-arith -Wcast-qual -Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -fkeep-inline-functions -Wwrite-strings -Waggregate-return -Wnested-externs -Wtrigraphs $(CFLAGS)
LDFLAGS = -s

OBJS = my-hdparm.o libhdparm/fibmap.o libhdparm/geom.o libhdparm/sysfs.o

all: my-hdparm

my-hdparm: $(OBJS)
	make -C libhdparm
	$(CC) $(LDFLAGS) -o my-hdparm $(OBJS)
	$(STRIP) my-hdparm

my-hdparm.o: my-hdparm.cpp libhdparm/hdparm.h
	$(CC) $(CFLAGS) -c -o my-hdparm.o my-hdparm.cpp

clean:
	-rm -f my-hdparm *.o core 2>/dev/null
	make clean -C libhdparm