//estrutura que guarda um objeto 3d
//#############################################################################################################################################################################
class objeto_3d {

  private int n, m, f;

  private double[][] P;//matriz de pontos 
  private int[][] L ;//matriz de lados
  private ArrayList<Face> faces = new ArrayList<Face>();//faces do objeto 3d
  private double[] posicao = {0, 0, 0};//posição inicial no sistema de coordenadas do objeto
  private int[] planoObj;//limites minimos e maximos do sistema de coordenadas do objeto na seguinte ordem {-x +x -y +y -z +z}
  private String nome;//nome do objeto 3d
  private double[] fator_T_I;//fator de translação inicial
  private double[] fator_S_I;//fatr de escala inicial
  private double[] fator_R_I;//fator de rotação inicial

  //define a estrurura do objeto 3d
  objeto_3d(int n, int m, int f, double P[][], int L[][], int[] planoObj, String nome, ArrayList<Face> faces, double[] fator_T_I, double[] fator_S_I, double[] fator_R_I) {
    this.n = n;
    this.m = m;
    this.f = f;
    this.P = P;
    this.L = L;
    this.planoObj = planoObj;
    this.nome = nome;
    this.faces = faces;
    this.fator_T_I = fator_T_I;
    this.fator_S_I = fator_S_I;
    this.fator_R_I = fator_R_I;
  }

  double[] get_posicao() {//retorna a posição do objeto em relação ao seu sistema de coordenadas
    return posicao;
  }

  void set_posicao(double[] posicao) {//muda a posição do objeto em relação ao seu sistema de coordenadas
    this.posicao = posicao;
  }

  double[][] get_pontos() {//retorna os pontos do objeto
    return P;
  }

  int[][] get_lados() {//retorna os lados do objeto
    return L;
  }

  int get_N_pontos() {//retorna a quantida de pontos do objeto

    return n;
  }

  int get_N_lados() {//retorna a quantidade de lados do objeto

    return m;
  }
  
  int[] get_planoObj(){//retorna os limites do plano do objeto
  
    return this.planoObj;  
  }
  
  ArrayList<Face> get_faces(){//retorna uma lista com as faces do objeto
    return faces;
  }
  
  double[] get_T_inicial(){
    return this.fator_T_I;
  }
  
   double[] get_S_inicial(){
    return this.fator_S_I;
  }
  
   double[] get_R_inicial(){
    return this.fator_R_I;
  }

}



//#############################################################################################################################################################################
