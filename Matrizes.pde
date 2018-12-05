class Matriz{
	public float[][] dados;
	public int linhas;
	public int colunas;

	public Matriz(int linhas, int colunas){
		this.linhas = linhas;
		this.colunas = colunas;
	}

	public Matriz transposta(){
		Matriz resultante = new Matriz(this.colunas, this.linhas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[coluna][linha] = this.dados[linha][coluna];
			}
		}
		return resultante;
	}

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

	public Matriz multilpicar(int fator){
		Matriz resultante = new Matriz(this.colunas, this.linhas);
		for(int linha = 0; linha < resultante.linhas; linha++){
			for(int coluna = 0; coluna < resultante.colunas; colunas++){
				resultante.dados[linha][coluna] *= fator;
			}
		}
		return resultante;
	}


}