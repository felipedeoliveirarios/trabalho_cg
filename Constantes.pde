/*
###############################################################################
#	CONJUNTO DE CONSTANTES A SER UTILIZADAS NA EXECUÇÃO DA APLICAÇÃO
###############################################################################
*/
class Constantes{
	public int MAX_OBJETOS = 10;

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