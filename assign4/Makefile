build:
	gcc -o ./output/main_out main/main.c
	gcc -o ./output/main_out main/main.c
	gcc -o ./tests/verify tests/verify.c
	gcc -o ./llvm/main.ll -S -emit-llvm main/main.c
	gcc -o ./output/main.s -S ./main/main.c
	gcc -o ./output/tiling.s -S ./main/tiling.c
	gcc -o ./output/csapp.s -S ./main/csapp.c
run:
	./main_out

test:
	./tests/verify
