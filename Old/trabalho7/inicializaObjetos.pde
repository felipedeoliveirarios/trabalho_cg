
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
      
      //carrega todos os objetos no arquivo de texto
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
               
                 int[] PLF = int(split(linha[i]," ")); i ++;//recebe a linha do arquivo que corresponde as respectivas quantidades de pontos, lados, e faces
                 float[][] P = new float[PLF[0]][];//recebe os pontos
                 int[][] L = new int[PLF[1]][];//recebe os lados
                 ArrayList<Face> faces = new ArrayList<Face>();//recebe as faces
                 float[] fator_T;//recebe o fator de translação inicial do objeto
                 float[] fator_S;//recebe o fator de escala inicial do objeto
                 float[] fator_R;//recebe o fator de rotação inicial do objeto
                
                    for(int k = 0; k < PLF[0]; k++){//carrega as linhas que contem os pontos 
                        P[k] = float(split(linha[k+i]," "));
                    }
                    
                    i = i + PLF[0];
                    
                    for(int k = 0; k < PLF[1]; k++){//carrega as linhas que contem os lados
                        L[k] = int(split(linha[k+i]," "));
                                          
                    }
                  
                    
                    i = i + PLF[1];
                    
                    for(int k = 0; k < PLF[2]; k++){//separa os dados contendo os lados da face e os valores rgb, cria um objeto face contendo seus atributos
                      
                        float[] vetor = float(split(linha[k+i]," "));
                        int[] pontos_face = new int[int(vetor[0])]; 
                        float[] rgb = new float[3];
                        int L_f[][] = new int[int(vetor[0])][2];
                        
                        for(int j = 1; j <= vetor[0]; j++){
                            pontos_face[j-1] = int(vetor[j]);
                        }
                        
                        for(int j = int(vetor[0] + 1); j < vetor.length; j++){
                            rgb[j - int((vetor[0] + 1))] = vetor[j];
                        }
                        
                        
                        int c = 0;
                        for(int j = 0; j < PLF[1]; j++){
                             for(int l = 0; l < vetor[0]; l++){
                                   if(L[j][0] == pontos_face[l]){
                                       for(int q = 0; q < vetor[0]; q++){
                                           if(L[j][1] == pontos_face[q]){
                                               
                                               L_f[c][0] = l;
                                               L_f[c][1] = q;
                                               // println(L_f[c][0] + " " + L_f[c][1]);
                                               c++;
                                               
                                           }
                                       }
                                   }
                             }
                        }
                         //println();
                        Face face = new Face(pontos_face,rgb,L_f);
                        
                        faces.add(face);

                    }
                
                i = i + PLF[2];
                
                //separa as linhas contendo as transformações
                fator_T = float(split(linha[i]," ")); i++;
                fator_S = float(split(linha[i]," ")); i++;
                fator_R = float(split(linha[i]," ")); i++;
           
                //carrega um novo objeto e executa as transformações iniciais
                objeto_3d objeto = new objeto_3d(PLF[0], PLF[1], PLF[2], P, L, planoObj, nome, faces, fator_T, fator_S, fator_R);
                translacao(objeto,objeto.get_T_inicial());
                escala(objeto,objeto.get_S_inicial());
                rotacao(objeto,objeto.get_R_inicial());
                
      return objeto;
      
    }
    
    //carrega o sistema de coordenadas do objeto
     void carregaPlano(){
       
          int[] plano = int(split(linha[1]," "));  
        
          for(int i = 0; i < plano.length; i++){
              planoObj[i] = plano[i];
          }
          
          planoObj[4] = planoObj[0];
          planoObj[5] = planoObj[1];
      }
      
             

}







  
  
