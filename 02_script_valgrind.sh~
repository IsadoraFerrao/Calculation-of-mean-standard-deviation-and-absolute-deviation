#!/bin/bash
TAM=30
mkdir Valgrind_Execucoes1
mkdir Valgrind_Execucoes2
for ((j=1; j <= $TAM; j++))
do
	echo "Executando Soma $j..."
	gcc -o programa1 somavetores1.c -fopenmp
	./programa1 >> saida1.txt
	valgrind --tool=cachegrind ./programa1 &> Valgrind_profile1_$j.txt
	
	gcc -o programa2 somavetores2.c -fopenmp
	./programa2 >> saida2.txt
	valgrind --tool=cachegrind ./programa2 &> Valgrind_profile2_$j.txt
	
	mv Valgrind_profile1_$j.txt Valgrind_Execucoes1
	mv Valgrind_profile2_$j.txt Valgrind_Execucoes2 
done
mv Valgrind_Execucoes1 Valgrind
mv Valgrind_Execucoes2 Valgrind
mv programa1 Valgrind
mv programa2 Valgrind
mv saida1.txt Valgrind
mv saida2.txt Valgrind
cp somavetores1.c Valgrind
cp somavetores2.c Valgrind
