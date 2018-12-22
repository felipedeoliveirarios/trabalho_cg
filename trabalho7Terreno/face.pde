class Face {

  private int[] pontos;
  private color rgb_fundo;
  private color rgb_linha;
  private double P[][];
  private int L[][];
  private double z_medio;
  private boolean normal;

  Face(int pontos[],float rgb[],int L[][]){
    this.pontos = pontos;
    this.rgb_fundo = color(rgb[0],rgb[1],rgb[2]);
    this.L = L;
    
  }


  void set_pontos(int[] pontos){
    this.pontos = pontos;
  }
  
  int[] get_pontos(){
    return this.pontos;
  }
  
    void set_rgb_fundo(color rgb){
    this.rgb_fundo = rgb;
  }
  
  color get_rgb_fundo(){
    return this.rgb_fundo;
  }
  
   void set_rgb_linha(color rgb){
    this.rgb_linha = rgb;
  }
  
  color get_rgb_linha(){
    return this.rgb_linha;
  }
  
  void set_z_medio(double z_medio){
    this.z_medio = z_medio;
  }
  
  int get_z_medio(){
    return (int)z_medio;
  }

  void set_normal(boolean valor){
    this.normal = valor;
  }
  
  boolean get_normal(){
    return this.normal;
  }
  
  void set_M_pontos(double P[][]){
      this.P = P;  
  }
  
  double[][] get_m_p(){
    return this.P;
  }
  
  int[][] get_m_l(){
      return this.L;
  }


}
