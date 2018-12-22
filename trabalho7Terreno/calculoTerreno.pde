  public static void acidentar(objeto_3d terreno){
    int numAcidentes = (int)(Math.random() * 50);
    //int indiceVertice = 0;
    for (int iteracao = 0; iteracao < numAcidentes; iteracao++){
      int indice = (int)(Math.random() * terreno.get_N_pontos());
      terreno.get_pontos()[indice][1] = ((Math.random() - 0.5) * (50 * 2));
    }
    
  }
