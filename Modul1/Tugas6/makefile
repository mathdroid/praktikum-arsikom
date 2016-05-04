all: main_text

main_text: main_text.o text.o
	gcc main_text.o text.o -o main_text

main_text.o: main_text.c
	gcc -c main_text.c

text.o: text.c
	gcc -c text.c
