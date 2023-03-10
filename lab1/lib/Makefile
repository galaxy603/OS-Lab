#lab1/lib/Makefile
C_SRC	= $(sort $(wildcard *.c))
OBJ	= $(patsubst %.c,%.o,$(C_SRC))

file = print.o
all:$(OBJ)

$(OBJ): %.o: %.c
	${GCC} ${CFLAG} -c $<
clean:
	$(shell rm *.o 2>/dev/null)
