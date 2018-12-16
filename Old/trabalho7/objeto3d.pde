//estrutura que guarda um objeto 3d
//#############################################################################################################################################################################
class objeto_3d {

  private int n, m, f;

  private float[][] P;//matriz de pontos 
  private int[][] L ;//matriz de lados
  private ArrayList<Face> faces = new ArrayList<Face>();//faces do objeto 3d
  private float[] posicao = {0, 0, 0};//posição inicial no sistema de coordenadas do objeto
  private int[] planoObj;//limites minimos e maximos do sistema de coordenadas do objeto na seguinte ordem {-x +x -y +y -z +z}
  private String nome;//nome do objeto 3d
  private float[] fator_T_I;//fator de translação inicial
  private float[] fator_S_I;//fatr de escala inicial
  private float[] fator_R_I;//fator de rotação inicial

  //define a estrurura do objeto 3d
  objeto_3d(int n, int m, int f, float P[][], int L[][], int[] planoObj, String nome, ArrayList<Face> faces, float[] fator_T_I, float[] fator_S_I, float[] fator_R_I) {
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

  float[] get_posicao() {//retorna a posição do objeto em relação ao seu sistema de coordenadas
    return posicao;
  }

  void set_posicao(float[] posicao) {//muda a posição do objeto em relação ao seu sistema de coordenadas
    this.posicao = posicao;
  }

  float[][] get_pontos() {//retorna os pontos do objeto
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
  
  float[] get_T_inicial(){
    return this.fator_T_I;
  }
  
   float[] get_S_inicial(){
    return this.fator_S_I;
  }
  
   float[] get_R_inicial(){
    return this.fator_R_I;
  }

}



//#############################################################################################################################################################################
