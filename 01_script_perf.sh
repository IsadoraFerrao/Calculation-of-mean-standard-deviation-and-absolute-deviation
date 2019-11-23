#!/bin/bash
TAM=30
mkdir Perf_Execucoes1
mkdir Perf_Execucoes2
for ((j=1; j <= $TAM; j++))
do
	echo "Executando Soma $j..."
	gcc -o programa1 somavetores1.c -fopenmp
	./programa1 >> saida1.txt
	perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches ./programa1 &> Perf_profile1_$j.txt
	
	gcc -o programa2 somavetores2.c -fopenmp
	./programa2 >> saida2.txt
	perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches ./programa2 &> Perf_profile2_$j.txt
	
	mv Perf_profile1_$j.txt Perf_Execucoes1
	mv Perf_profile2_$j.txt Perf_Execucoes2 
done
mv Perf_Execucoes1 Perf
mv Perf_Execucoes2 Perf
mv programa1 Perf
mv programa2 Perf
mv saida1.txt Perf
mv saida2.txt Perf
cp somavetores1.c Perf
cp somavetores2.c Perf
