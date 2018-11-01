CC=gcc
MKDIR_P = mkdir -p

ODIR=obj

_OBJ = hello.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

.PHONY: directories

all: directories hello

directories: ${ODIR}

${ODIR}:
	$(MKDIR_P) ${ODIR}

$(ODIR)/%.o: %.c
	$(CC) -c -o $@ $<

hello: $(OBJ)
	$(CC) -o $@ $^

.PHONY: clean

clean:
	rm -rf $(ODIR) *~ core hello

.PHONY: info

info:
	echo "CC = $(CC)"
	echo "ODIR = $(ODIR)"
	echo "OBJ = $(OBJ)"
