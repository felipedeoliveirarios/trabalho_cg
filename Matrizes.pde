/*
###############################################################################
#	CLASSE RESPONSÁVEL PELAS MATRIZES E SUAS OPERAÇÕES ASSOCIADAS.
###############################################################################
*/
class Matriz{
	public float[][] dados;
	public int linhas;
	public int colunas;

	public Matriz(int linhas, int colunas){
		this.linhas = linhas;
		this.colunas = colunas;
	}
	/*
	+==========================================================================
	|		Retorna a transposta da matriz atual
	+==========================================================================
	*/
	public Matriz transposta(){
		Matriz resultante = new Matriz(this.colunas, this.linhas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[coluna][linha] = this.dados[linha][coluna];
			}
		}
		return resultante;
	}

	/*
	+==========================================================================
	|		Retorna a a matriz resultante da soma da matriz atual com uma 
	|		matriz dada como argumento. Operação válida apenas para matrizes de
	|		mesma dimensão.
	+==========================================================================
	*/
	public Matriz somar(Matrix fator){
		assert((this.linhas == fator.linhas) && 
			(this.colunas == fator.colunas));
		Matriz resultante = new Matriz(this.linhas, fator.colunas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[linha][coluna] = (this.dados[linha][coluna] +
					fator.dados[linha][coluna]);
			}
		}
		return resultante;
	}

	/*
	+==========================================================================
	|		Retorna a a matriz resultante da subtração da matriz atual com uma 
	|		matriz dada como argumento. Operação válida apenas para matrizes de
	|		mesma dimensão.
	+==========================================================================
	*/
	public Matriz subtrair(Matrix fator){
		assert((this.linhas == fator.linhas) && 
			(this.colunas == fator.colunas));
		Matriz resultante = new Matriz(this.linhas, fator.colunas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[linha][coluna] = (this.dados[linha][coluna] -
					fator.dados[linha][coluna]);
			}
		}
		return resultante;
	}

	/*
	+==========================================================================
	|		Retorna a a matriz resultante da multiplicação da matriz atual por 
	|		uma matriz dada como argumento. Válida apenas para matrizes onde o 
	|		número de colunas da matriz atual é igual ao número de linhas da 
	|		matriz dada como argumento.
	+==========================================================================
	*/
	public Matriz multilpicar(Matrix fator){
		assert(this.colunas == fator.linhas);
		Matriz resultante = new Matriz(this.linhas, fator.colunas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[linha][coluna] = 0;
				for (int k = 0; k < this.colunas; k++){
					resultante.dados[linha][coluna] += (this.dados[linha][k] * 
						fator.dados[k][coluna]);
				}
			}
		}
		return resultante;
	}

	/*
	+==========================================================================
	|		Retorna a matriz resultante da multiplicação da matriz atual por 
	|		um fator inteiro.
	+==========================================================================
	*/
	public Matriz multilpicar(int fator){
		Matriz resultante = new Matriz(this.colunas, this.linhas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[linha][coluna] *= fator;
			}
		}
		return resultante;
	}

	/*
	+==========================================================================
	|		Retorna a matriz resultante da multiplicação da matriz atual por 
	|		um fator real (versão para precisão dupla).
	+==========================================================================
	*/
	public Matriz multilpicar(double fator){
		Matriz resultante = new Matriz(this.colunas, this.linhas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[linha][coluna] *= fator;
			}
		}
		return resultante;
	}

	/*
	+==========================================================================
	|		Retorna a matriz resultante da multiplicação da matriz atual por 
	|		um fator real (versão para precisão simples).
	+==========================================================================
	*/
	public Matriz multilpicar(float fator){
		Matriz resultante = new Matriz(this.colunas, this.linhas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[linha][coluna] *= fator;
			}
		}
		return resultante;
	}
}