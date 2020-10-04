TARGET=all.out
OBJS=factorial.o
TOPDIR=${PWD}

CFLAGS=-I${TOPDIR}/inc

all:$(TARGET)

$(TARGET):$(OBJS)
	gcc $^ -o $@

%.o:src/%.c

test.o:test.c

clean:
	rm -rf ${OBJS} ${TARGETS}
