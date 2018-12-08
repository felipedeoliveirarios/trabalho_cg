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
		this.rotacao = new Matriz(1, 3);
		this.translacao = new Matriz(1, 3);
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

	/*
	+==========================================================================
	|		Método que renderiza o objeto 3D atual de acordo com o algoritmo
	|		especificado (padrão: PERSPECTIVA_COM_UM_PF)
	+==========================================================================
	*/
	public void renderizar(){

	}


	/*
	+==========================================================================
	|		Enum que mantém os nomes dos algoritmos de renderização para uso no
	|		método renderizar();
	+==========================================================================
	*/
	private Enum Renderizador{
		CAVALEIRA(0), CABINET(1), ISOMETRICO(2), PERSPECTIVA_COM_UM_PF(3),
		PERSPECTIVA_COM_DOIS_PF(4);

		private int identificador;

		Renderizador(int identificador){
			this.identificador = identificador;
		}
		/*
		+======================================================================
		|		Método que retorna o identificador do enum.
		+======================================================================
		*/
		public int getIdentificador(){
			return this.identificador;
		}
	}
}