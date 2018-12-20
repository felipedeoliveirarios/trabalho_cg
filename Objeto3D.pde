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
	private Renderizador renderizador;

	public Objeto3D(Poliedro poliedro){
		this.poliedro = poliedro;
		this.escala = new Matriz(1, 3);
		this.escala.dados[0] = {1.0, 0.0, 0.0};
		this.rotacao = new Matriz(1, 3);
		this.rotacao.dados[0] = {0.0, 0.0, 0.0};
		this.translacao = new Matriz(1, 3);
		this.translacao.dados[0] = {0.0, 0.0, 0.0};
		this.renderizador = Renderizador.PERSPECTIVA_COM_UM_PF;
	}

	/*
	+==========================================================================
	|		Método que altera a matriz de translação, adicionando os valores de
	|		entrada aos valores atuais da matriz.
	+==========================================================================
	*/
	public void transladar(int x, int y, int z){

	}

	/*
	+==========================================================================
	|		Método que altera a matriz de escala, adicionando os valores de
	|		entrada aos valores atuais da matriz.
	+==========================================================================
	*/
	public void escalar(double x, double y, double z){

	}

	/*
	+==========================================================================
	|		Método que altera a matriz de rotação, adicionando os valores de
	|		entrada aos valores atuais da matriz.
	+==========================================================================
	*/
	public void rotacionar(double x, double y, double z){

	}

	/*
	+==========================================================================
	|		Método que aplica as matrizes de translação, escala e rotação sobre
	|		os vértices do poliedro do objeto 3D e retorna o novo poliedro.
	+==========================================================================
	*/
	public Poliedro aplicarOperacoes(){

	}