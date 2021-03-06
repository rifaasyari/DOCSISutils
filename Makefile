CC=gcc

OBJS1=cmversion.o
OBJS2=cmrestart.o
TARGETS=cmversion cmrestart

CFLAGS=-I. `net-snmp-config --cflags` -Wall -g
BUILDLIBS=`net-snmp-config --libs`
BUILDAGENTLIBS=`net-snmp-config --agent-libs`

# shared library flags (assumes gcc)
DLFLAGS=-fPIC -shared

all: $(TARGETS)


cmversion: $(OBJS1)
	$(CC) -o cmversion $(OBJS1) $(BUILDLIBS)

cmrestart: $(OBJS2)
	$(CC) -o cmrestart $(OBJS2) $(BUILDLIBS)

clean:
	rm $(OBJS1) $(TARGETS)
install:
	install -g wheel -o root -m 0755 $(TARGETS) /usr/local/bin
