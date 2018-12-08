
class inicializaObjetos {

      String[] linha = loadStrings("figure.dat");
      
      ArrayList<objeto_3d> objetos = new ArrayList<objeto_3d>();
      
      int planoObj[] = new int[6];
      
      int n = int(linha[2]);
      
      int i = 3;
      
      inicializaObjetos(){
          carregaPlano();
          carregaObjetos();
      }
          
      
      ArrayList<objeto_3d> get_lista_objetos(){
        return objetos;
      }
      
      
      void carregaObjetos(){
          
          while(n > 0){
            objetos.add(lerObjeto());
            n--;
          }
      
      }
     
      
      objeto_3d lerObjeto(){
        
          String nome = linha[i];
          String letras[] = (split(linha[i]," ")); i++;
          
          if(!letras[0].equals("#")){
              println("Formato de objeto errado");
              exit();
          }
               
                 int[] PLF = int(split(linha[i]," ")); i ++;
                 float[][] P = new float[PLF[0]][];
                 int[][] L = new int[PLF[1]][];
                 ArrayList<float[]> faces = new ArrayList<float[]>();
                 ArrayList<float[]> cores = new ArrayList<float[]>();
                 float[] fator_T;
                 float[] fator_S;
                 float[] fator_R;
                
                    for(int k = 0; k < PLF[0]; k++){
                        P[k] = float(split(linha[k+i]," "));
                    }
                    
                    i = i + PLF[0];
                    
                    for(int k = 0; k < PLF[1]; k++){
                        L[k] = int(split(linha[k+i]," "));
                    }
                    
                    
                    i = i + PLF[1];
                    
                    for(int k = 0; k < PLF[2]; k++){
                      
                        float[] vetor = float(split(linha[k+i]," "));
                        float[] face = new float[int(vetor[0])]; 
                        float[] rgb = new float[3];
                        
                        for(int j = 1; j <= vetor[0]; j++){
                            face[j-1] = vetor[j];
                        }
                        
                        for(int j = int(vetor[0] + 1); j < vetor.length; j++){
                            rgb[j - int((vetor[0] + 1))] = vetor[j];
                        }
                        
                        faces.add(face);
                        cores.add(rgb);
                    }
                
                i = i + PLF[2];
                
                fator_T = float(split(linha[i]," ")); i++;
                fator_S = float(split(linha[i]," ")); i++;
                fator_R = float(split(linha[i]," ")); i++;
           
      
                objeto_3d objeto = new objeto_3d(PLF[0], PLF[1], PLF[2], P, L, planoObj, nome, faces, cores, fator_T, fator_S, fator_R);
                translacao(objeto,objeto.get_T_inicial());
                escala(objeto,objeto.get_S_inicial());
                rotacao(objeto,objeto.get_R_inicial());
                
      return objeto;
      
    }
    
    
     void carregaPlano(){
       
          int[] plano = int(split(linha[1]," "));  
        
          for(int i = 0; i < plano.length; i++){
              planoObj[i] = plano[i];
          }
          
          planoObj[4] = planoObj[0];
          planoObj[5] = planoObj[1];
      }
      
             

}







  
  
