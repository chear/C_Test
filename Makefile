.PHONY:all clean
CFLAGS=-ansi -Wall -pedantic -std=c99 
LFLAGS=-lm 
CC=gcc
## -ansi 		ANSI/ISO C标准
## -Wall		GCC产生尽可能多的警告信息
## -pedantic	选项能够帮助程序员发现一些不符合 ANSI/ISO C标准的代码，但不是全部，事实上只有ANSI/ISO C语言标准中要求进行编译器诊断的那些情况，才有可能被GCC发现并提出警告
## -std=c99		C-99 standard

## To make all
all:1_ 3_ 4_ mkApp

## sample to make the whole App
SOURCES=2_callback_handler_test.c 
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=test_app 

mkApp:$(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

%.o:%.c
	$(CC) $(CFLAGS) -o %@ -c %<

## To make the Test App
1_:1_.o
	$(CC) $(CFLAGS) -o 1_pointer_test 1_pointer_test.o

1_.o:1_pointer_test.c
	$(CC) $(CFLAGS) -c 1_pointer_test.c

2_handle:2_handle.o
	$(CC) $(CFLAGS) -o 2_callback_handler_test 2_callback_handler_test.o 

2_handle.o:2_callback_handler_test.c header.h 
	$(CC) $(CFLAGS) -c 2_callback_handler_test.c 

3_:3_.o
	$(CC) $(CFLAGS) -o 3_array_test 3_array_test.c 

3_.o:3_array_test.c 
	$(CC) $(CFLAGS) -c 3_array_test.c

4_:4_.o
	$(CC) $(CFLAGS) -o 4_fork 4_process_fork.c 

4_.o:4_process_fork.c 
	$(CC) $(CFLAGS) -c 4_process_fork.c 

## Old one should be remove
##all:mk1 mk2
##
##mk1:1_pointer_test.o
##	gcc -std=c99 -c 1_pointer_test.c 
##	gcc -o 1_pointer_test 1_pointer_test.o 
###	./1_pointer_test.exe
##	chmod 777 ./1_pointer_test
##	./1_pointer_test
##
##mk2:2_callback_handler_test.o
## 	gcc -c 2_callback_handler_test.c
##	gcc -o 2_callback_handler_test 2_callback_handler_test.o 
##	ls -la ./
##	./2_callback_handler_test.exe
##
##

clean:
	rm -f main *.o *.exe *.exe.stackdump  1_pointer_test 2_callback_handler_test 3_array_test 4_fork
