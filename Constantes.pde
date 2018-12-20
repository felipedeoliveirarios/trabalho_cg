/*
###############################################################################
#	CONJUNTO DE CONSTANTES A SER UTILIZADAS NA EXECUÇÃO DA APLICAÇÃO
###############################################################################
*/
class Constantes{
	public final int MAX_OBJETOS = 10;
	public final int MAX_AMPLITUDE_ACIDENTES = 50;
	public final int MAX_NUM_ACIDENTES = 10;
	public final int NUM_VERTICES_TERRENO = 100;
	public final double FATOR_DE_SUAVIZAÇÃO_BASE = 0.6;

	/*
	+==========================================================================
	|		Enum que mantém os nomes dos algoritmos de renderização para uso no
	|		método renderizar();
	+==========================================================================
	*/
	public Enum MÉTODO_DE_RENDERIZACAO{
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