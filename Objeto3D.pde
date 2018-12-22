/*
###############################################################################
#	Classe responsável pela manutenção e operação de um objeto 3D.
###############################################################################
*/
class Objeto3D{
	private Poliedro poliedro;
	private Matriz escala;
	private Matriz rotacao;
	private Matriz translacao;
	private Poliedro prontoParaRenderizar;
	private METODO_DE_RENDERIZACAO renderizador;

	public Objeto3D(Poliedro poliedro){
		this.poliedro = poliedro;
		this.escala = new Matriz(1, 3);
    float[][] matrizDeDadosEscala = {{1.0f, 1.0f, 1.0f}};
		this.escala.dados = matrizDeDadosEscala;
		this.rotacao = new Matriz(1, 3);
    float[][] matrizDeDadosRotacao = {{0.0f, 0.0f, 0.0f}};
		this.rotacao.dados = matrizDeDadosRotacao;
		this.translacao = new Matriz(1, 3);
    float[][] matrizDeDadosTranslacao = {{0.0f, 0.0f, 0.0f}};
		this.translacao.dados = matrizDeDadosTranslacao;
		this.renderizador = METODO_DE_RENDERIZACAO.PERSPECTIVA_COM_UM_PF;
	}

	/*
	+==========================================================================
	|		Método que altera a matriz de translação, adicionando os valores de
	|		entrada aos valores atuais da matriz.
	+==========================================================================
	*/
	public void transladar(int x, int y, int z){
		translacao.dados[0][0] += x;
		translacao.dados[0][1] += y;
		translacao.dados[0][2] += z;
	}

	/*
	+==========================================================================
	|		Método que altera a matriz de escala, adicionando os valores de
	|		entrada aos valores atuais da matriz.
	+==========================================================================
	*/
	public void escalar(double x, double y, double z){
		escala.dados[0][0] += x;
		escala.dados[0][1] += y;
		escala.dados[0][2] += z;
	}

	/*
	+==========================================================================
	|		Método que altera a matriz de rotação, adicionando os valores de
	|		entrada aos valores atuais da matriz.
	+==========================================================================
	*/
	public void rotacionar(double x, double y, double z){
		rotacao.dados[0][0] += x;
		rotacao.dados[0][1] += y;
		rotacao.dados[0][2] += z;
	}

	/*
	+==========================================================================
	|		Método que aplica as matrizes de translação, escala e rotação sobre
	|		os vértices do poliedro do objeto 3D e guarda para renderização
	|		posterior.
	+==========================================================================
	*/
	public void aplicarOperacoes(){
		// Faz as operações e salva na variável prontoParaRenderizar.
	}
}
