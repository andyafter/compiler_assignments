build:
	gcc -o ./output/main_out main/main.c
	gcc -o ./output/csapp main/csapp.c
	gcc -o ./output/tiling main/tiling.c
	gcc -o ./tests/verify tests/verify.c
	gcc -o ./llvm/main.ll -S -emit-llvm main/main.c
	gcc -o ./output/main.s -S ./main/main.c
	gcc -o ./output/tiling.s -S ./main/tiling.c
	gcc -o ./output/csapp.s -S ./main/csapp.c
	gcc -c ./tests/scratch.s -o ./output/scratch.o
	gcc ./output/scratch.o -o scratch
run:
	./main_out

test:
	./tests/verify
