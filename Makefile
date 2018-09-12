CC ?= gcc
STRIP ?= strip

CFLAGS := -O2 -W -Wall -Wbad-function-cast -Wcast-align -Wpointer-arith -Wcast-qual -Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -fkeep-inline-functions -Wwrite-strings -Waggregate-return -Wnested-externs -Wtrigraphs $(CFLAGS)
LDFLAGS = -s

OBJS = my-hdparm.o libhdparm/fibmap.o libhdparm/geom.o libhdparm/sysfs.o

all: my-hdparm

my-hdparm: libhdparm/hdparm.h $(OBJS)
	$(CC) $(LDFLAGS) -o my-hdparm $(OBJS)
	$(STRIP) my-hdparm

clean:
	-rm -f my-hdparm *.o core 2>/dev/null