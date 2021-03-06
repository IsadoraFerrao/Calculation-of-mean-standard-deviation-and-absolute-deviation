#!/bin/bash
gcc -o programa Calculo_Med_DesvPad_DesvRel.c -lm
echo "Executando Calculos Gprof..."

cp programa Gprof
cp programa Perf
cp programa Valgrind

cd Gprof
mkdir Media_DesvioPadrao_DesvioRelativo
./programa 30 saida1.txt
mv Calculo.txt Calculo1.txt 
mv Calculo1.txt Media_DesvioPadrao_DesvioRelativo
./programa 30 saida2.txt
mv Calculo.txt Calculo2.txt 
mv Calculo2.txt Media_DesvioPadrao_DesvioRelativo
cd ..

echo "Executando Calculos Perf..."
cd Perf
mkdir Media_DesvioPadrao_DesvioRelativo
./programa 30 saida1.txt
mv Calculo.txt Calculo1.txt 
mv Calculo1.txt Media_DesvioPadrao_DesvioRelativo
./programa 30 saida2.txt
mv Calculo.txt Calculo2.txt 
mv Calculo2.txt Media_DesvioPadrao_DesvioRelativo
cd ..

echo "Executando Calculos Valgrind..."
cd Valgrind
mkdir Media_DesvioPadrao_DesvioRelativo
./programa 30 saida1.txt
mv Calculo.txt Calculo1.txt 
mv Calculo1.txt Media_DesvioPadrao_DesvioRelativo
./programa 30 saida2.txt
mv Calculo.txt Calculo2.txt 
mv Calculo2.txt Media_DesvioPadrao_DesvioRelativo

echo "Execucao finalizada!"
