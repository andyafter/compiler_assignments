build:
	gcc -o ./main_out main/main.c
	gcc -o ./main_out main/main.c
	gcc -o ./tests/verify tests/verify.c
	gcc -o ./llvm/main.ll -S -emit-llvm main/main.c
run:
	./main_out

test:
	./tests/verify
