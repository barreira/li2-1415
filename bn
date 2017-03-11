/** NOTA: foi elaborado um relatório (ficheiro "relatorio.pdf" colocado na mesma diretoria deste ficheiro .c) onde consta uma descrição mais detalhada e precisa do que aquela que está presente nos comentários e na documentação deste ficheiro. */ 

/** Inclusão das libraries que irão ser usadas e definição das variáveis 1024 e 100 que serão utilizadas nas funções mais à frente */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct elem {
	int l;
	int c;
	char ant;
	int numcmd;
} ELEM;

typedef struct stack {
	ELEM cabeca;
	struct stack *prox;
} STACK;

/** Estrutura que serve para a definição do tabuleiro 

numlinhas - número de linhas que o tabuleiro tem;
numcolunas - número de colunas que o tabuleiro tem;
segmentos_linhas[100] - número de figuras existentes numa linha do tabuleiro;
segmentos_colunas[100] - número de figuras existentes numa coluna do tabuleiro;
tabuleiro[100][100] - carater que está numa posição do tabuleiro.
*/
typedef struct estrutura_bn{
	int numlinhas;
	int numcolunas;
	int segmentos_linhas[100];
	int segmentos_colunas[100];
	char tabuleiro[100][100];
	STACK *s;
} ESTRUTURA_BN;

void init (STACK** s) {
	*s = malloc(sizeof(STACK));
	(*s)->cabeca.numcmd = 0;
	(*s)->prox = NULL;
}

void push (STACK** s, int lin, int col, char seg, int YorN) {
	STACK * temp;
	temp = (STACK*) malloc(sizeof(STACK));
	if (temp == NULL) return;
	temp->cabeca.l = lin;
	temp->cabeca.c = col;
	temp->cabeca.ant = seg;
	temp->prox = *s;
	if (YorN == 1) {
		temp->cabeca.numcmd = (*s)->cabeca.numcmd + 1;		
	}
	if (YorN == 0) {
		temp->cabeca.numcmd = (*s)->cabeca.numcmd;
	}
	*s = temp;
}

int isEmpty (STACK *s) {
	return (s==NULL);
}

void pop (STACK** s) {
	STACK *temp = *s;
	if (isEmpty(*s)) return;
	*s = (*s)->prox;
	free(temp);
}

ELEM top (STACK *s) {
	if (isEmpty(s)) {
		ELEM invalido = {-1, -1, '\0', -1};
        return invalido;
	} else {
		return s->cabeca;
	}
}

/** Função responsável pela execução do comando c que lê o tabuleiro a partir do standard input.

Recebe como argumento a estrutura de dados.
*/

int cmd_c (ESTRUTURA_BN *est_bn) {
	char linha[1024];
	char restolinha[1024];
	int lin, col;
	/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
	fgets(linha, 1024, stdin);
	/** Função sscanf() que que lê a string linha e copia os dois inteiros correspondentes ao número de linhas e ao número de colunas do tabuleiro que vêm do standard input para as variáveis numlinhas e numcolunas da estrutura de dados.*/
	sscanf(linha, "%d %d", &est_bn->numlinhas, &est_bn->numcolunas);
	/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
	fgets(linha, 1024, stdin);
	/** Ciclo for que percorre as linhas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** Função sscanf() que vai retirando os inteiros da linha do standard input e armazenando-os no campo segmentos_linhas da estrutura de dados (para cada uma das linhas do tabuleiro). Além disso copia o resto da string (até ao \n, exclusive) para a variavel restolinha.*/
		sscanf(linha, "%d %[^/n]", &est_bn->segmentos_linhas[lin], restolinha);
		/** Função strcpy() que copia o conteúdo da string restolinha para a string linha */
		strcpy(linha, restolinha);
	}
	/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
	fgets(linha, 1024, stdin);
	/** Ciclo for que percorre as colunas do tabuleiro */
	for(col=0; col<est_bn->numcolunas; col++){
		/** Função sscanf() que vai retirando os inteiros da linha do standard input e armazenando-os no campo segmentos_linhas da estrutura de dados (para cada uma das linhas do tabuleiro). Além disso copia o resto da string (até ao \n, exclusive) para a variavel restolinha.*/
		sscanf(linha, "%d %[^/n]", &est_bn->segmentos_colunas[col], restolinha);
		/** Função strcpy() que copia o conteúdo da string restolinha para a string linha */
		strcpy(linha, restolinha);
	}
	/** Ciclo for que percorre as linhas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
		fgets(linha, 1024, stdin);
		/** Ciclo for que percorre as colunas do tabuleiro */
		for(col=0; col<est_bn->numcolunas; col++){
			/** Vai colocando em cada coluna de uma mesma linha do tabuleiro os carateres que estão na string "linha" retirada do standard input (e vai avançando as linhas, fazendo o mesmo para cada uma delas). */
			est_bn->tabuleiro[lin][col] = linha[col];
		}
	}
	return 1;
}

/** Função responsável pela execução do comando m que mostra o tabuleiro no standard output.

Recebe como argumento a estrutura de dados.
*/
int cmd_m (ESTRUTURA_BN *est_bn) {
	int lin, col;
	/** Ciclo for que percorre as linhas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** Ciclo for que percorre as colunas do tabuleiro */
		for(col=0; col<est_bn->numcolunas; col++){
			/** Imprime em cada posição do tabuleiro (no standard output) o carater correspondente (que vem da estrutura de dados) */
			printf("%c", est_bn->tabuleiro[lin][col]);
		}
		/** No final de cada linha imprime o inteiro correspondente ao número de figuras que estão naquela linha. Muda de linha também. */
		printf(" %d\n", est_bn->segmentos_linhas[lin]);
	}
	/** Ciclo for que percorre as colunas do tabuleiro */
	for(col=0; col<est_bn->numcolunas; col++){
		/** No final de cada coluna imprime o inteiro correspondente ao número de figuras que estão naquela coluna */
		printf("%d", est_bn->segmentos_colunas[col]);
	}
	/** Muda de linha */
	printf("\n");
	return 1;
}

/** Função responsável pela execução do comando p que recebe um carater, uma linha e uma coluna do standard input e coloca esse carater na posição do tabuleiro recebida. 

Esta função recebe como argumentos a estrutura de dados, o comando e o primeiro e segundo argumentos detetado pela função interpretar (que vêm do standard input aquando do chamamento da função).
*/

int cmd_p_interp (ESTRUTURA_BN *est_bn, char *comando, char *arg1, char *arg2) {
	int numCol, numLin;
	/** A função atoi atua no argumento que vem do standard input (através da função interpretar) e transforma-o num inteiro. Este inteiro é referente à linha onde esta função deve ser executada. Após alguns testes, ao nos apercebermos de que esta função estava a atuar em posições uma linha acima do pretendido, resolvemos subtrair uma unidade ao valor obtido da execução da função atoi.*/
	numLin = atoi(arg1) - 1;
	/** A função atoi atua no argumento que vem do standard input (através da função interpretar) e transforma-o num inteiro. Este inteiro é referente à coluna onde esta função deve ser executada. Após alguns testes, ao nos apercebermos de que esta função estava a atuar em posições uma coluna acima do pretendido, resolvemos subtrair uma unidade ao valor obtido da execução da função atoi.*/
	numCol = atoi(arg2) - 1;
	if (est_bn->tabuleiro[numLin][numCol] != comando[1]) {
		push (&est_bn->s, numLin+1, numCol+1, est_bn->tabuleiro[numLin][numCol], 1);
	}
	/** Vai à posição do tabuleiro cuja linha e coluna são iguais a numLin e numCol (que foram recebidos do standard input) e substitui o carater que lá está pelo carater invocado no standard input aquando do chamamento da função p; para isso chamamos o carater de índice 1 do "comando" que vem do interpretador (e.g. o "<" em "p< 1 2). */
	est_bn->tabuleiro[numLin][numCol] = comando[1];
	return 1;
}

int cmd_p_aux (ESTRUTURA_BN *est_bn, char carater, int numLin, int numCol, int YorN) {
	if ((carater == '.') && (numLin == -1) && (numCol == -1)) {
		push (&est_bn->s, numLin+1, numCol+1, est_bn->tabuleiro[numLin][numCol], 1);
	} else {
		if (est_bn->tabuleiro[numLin][numCol] != carater) {
			if (YorN == 1) push (&est_bn->s, numLin+1, numCol+1, est_bn->tabuleiro[numLin][numCol], 1);
			if (YorN == 0) push (&est_bn->s, numLin+1, numCol+1, est_bn->tabuleiro[numLin][numCol], 0);
		}		
	}
	est_bn->tabuleiro[numLin][numCol] = carater;
	return 1;
}

/** Função responsável pela execução do comando h que coloca o estado de todas as grelhas da linha recebida que ainda não estão determinadas como sendo água (i.e. substitui '.' por '~' numa determinada linha) 

Esta função recebe como argumentos a estrutura de dados e o primeiro argumento detetado pela função interpretar (que vêm do standard input aquando do chamamento da função).
*/
int cmd_h (ESTRUTURA_BN *est_bn, char *arg) {
	int numLin, col;
	/** A função atoi atua no argumento que vem do standard input (através da função interpretar) e transforma-o num inteiro. Este inteiro é referente à linha onde esta função deve ser executada. Após alguns testes, ao nos apercebermos de que esta função estava a atuar em posições uma linha acima do pretendido, resolvemos subtrair uma unidade ao valor obtido da execução da função atoi.*/
	numLin = atoi(arg) - 1;
	/** Ciclo for que percorre as colunas do tabuleiro */
	for (col=0; col<est_bn->numcolunas; col++) {
		if (est_bn->tabuleiro[numLin][col] == '.') {
			cmd_p_aux (est_bn, '~', numLin, col, 1);
			break;
		}
	}
	while (col < est_bn->numcolunas) {
		/** Verifica se o carater da posição é um "." (não determinado) e, em caso afirmativo, substitui esse carater por "~" (água) */
		if ((est_bn->tabuleiro[numLin][col] == '.')) {
			cmd_p_aux (est_bn, '~', numLin, col, 0);
		}
		col++;	
	}
	return 1;
}

/** Função responsável pela execução do comando v que coloca o estado de todas as grelhas da coluna recebida que ainda não estão determinadas como sendo água (i.e. substitui '.' por '~' numa determinada coluna).

Esta função recebe como argumentos a estrutura de dados e o primeiro argumento detetado pela função interpretar (que vêm do standard input aquando do chamamento da função).
*/
int cmd_v (ESTRUTURA_BN *est_bn, char *arg) {
	int numCol, lin;
	/** A função atoi atua no argumento que vem do standard input (através da função interpretar) e transforma-o num inteiro. Este inteiro é referente à coluna onde esta função deve ser executada. Após alguns testes, ao nos apercebermos de que esta função estava a atuar em posições uma coluna acima do pretendido, resolvemos subtrair uma unidade ao valor obtido da execução da função atoi.*/
	numCol = atoi(arg) - 1;
	for (lin=0; lin<est_bn->numlinhas; lin++) {
		if (est_bn->tabuleiro[lin][numCol] == '.') {
			cmd_p_aux (est_bn, '~', lin, numCol, 1);
			break;
		}
	}
	while (lin < est_bn->numlinhas) {
		/** Verifica se o carater da posição é um "." (não determinado) e, em caso afirmativo, substitui esse carater por "~" (água) */
		if ((est_bn->tabuleiro[lin][numCol] == '.')) {
			cmd_p_aux (est_bn, '~', lin, numCol, 0);
		}
		lin++;
	}
	return 1;
}

int cmd_e (ESTRUTURA_BN *est_bn, char *nomeficheiro) {
	int lin, col;
	FILE *fp;
	fp=fopen(nomeficheiro, "w");
	fprintf(fp, "%d %d\n", est_bn->numlinhas, est_bn->numcolunas);		
	/** Ciclo for que percorre as colunas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** No final de cada coluna imprime o inteiro correspondente ao número de figuras que estão naquela coluna */
		fprintf(fp, "%d", est_bn->segmentos_linhas[lin]);
		if (lin<est_bn->numlinhas-1)
			fprintf(fp, " ");
	}
	/** Muda de linha */
	fprintf(fp, "\n");
	/** Ciclo for que percorre as colunas do tabuleiro */
	for(col=0; col<est_bn->numcolunas; col++){
		/** No final de cada coluna imprime o inteiro correspondente ao número de figuras que estão naquela coluna */
		fprintf(fp, "%d", est_bn->segmentos_colunas[col]);
		if (col<est_bn->numcolunas-1)
			fprintf(fp, " ");		
	}
	/** Muda de linha */
	fprintf(fp, "\n");
	/** Ciclo for que percorre as linhas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** Ciclo for que percorre as colunas do tabuleiro */
		for(col=0; col<est_bn->numcolunas; col++){
			/** Imprime em cada posição do tabuleiro (no standard output) o carater correspondente (que vem da estrutura de dados) */
			fprintf(fp, "%c", est_bn->tabuleiro[lin][col]);
		}
		fprintf(fp, "\n");
	}
	fclose(fp);
	return 1;
}

int cmd_l (ESTRUTURA_BN *est_bn, char *nomeficheiro) {
	char linha[1024];
	char restolinha[1024];	
	int lin, col;
	FILE *fp;
	fp=fopen(nomeficheiro, "r");
	/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
	fgets(linha, 1024, fp);
	/** Função sscanf() que que lê a string linha e copia os dois inteiros correspondentes ao número de linhas e ao número de colunas do tabuleiro que vêm do standard input para as variáveis numlinhas e numcolunas da estrutura de dados.*/
	sscanf(linha, "%d %d", &est_bn->numlinhas, &est_bn->numcolunas);
	/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
	fgets(linha, 1024, fp);
	/** Ciclo for que percorre as linhas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** Função sscanf() que vai retirando os inteiros da linha do standard input e armazenando-os no campo segmentos_linhas da estrutura de dados (para cada uma das linhas do tabuleiro). Além disso copia o resto da string (até ao \n, exclusive) para a variavel restolinha.*/
		sscanf(linha, "%d %[^/n]", &est_bn->segmentos_linhas[lin], restolinha);
		/** Função strcpy() que copia o conteúdo da string restolinha para a string linha */
		strcpy(linha, restolinha);
	}
	/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
	fgets(linha, 1024, fp);
	/** Ciclo for que percorre as colunas do tabuleiro */
	for(col=0; col<est_bn->numcolunas; col++){
		/** Função sscanf() que vai retirando os inteiros da linha do standard input e armazenando-os no campo segmentos_linhas da estrutura de dados (para cada uma das linhas do tabuleiro). Além disso copia o resto da string (até ao \n, exclusive) para a variavel restolinha.*/
		sscanf(linha, "%d %[^/n]", &est_bn->segmentos_colunas[col], restolinha);
		/** Função strcpy() que copia o conteúdo da string restolinha para a string linha */
		strcpy(linha, restolinha);
	}
	/** Ciclo for que percorre as linhas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** Função fgets() que copia os dados do standard input e os armazena na string linha (o número de carateres copiados não pode, no entanto, ultrapassar o 1024). Pára quando atingir este número máximo de carateres, um "\n" ou ainda o final da string (i.e. "\0"). */
		fgets(linha, 1024, fp);
		/** Ciclo for que percorre as colunas do tabuleiro */
		for(col=0; col<est_bn->numcolunas; col++){
			/** Vai colocando em cada coluna de uma mesma linha do tabuleiro os carateres que estão na string "linha" retirada do standard input (e vai avançando as linhas, fazendo o mesmo para cada uma delas). */
			est_bn->tabuleiro[lin][col] = linha[col];
		}
	}
	return 1;
	fclose(fp);
	return 1;
}

int contaBarcosL (int numLin, ESTRUTURA_BN *est_bn) {
	int col, contador=0;
	for(col=0; col<est_bn->numcolunas; col++) {
		if (est_bn->tabuleiro[numLin][col] != '~' && est_bn->tabuleiro[numLin][col] != '.') { /* devemos contar os 'o'? */
			contador++;
		}
	}
	return contador;
}

int contaPontosL (int numLin, ESTRUTURA_BN *est_bn) {
	int col, contador=0;
	for(col=0; col<est_bn->numcolunas; col++) {
		if (est_bn->tabuleiro[numLin][col] == '.') { /* devemos contar os 'o'? */
			contador++;
		}
	}
	return contador;
}

int contaBarcosC (int numCol, ESTRUTURA_BN *est_bn) {
	int lin, contador=0;
	for(lin=0; lin<est_bn->numlinhas; lin++) {
		if (est_bn->tabuleiro[lin][numCol] != '~' && est_bn->tabuleiro[lin][numCol] != '.') { /* devemos contar os 'o'? */
			contador++;
		}
	}
	return contador;
}

int contaPontosC (int numCol, ESTRUTURA_BN *est_bn) {
	int lin, contador=0;
	for(lin=0; lin<est_bn->numlinhas; lin++) {
		if (est_bn->tabuleiro[lin][numCol] == '.') { /* devemos contar os 'o'? */
			contador++;
		}
	}
	return contador;
}

int cmd_E1 (ESTRUTURA_BN *est_bn) {
	int lin, col, aux=0;
	cmd_p_aux(est_bn, '.', -1, -1, 1);
	/** Ciclo for que percorre as linhas do tabuleiro */
	for(lin=0; lin<est_bn->numlinhas; lin++){
		/** Ciclo for que percorre as colunas do tabuleiro */
		for(col=0; col<est_bn->numcolunas; col++){
			if (est_bn->tabuleiro[lin][col] != '~' && est_bn->tabuleiro[lin][col] != '.') {
				if (lin-1 >= 0 && col-1 >= 0) {
					if ((est_bn->tabuleiro[lin-1][col-1] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;
					cmd_p_aux(est_bn, '~', lin-1, col-1, 0);
				}
				if (lin-1 >= 0 && est_bn->tabuleiro[lin][col] != 'v' && est_bn->tabuleiro[lin][col] != '#' && est_bn->tabuleiro[lin][col] != 'o') {
					if ((est_bn->tabuleiro[lin-1][col] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;
					cmd_p_aux(est_bn, '~', lin-1, col, 0);
				}
				if (lin-1 >= 0 && col+1 < est_bn->numcolunas) {
					if ((est_bn->tabuleiro[lin-1][col+1] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;
					cmd_p_aux(est_bn, '~', lin-1, col+1, 0);
				}
				if (col-1 >= 0 && est_bn->tabuleiro[lin][col] != '>' && est_bn->tabuleiro[lin][col] != '#' && est_bn->tabuleiro[lin][col] != 'o') {
					if ((est_bn->tabuleiro[lin][col-1] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;
					cmd_p_aux(est_bn, '~', lin, col-1, 0);
				}
				if (col+1 < est_bn->numcolunas && est_bn->tabuleiro[lin][col] != '<' && est_bn->tabuleiro[lin][col] != '#' && est_bn->tabuleiro[lin][col] != 'o') {
					if ((est_bn->tabuleiro[lin][col+1] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;
					cmd_p_aux(est_bn, '~', lin, col+1, 0);
				}
				if (lin+1 < est_bn->numlinhas && col-1 >= 0) {
					if ((est_bn->tabuleiro[lin+1][col-1] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;
					cmd_p_aux(est_bn, '~', lin+1, col-1, 0);
				}
				if (lin+1 < est_bn->numlinhas && est_bn->tabuleiro[lin][col] != '^' && est_bn->tabuleiro[lin][col] != '#' && est_bn->tabuleiro[lin][col] != 'o') {
					if ((est_bn->tabuleiro[lin+1][col] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;				
					cmd_p_aux(est_bn, '~', lin+1, col, 0);
				}					
				if (lin+1 < est_bn->numlinhas && col+1 < est_bn->numcolunas) {
					if ((est_bn->tabuleiro[lin+1][col+1] != '~') && (est_bn->tabuleiro[lin-1][col-1] != '.')) aux = 1;
					cmd_p_aux(est_bn, '~', lin+1, col+1, 0);
				}						
			}
		}
	}
	if (aux == 1) {
		return 2;
	} else {
		return 1;
	}
}

int cmd_E2 (ESTRUTURA_BN *est_bn) { /* não está a funcionar direito */
	int lin=0, col, contador=0;
	cmd_p_aux(est_bn, '.', -1, -1, 1);
	while (lin < est_bn->numlinhas) {
		for(col=0; col<est_bn->numcolunas; col++) {
			if (est_bn->tabuleiro[lin][col] != '~' && est_bn->tabuleiro[lin][col] != '.') {
				contador++;
			}
		}
		if (contador == est_bn->segmentos_linhas[lin]) {
			for(col=0; col<est_bn->numcolunas; col++) {
				if (est_bn->tabuleiro[lin][col] == '.') {
					cmd_p_aux(est_bn, '~', lin, col, 0);
				}
			}			
		}
		contador = 0;
		lin++;
	}
	col=0;
	while (col < est_bn->numcolunas) {
		for(lin=0; lin<est_bn->numlinhas; lin++) {
			if (est_bn->tabuleiro[lin][col] != '~' && est_bn->tabuleiro[lin][col] != '.') {
				contador++;
			}
		}
		if (contador == est_bn->segmentos_colunas[col]) {
			for(lin=0; lin<est_bn->numcolunas; lin++) {
				if (est_bn->tabuleiro[lin][col] == '.') {
					cmd_p_aux(est_bn, '~', lin, col, 0);
				}
			}			
		}
		contador = 0;
		col++;
	}	
	return 1;
}

int cmd_E3 (ESTRUTURA_BN *est_bn) {
	int lin=0, col, i, j=0;
	cmd_p_aux(est_bn, '.', -1, -1, 1);
	while (lin < est_bn->numlinhas) {
		for(col=0; col<est_bn->numcolunas; col++) {
			if (contaPontosL(lin, est_bn) == est_bn->segmentos_linhas[lin] - contaBarcosL(lin, est_bn)) {
				if (est_bn->tabuleiro[lin][col] == '.') {
					cmd_p_aux(est_bn, 'o', lin, col, 0);
				}
			}				
		}
		lin++;
	}
	col=0;
	while (col < est_bn->numcolunas) {
		for(lin=0; lin<est_bn->numlinhas; lin++) {
			if (contaPontosC(col, est_bn) == est_bn->segmentos_colunas[col] - contaBarcosC(col, est_bn)) {
				if (est_bn->tabuleiro[lin][col] == '.') {
					cmd_p_aux(est_bn, 'o', lin, col, 0);
				}
			}				
		}
		col++;
	} /* (3) */
	lin=0;
	while (lin < est_bn->numlinhas) {
		for (i=0; i < est_bn->numcolunas; i++) {
			if (est_bn->tabuleiro[lin][i] != '~' && est_bn->tabuleiro[lin][i] != '.') {
				j=i;
				while ((est_bn->tabuleiro[lin][j] != '~') && (est_bn->tabuleiro[lin][j] != '.') && (j < est_bn->numcolunas)) j++;
				/** j-i indica o tamanho de cada barco */
				if (j-i == 1) {
					cmd_p_aux(est_bn, 'o', lin, i, 0);
				}
				if (j-i == 2) {
					cmd_p_aux(est_bn, '<', lin, i, 0);
					cmd_p_aux(est_bn, '>', lin, i+1, 0);
				}
				if (j-i > 2) {
					cmd_p_aux(est_bn, '<', lin, i, 0);
					cmd_p_aux(est_bn, '>', lin, j-1, 0);
					for (i=i+1; i < j-1; i++) {
						cmd_p_aux(est_bn, '#', lin, i, 0);
					}
				}
				i=j;
			}
		}
		lin++;
	}
	col=0;
	while (col < est_bn->numcolunas) {
		for (i=0; i < est_bn->numlinhas; i++) {
			if (est_bn->tabuleiro[i][col] == 'o') {
				j=i;
				while ((est_bn->tabuleiro[j][col] != '~') && (est_bn->tabuleiro[j][col] != '.') && (j < est_bn->numlinhas)) j++;
				if (j-i == 1) {
					cmd_p_aux(est_bn, 'O', i, col, 0);
				}
				if (j-i == 2) {
					cmd_p_aux(est_bn, '^', i, col, 0);
					cmd_p_aux(est_bn, 'v', i+1, col, 0);
				}
				if (j-i > 2) {
					cmd_p_aux(est_bn, '^', i, col, 0);
					cmd_p_aux(est_bn, 'v', j-1, col, 0);
					for (i=i+1; i < j-1; i++) {
						cmd_p_aux(est_bn, '#', i, col, 0);
					}
				}
				i=j;
			}
		}
		col++;
	}
	return 1;
}

int cmd_D (ESTRUTURA_BN *est_bn) {
	int aux;
	if (est_bn->s == NULL) {
		printf("ERRO: impossível aceder à stack (stack vazia)\n");
	} else {
		aux = est_bn->s->cabeca.numcmd;
		while ((est_bn->s != NULL) && (est_bn->s->cabeca.numcmd == aux)) {
			est_bn->tabuleiro[est_bn->s->cabeca.l - 1][est_bn->s->cabeca.c - 1] = est_bn->s->cabeca.ant;
			pop (&est_bn->s);
		}
	}
	return 1;
}

int cmd_V (ESTRUTURA_BN *est_bn) {
	int lin=0, col, aux1, aux2;
	/** Ver se o numero de segmentos nas linhas/colunas pode ser válido */	
	while (lin < est_bn->numlinhas) {
		if ((est_bn->segmentos_linhas[lin] < contaBarcosL(lin, est_bn)) || (est_bn->segmentos_linhas[lin] > contaBarcosL(lin, est_bn) + contaPontosL(lin, est_bn))) {
			aux1 = -1;
		}
		lin++;
	}
	while (col < est_bn->numcolunas) {
		if ((est_bn->segmentos_colunas[col] < contaBarcosC(col, est_bn)) || (est_bn->segmentos_colunas[col] > contaBarcosC(col, est_bn) + contaPontosC(col, est_bn))) {
			aux1 = -1;
		}
		col++;
	}
	/** Ver se os barcos não se tocam */
	if (cmd_E1 (est_bn) == 2) aux2 = -1;
	/** Tendo em conta os dois últimos resultados, diz se o tabuleiro é ou não válido */
	if (aux1 == -1 || aux2 == -1) {
		printf("NAO\n");
	} else {
		printf("SIM\n");
	}
	cmd_D (est_bn);
	return 1;
}

/** Função que se encarrega de interpretador os dados que vêm do standard input. Para isso a função lê esses mesmo dados do standard input (atrávés da função sscanf) e guarda o comando (i.e. c, m, h, v, p ou q) e, no máximo, dois argumentos: o primeiro e o segundo (e.g. 1 e 2 para a linha 1 e coluna 2). A função ainda conta o número de argumentos recebidos, número esse que será utilizado ao chamar cada um dos comandos. */

int interpretar (ESTRUTURA_BN *est_bn, char *linha) {
	/** Carater que toma o valor do comando que está a ser interpretado (e.g. "c", "m", "p<", "p~",...)*/
	char comando[1024];
	/** Variável que armazena o primeiro argumento de um comando (e.g. 1 em "h 1", 2 em "p> 2 1",...)*/
	char arg1[1024];
	/** Variável que armazena o primeiro argumento de um comando (e.g. 1 em "p> 2 1",...)*/
	char arg2[1024];
	/** Variável que armazena o número de argumentos do comando lido */
	int nargs;
	/** Atribui à variável nargs o número de campos que estiverem preenchidos (e.g. 1 em "c", 2 em "h 2", 3 em "p< 1 2", etc.). "nargs" varia entre 0 e 3. */
	nargs = sscanf (linha, "%s %s %s", comando, arg1, arg2);
	/** Verifica se o comando invocado é o "c" (através da função strcmp) e se o número de argumentos é 1. */
	if (strcmp(comando, "c") == 0 && nargs == 1)
		/** Se se verificar, chama a função que executa o comando "c" passando a estrutura de dados como argumento.*/
		return cmd_c (est_bn);
	/** Verifica se o comando invocado é o "m" (através da função strcmp) e se o número de argumentos é 1. */
	else if (strcmp (comando, "m") == 0 && nargs == 1) {
		/** Se se verificar, chama a função que executa o comando "m" passando a estrutura de dados como argumento.*/
		return cmd_m (est_bn);
	}
	/** Verifica se o comando invocado é o "p" (através da função strcmp) e se o número de argumentos é 3. */
	else if (((strcmp (comando, "p.") == 0) || (strcmp (comando, "p~") == 0) || (strcmp (comando, "po") == 0) || (strcmp (comando, "pO") == 0) || (strcmp (comando, "p<") == 0) || (strcmp (comando, "p>") == 0) || (strcmp (comando, "p#") == 0) || (strcmp (comando, "p^") == 0) || (strcmp (comando, "pv") == 0)) && nargs == 3) {
		/** Se se verificar, chama a função que executa o comando "p" passando a estrutura de dados como argumento.*/
		return cmd_p_interp (est_bn, comando, arg1, arg2);
	}
	/** Verifica se o comando invocado é o "h" (através da função strcmp) e se o número de argumentos é 2. */
	else if (strcmp (comando, "h") == 0 && nargs == 2) {
		/** Se se verificar, chama a função que executa o comando "h" passando a estrutura de dados como argumento.*/
		return cmd_h (est_bn, arg1);
	}
	/** Verifica se o comando invocado é o "v" (através da função strcmp) e se o número de argumentos é 2. */
	else if (strcmp (comando, "v") == 0 && nargs == 2) {
		/** Se se verificar, chama a função que executa o comando "v" passando a estrutura de dados como argumento.*/
		return cmd_v (est_bn, arg1);
	}
	/** Verifica se o comando invocado é o "q" (através da função strcmp)*/
	else if (strcmp (comando, "q") == 0) {
		/** Retorna 0 (este valor será tido em conta pelo interpretador) */
		return 0;
	}
	else if (strcmp(comando, "l") == 0 && nargs == 2) {
		return cmd_l (est_bn, arg1);
	}
	else if (strcmp(comando, "e") == 0 && nargs == 2) {
		return cmd_e (est_bn, arg1);
	}
	else if (((strcmp(comando, "E1") == 0) || (strcmp(comando, "E2") == 0) || (strcmp(comando, "E3") == 0)) && nargs == 1) {
		if (comando[1] == '1') return cmd_E1 (est_bn);
		if (comando[1] == '2') return cmd_E2 (est_bn);
		if (comando[1] == '3') return cmd_E3 (est_bn);
	}
	else if (strcmp(comando, "V") == 0 && nargs == 1) {
		return cmd_V (est_bn);
	}
	else if (strcmp(comando, "D") == 0 && nargs == 1) {
		return cmd_D (est_bn);
	} else {
		/** Como não se verificou nenhum dos passos anteriores, o comando é inválido ou não existe.*/
		printf ("Comando invalido!\n");
		/** Retorna -1, o que indica que o comando é inválido ou não existe.*/
		return -1;
	}
	return -1;
}

/** Função interpretador que consiste num interpretador de comandos. */

void interpretador (ESTRUTURA_BN *est_bn) {
	/** Resultado a ser interpretado */
	int resultado = 0;
	/** Variável que vai armazenas a linha */
	char buffer [1024];
	/** Variável que toma o valor do ciclo */
	int ciclo = 1;
	/** Ciclo while que atua enquanto houver dados a serem retirados do standard input */
	while (ciclo && fgets (buffer, 1024, stdin) != NULL){
		/** A variável resultado a ser interpretada, toma o valor obtido a partir do chamamento da função interpretar cujos argumentos são a estrutura de dados e o buffer */
		resultado = interpretar (est_bn, buffer);
		/** Caso o resultado tome o valor de zero (i.e. se se tratar do comando "q"), o ciclo termina */
		if (resultado == 0)
			ciclo = 0;
	}
}

/** Função main que apenas se encarrega de chamar a função interpretador com a estrutura de dados est_bn */

int main () {
	ESTRUTURA_BN est_bn;
	init (&est_bn.s);
	/** Chama a função interpretador com a estrutura de dados */
	interpretador (&est_bn);
	return 0;
}