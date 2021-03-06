//Nome: Dheiso Araujo Pereira
//Matricula: 137180

inicializaObjetos objetos_iniciados;
color cor_linha = color(255,255,255);
int  c = 0;


void setup(){
  size(800,800);
  background(0);
  
  objetos_iniciados = new inicializaObjetos();
  
}



  float[] fator_S = {0,0,0};
  float[] fator_T = {0,0,0};
  float[] fator_R = {0,0,0};
  int flag = -1,flagproj = 0;
  
  
  void draw(){
    
    background(0);
    
    for(int j = 0; j < objetos_iniciados.get_lista_objetos().size(); j++){
      if(j == c){
          cor_linha = color(255,0,0);
        }else{
          cor_linha = color(255,255,255);
        }
        projecao(objetos_iniciados.get_lista_objetos().get(j),cor_linha);
      
    }
   
    
    //Menu de teclas para trasformações
    if(flag == 1){
                textSize(20);
                text("As teclas Q/W fazem movimento de tranlação no eixo X",10,20);
                text("As teclas E/R fazem movimento de tranlação no eixo Y",10,40);
                text("As teclas T/Y fazem movimento de tranlação no eixo Z",10,60);
                text("As teclas A/S fazem escala no eixo X",10,80);
                text("As teclas D/F fazem escala no eixo Y",10,100); 
                text("As teclas G/H fazem escala no eixo Z",10,120); 
                text("As teclas Z/X fazem rotação no eixo X",10,140); 
                text("As teclas C/V fazem rotação no eixo Y",10,160); 
                text("As teclas B/N fazem rotação no eixo Z",10,180); 
    }
    
    textSize(10);
    switch(flagproj){
      
      case 0:
         text("projeção cavaleira",600,20);
         break;
      case 1:
         text("projeção cabinete",600,20);
         break;
      case 2:
         text("projeção axonometrica",600,20);
         break;
      case 3:
         text("projeção com um ponto de fuga",600,20);
         break;
      case 4:
         text("projeção com dois pontos de fuga",600,20);
         break;
         
    }

    
  }
    

//função que projeta um objeto 3d em 2d
//#############################################################################################################################################################################
void projecao(objeto_3d objeto,color cor_linha){
 
  float[][] Pontos = new float[objeto.get_N_pontos()][4];
  int[][] L = objeto.get_lados();
  //color cor_linha = color(255,255,255);
  float[] ponto = new float[4];
  float soma;
  int H ,W ,P, M, dxdz,dydz;
  
        W = objeto.get_planoObj()[1] - objeto.get_planoObj()[0];
        H = objeto.get_planoObj()[3] - objeto.get_planoObj()[2];
        P = objeto.get_planoObj()[5] - objeto.get_planoObj()[4];
        M = min(width/W,height/H);
        dxdz = (width - W*M)/2;
        dydz = (height - H*M)/2;
  
  float[][] matriz_Pcav = {{1,0,0,0},{0,1,0,0},{(sqrt(2)/2),(sqrt(2)/2),1,0},{0,0,0,1}};//matriz de projeção cavaleira
  float[][] matriz_Pcab = {{1,0,0,0},{0,1,0,0},{(sqrt(2)/4),(sqrt(2)/4),1,0},{0,0,0,1}};//matriz de projeção cabinete
  float[][] matriz_Paxo = {{0.707,0.408,0,0},{0,0.816,0,0},{0.707,-0.408,1,0},{0,0,0,1}};//matriz de projeção axonometrica
  float[][] matriz_P1p = {{1,0,0,0},{0,1,0,0},{0,0,1,1/400.0},{0,0,0,1}};//matriz com um ponto de fuga
  float[][] matriz_P2p = {{1,0,0,1/300.0},{0,1,0,0},{0,0,1,1/400.0},{0,0,0,1}};//matriz com dois pontos de fuga
  float[][] matriz_esc = new float[4][4];
  
       switch(flagproj){
           case 0:
               matriz_esc = matriz_Pcav;
           break;
           case 1:
               matriz_esc = matriz_Pcab;
           break;
           case 2:
               matriz_esc = matriz_Paxo;
           break;
           case 3:
               matriz_esc = matriz_P1p;//dividir por P[i][3]
           break;
           case 4:
               matriz_esc = matriz_P2p;//dividir por P[i][3]
           break;        
                       
       }

  
  //matrizes usadas para passar do plano do objeto para o plano do dispositivo
  float[][] matriz_R1 = {{1,0,0,0},{0,1,0,0},{0,0,1,0},{-objeto.get_planoObj()[0],objeto.get_planoObj()[3],objeto.get_planoObj()[5],1}};
  float[][] matriz_R2 = {{1,0,0,0},{0,-1,0,0},{0,0,-1,0},{0,0,0,1}};
  float[][] matriz_R3 = {{M,0,0,0},{0,M,0,0},{0,0,M,0},{0,0,0,1}};
  float[][] matriz_R4 = {{1,0,0,0},{0,1,0,0},{0,0,1,0},{dxdz,dydz,0,1}};

        
        for(int i = 0; i < objeto.get_N_pontos(); i ++){
              Pontos[i][0] = objeto.get_pontos()[i][0];
              Pontos[i][1] = objeto.get_pontos()[i][1]; 
              Pontos[i][2] = objeto.get_pontos()[i][2]; 
              Pontos[i][3] = 1;  
        }
        
     
      for(int i = 0; i < objeto.get_N_pontos(); i++){//aplica a projeção nos pontos do objeto, passando para o plano do dispositivo
 
          ponto[0] = Pontos[i][0];
          ponto[1] = Pontos[i][1];
          ponto[2] = Pontos[i][2];
          ponto[3] = Pontos[i][3];
          
              for(int j = 0; j < 4; j++){
                  soma = 0;
                  for(int k = 0; k < 4; k++){
                    
                       soma = soma + (ponto[k]*matriz_esc[k][j]);
       
                   }
                  Pontos[i][j] = soma;
               }
               
               
             for(int k=0; k < Pontos.length; k++){
                 Pontos[i][0] /= Pontos[i][3];
                 Pontos[i][1] /= Pontos[i][3];
                 Pontos[i][2] /= Pontos[i][3];
                 Pontos[i][3] /= Pontos[i][3];
               }
      
          ponto[0] = Pontos[i][0];
          ponto[1] = Pontos[i][1];
          ponto[2] = Pontos[i][2];
          ponto[3] = Pontos[i][3];
          
              for(int j = 0; j < 4; j++){
                  soma = 0;
                  for(int k = 0; k < 4; k++){
                       soma = soma + (ponto[k]*matriz_R2[k][j]);
                   }
                  Pontos[i][j] = soma;
               }
               
          ponto[0] = Pontos[i][0];
          ponto[1] = Pontos[i][1];
          ponto[2] = Pontos[i][2];
          ponto[3] = Pontos[i][3];
          
              for(int j = 0; j < 4; j++){
                  soma = 0;
                  for(int k = 0; k < 4; k++){
                       soma = soma + (ponto[k]*matriz_R1[k][j]);
                   }
                  Pontos[i][j] = soma;
               }
               
          ponto[0] = Pontos[i][0];
          ponto[1] = Pontos[i][1];
          ponto[2] = Pontos[i][2];
          ponto[3] = Pontos[i][3];
               
              for(int j = 0; j < 4; j++){
                  soma = 0;
                  for(int k = 0; k < 4; k++){
                       soma = soma + (ponto[k]*matriz_R3[k][j]);
                   }
                  Pontos[i][j] = soma;
               }
               
          ponto[0] = Pontos[i][0];
          ponto[1] = Pontos[i][1];
          ponto[2] = Pontos[i][2];
          ponto[3] = Pontos[i][3];
          
              for(int j = 0; j < 4; j++){
                  soma = 0;
                  for(int k = 0; k < 4; k++){
                       soma = soma + (ponto[k]*matriz_R4[k][j]);
                   }
                  Pontos[i][j] = soma;
               }
       
               
       }
       
                              
            if(flagproj == 3 || flagproj == 4){
                   for(int y = 0; y < objeto.get_N_pontos(); y++){
                        Pontos[y][2] = Pontos[y][0]/Pontos[y][3];
                    }
             }
             
             
      

   for(int i = 0; i < objeto.get_N_lados(); i++){
      linhaDDA(int(Pontos[(L[i][0])-1][0]),int(Pontos[(L[i][0])-1][1]),int(Pontos[(L[i][1])-1][0]),int(Pontos[(L[i][1])-1][1]),cor_linha);
      
   }
      textSize(10);
      for(int i = 0; i < objeto.get_N_pontos(); i++){
       text("(" + int(Pontos[i][0]) + "," + int(Pontos[i][1]) + ")",int(Pontos[i][0]),int(Pontos[i][1]));      
   }
   
}
//#############################################################################################################################################################################



//função que translada um objeto 3d
//#############################################################################################################################################################################
void translacao(objeto_3d objeto,float[] T){

  float[][] P = objeto.get_pontos();
  float[] posicao = {objeto.get_posicao()[0],objeto.get_posicao()[1],objeto.get_posicao()[2]};
  float[][] matriz_T = {{1,0,0,0},{0,1,0,0},{0,0,1,0},{T[0],T[1],T[2],1}};//matriz de translação
  float[][] ponto = new float[1][4];
  float soma;
  
  //verifica se a translação não faz o objeto ultrapassar os limites do seu sistema de coordenadas.
  //if(!(posicao[0] + T[0] > objeto.get_planoObj()[1] || posicao[0] + T[0] < objeto.get_planoObj()[0] || posicao[1] + T[1] > objeto.get_planoObj()[3] || posicao[1] + T[1] < objeto.get_planoObj()[2] || posicao[2] + T[2] > objeto.get_planoObj()[5] || posicao[2] + T[2] < objeto.get_planoObj()[4])){
       

  ponto[0][3] = 1;
      
               for(int i = 0; i < objeto.get_N_pontos(); i++){//aplica translação no objeto
                    ponto[0][0] = P[i][0];
                    ponto[0][1] = P[i][1];
                    ponto[0][2] = P[i][2];
                  for(int j = 0; j < 4; j++){
                       soma = 0;
                       
                      for(int k = 0; k < 4; k++){
                            soma = soma + (ponto[0][k]*matriz_T[k][j]);
                        
                      }
                      
                      if(j < 3){
                          P[i][j] = soma;
                      }
                  }
    
              }

          
         posicao[0] =  posicao[0] + T[0];
         posicao[1] =  posicao[1] + T[1];
         posicao[2] =  posicao[2] + T[2];
       
        objeto.set_posicao(posicao);
                
  }      

//}
//#############################################################################################################################################################################


//função que escala um objeto 3d
//#############################################################################################################################################################################
void escala(objeto_3d objeto,float[] S){

  float[][] P = objeto.get_pontos();
  float[][] aux = new float[objeto.get_N_pontos()][3];
  float[][] aux2 = new float[1][3];
  float[] posicao = {objeto.get_posicao()[0],objeto.get_posicao()[1],objeto.get_posicao()[2]};//posição inicial do objeto
  float[][] matriz_S = {{S[0],0,0,0},{0,S[1],0,0},{0,0,S[2],0},{0,0,0,1}};//matriz de escala
  int[] ponto = new int[4];
  int soma;
  boolean flag = false;
  boolean teste = false;
  
  ponto[3] = 1;
 
      if(!(posicao[0] == 0 && posicao[1] == 0 && posicao[2] == 0)){//verifica se o objeto está na origem no sistema do universo, se não estiver, coloca o objeto na origem
              
                flag = true;    
                posicao[0] = -1*posicao[0];
                posicao[1] = -1*posicao[1];
                posicao[2] = -1*posicao[2];
                translacao(objeto,posicao);
              
      }

      for(int i = 0; i < objeto.get_N_pontos(); i++){//aplica a escala no objeto
          
            //calculos realizados para não perder valor de poto flutuante
            ponto[0] = int(P[i][0]);
            aux2[0][0] = P[i][0] - ponto[0];
            ponto[1] = int(P[i][1]);
            aux2[0][1] = P[i][1] - ponto[1];
            ponto[2] = int(P[i][2]);
            aux2[0][2] = P[i][2] - ponto[2];
            
              for(int j = 0; j < 4; j++){
                  soma = 0;
                    for(int k = 0; k < 4; k++){
                       soma = soma + int((ponto[k]*matriz_S[k][j]));
                    }
                    
                     /* if(soma == 0){
                        teste = true;
                      }*/
                    
                     /* if(j == 0){
                            if(soma + (-1*posicao[0]) > objeto.get_planoObj()[1] || soma + (-1*posicao[0]) < objeto.get_planoObj()[0] ){
                                teste = true;
                            }
                        }
 
                         if(j == 1){    
                            if(soma + (-1*posicao[1]) > objeto.get_planoObj()[3] || soma + (-1*posicao[1]) < objeto.get_planoObj()[2] ){
                                teste = true;
                            }  
                        }
                        
                        if(j == 2){    
                            if(soma + (-1*posicao[2]) > objeto.get_planoObj()[5] || soma + (-1*posicao[2]) < objeto.get_planoObj()[4] ){
                                teste = true;
                            }  
                        }*/
                    
                    
                    if(j < 3){
                        aux[i][j] = aux2[0][j] + soma;
                    }
               }
  
       }
       
       
      if(teste != true){
          for(int i = 0; i < objeto.get_N_pontos(); i++){
               for(int j = 0; j < 3; j++){
                  P[i][j] = aux[i][j];    
               }     
          }
      }
       
      
      if(flag){//devolve o objeto para a posição original
          
           posicao[0] = -1*posicao[0];
           posicao[1] = -1*posicao[1];
           posicao[2] = -1*posicao[2];
           translacao(objeto,posicao);
      }

   
}
//#############################################################################################################################################################################


//função que rotaciona um objeto 3d
//#############################################################################################################################################################################
void rotacao(objeto_3d objeto,float[] R){

  float[][] P = objeto.get_pontos();
  float[] posicao = {objeto.get_posicao()[0],objeto.get_posicao()[1],objeto.get_posicao()[2]};//posição inicial do objeto
  float[][] matriz_Rx = {{1,0,0,0},{0,cos(radians(R[0])),sin(radians(R[0])),0},{0,-sin(radians(R[0])),cos(radians(R[0])),0},{0,0,0,1}};//matriz para rotacionar no eixo x
  float[][] matriz_Ry = {{cos(radians(R[1])),0,-sin(radians(R[1])),0},{0,1,0,0},{sin(radians(R[1])),0,cos(radians(R[1])),0},{0,0,0,1}};//matriz para rotacionar no eixo y
  float[][] matriz_Rz = {{cos(radians(R[2])),sin(radians(R[2])),0,0},{-sin(radians(R[2])),cos(radians(R[2])),0,0},{0,0,1,0},{0,0,0,1}};//matriz para rotacionar no eixo z
  float[] ponto = new float[4];
  float soma;
  boolean flag = false;
  
 
  ponto[3] = 1;
 
      if(!(posicao[0] == 0 && posicao[1] == 0 && posicao[2] == 0)){//verifica se o objeto está na origem no sistema do universo, se não estiver, coloca o objeto na origem
              
                flag = true;    
                posicao[0] = -1*posicao[0];
                posicao[1] = -1*posicao[1];
                posicao[2] = -1*posicao[2];
                translacao(objeto,posicao);
              
      }
      
      
      if(R[0] != 0){//se o angulo for diferente de zero rotaciona em x
        
          for(int i = 0; i < objeto.get_N_pontos(); i++){
                ponto[0] = P[i][0];
                ponto[1] = P[i][1];
                ponto[2] = P[i][2];
                  for(int j = 0; j < 4; j++){
                      soma = 0;
                      for(int k = 0; k < 4; k++){
                           soma = soma + (ponto[k]*matriz_Rx[k][j]);
                       }
                       
                       if(j < 3){
                            P[i][j] = soma;
                       }
                   }
           }
       
      }
      
       if(R[1] != 0){//se o angulo for diferente de zero rotaciona em y
        
          for(int i = 0; i < objeto.get_N_pontos(); i++){
                ponto[0] = P[i][0];
                ponto[1] = P[i][1];
                ponto[2] = P[i][2];
                  for(int j = 0; j < 4; j++){
                      soma = 0;
                      for(int k = 0; k < 4; k++){
                           soma = soma + (ponto[k]*matriz_Ry[k][j]);
                       }
                       
                       if(j < 3){
                            P[i][j] = soma;
                       }
                      
                   }
    
           }
       
      }
      
      if(R[2] != 0){//se o angulo for diferente de zero rotaciona em z
        
          for(int i = 0; i < objeto.get_N_pontos(); i++){
                ponto[0] = P[i][0];
                ponto[1] = P[i][1];
                ponto[2] = P[i][2];
                  for(int j = 0; j < 4; j++){
                      soma = 0;
                      for(int k = 0; k < 4; k++){
                           soma = soma + (ponto[k]*matriz_Rz[k][j]);
                       }
                       
                       if(j < 3){
                            P[i][j] = soma;
                       }
                      
                   }
           }
       
      }
      
      if(flag){
          
                posicao[0] = -1*posicao[0];
                posicao[1] = -1*posicao[1];
                posicao[2] = -1*posicao[2];
                translacao(objeto,posicao);
      } 
   
}
//#############################################################################################################################################################################


void linhaDDA(int xi, int yi, int xf, int yf,color cor){
  
   int dx = xf - xi; int dy = yf -yi, passo, k;
   float incX, incY, x = xi, y = yi;
   
    
    if(abs(dx) > abs(dy)){
        passo = abs(dx);
      
    }else{
       passo = abs(dy); 
      
    }
    
    incX = dx /(float)passo;
    incY = dy /(float)passo;
    
    stroke(cor);
    point((int)x,(int)y);
    
    for(k = 0; k < passo; k++){
      
        x = x+incX;
        y = y+incY;
        
        stroke(cor);
        point((int)x,(int)y);
      
    }
 }
