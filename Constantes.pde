/*
###############################################################################
#	CONJUNTO DE CONSTANTES A SER UTILIZADAS NA EXECUÇÃO DA APLICAÇÃO
###############################################################################
*/
public final int MAX_OBJETOS = 10;
public final int MAX_AMPLITUDE_ACIDENTES = 50;
public final int MAX_NUM_ACIDENTES = 20;
public final int NUM_VERTICES_TERRENO = 400;
public final double FATOR_DE_SUAVIZACAO_BASE = 0.9;
/*
+==========================================================================
|    Enum que mantém os nomes dos algoritmos de renderização para uso no
|    método renderizar();
+==========================================================================
*/
public enum METODO_DE_RENDERIZACAO{
    CAVALEIRA(0), CABINET(1), ISOMETRICO(2), PERSPECTIVA_COM_UM_PF(3),
    PERSPECTIVA_COM_DOIS_PF(4);

    private int identificador;

    private METODO_DE_RENDERIZACAO(int identificador){
      this.identificador = identificador;
    }
    /*
    +======================================================================
    |    Método que retorna o identificador do enum.
    +======================================================================
    */
    public int getIdentificador(){
      return this.identificador;
    }
  }
