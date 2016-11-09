build:
	gcc -o ./output/main.o main/main.c
	gcc -o outmain main/tiling.c
	gcc -o ./transpose main/vec.c
	gcc -o ./output/csapp.o main/csapp.c
	gcc -o ./output/tiling.o main/tiling.c
	gcc -o ./tests/verify.o tests/verify.c
	#gcc -o ./llvm/main.ll -S -emit-llvm main/main.c
	gcc -o ./output/main.s -S ./main/main.c
	gcc -o ./output/tiling.s -S ./main/tiling.c
	gcc -o ./output/csapp.s -S ./main/csapp.c
	#gcc -c ./tests/scratch.s -o ./output/scratch.o
	gcc -c ./tests/basic.s -o ./output/basic_test.o
	#gcc ./output/scratch.o -o scratch
	gcc ./output/basic_test.o -o basic_test
run:
	./main_out

test:
	./tests/verify
