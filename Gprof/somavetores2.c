#include<stdio.h>
#include<stdlib.h>
#include<omp.h>

#define TAM 10000

int *aloca(int *vetor){
	vetor = (int*)malloc(TAM*sizeof(int));
	return vetor;
}

void desaloca(int *vetor1, int *vetor2, int *vetor3){
	free(vetor1);
	free(vetor2);
	free(vetor3);
}

void inicializa(int *vetor1, int *vetor2, int *vetor3){
	int i;
	for(i = 0; i < TAM; i++){
		vetor1[i] = (i*5);
		vetor2[i] = (i*10);
		vetor3[i] = (i*15);
	}
}

void soma(int *vetor1, int *vetor2, int *vetor3){
	int i;
	for(i = 0; i < TAM; i++){
		vetor3[i] = vetor1[i] + vetor2[i];
	}
}

void imprime(int *vetor1, int *vetor2, int *vetor3){
	int i;
	for(i = 0; i < TAM; i++){
		printf("VETOR1[%d] = %d;\nVETOR2[%d] = %d;\nVETOR3[%d] = %d;\n\n", i, vetor1[i], i, vetor2[i], i, vetor3[i]);
	}
}

//gcc -o programa somavetores.c -fopenmp
//./programa

int main (){
	int *vetor1, *vetor2, *vetor3;
	int clockBegin;
	double timeElapsed;
	vetor1=aloca(vetor1);
	vetor2=aloca(vetor2);
	vetor3=aloca(vetor3);
	inicializa(vetor1, vetor2, vetor3);
	
	clockBegin = omp_get_wtime();
	soma(vetor1, vetor2, vetor3);
	timeElapsed = (omp_get_wtime() - clockBegin);	
	printf("%5lf\n", timeElapsed);
	
	//imprime(vetor1, vetor2, vetor3);
	desaloca(vetor1, vetor2, vetor3);
	return 0;
}
