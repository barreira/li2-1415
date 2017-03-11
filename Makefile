CFLAGS = -Wall -Wextra -ansi -pedantic -o2
OBJS = $(patsubst %.c, %.o, $(wildcard *.c))
bn : $(OBJS)
	$(CC) $(CFLAGS) -o bn $(OBJS) $(LIBS)
limpar :
	rm bn *.o