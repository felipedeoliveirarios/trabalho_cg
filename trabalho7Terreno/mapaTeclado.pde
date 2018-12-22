  
//função que captura as teclas 
void keyTyped() {
  
        switch(key){
//mapa do teclado para translação
//#######################################################################################################
            case 'q':
            case 'Q':
                fator_T[0] = 2;
                fator_T[1] = 0;
                fator_T[2] = 0;
                translacao(objetos_iniciados.get_lista_objetos().get(c),fator_T);
            break;
            case 'w':
            case 'W':
                fator_T[0] = -2;
                fator_T[1] = 0;
                fator_T[2] = 0;
                translacao(objetos_iniciados.get_lista_objetos().get(c),fator_T);
            break;
            case 'E':
            case 'e':
                fator_T[0] = 0;
                fator_T[1] = 2;
                fator_T[2] = 0;
                translacao(objetos_iniciados.get_lista_objetos().get(c),fator_T);
            break;
            case 'R':
            case 'r':
                fator_T[0] = 0;
                fator_T[1] = -2;
                fator_T[2] = 0;
                translacao(objetos_iniciados.get_lista_objetos().get(c),fator_T);
            break;
            case 'T':
            case 't':
                fator_T[0] = 0;
                fator_T[1] = 0;
                fator_T[2] = 2;
                translacao(objetos_iniciados.get_lista_objetos().get(c),fator_T);
            break;
            case 'Y':
            case 'y':
                fator_T[0] = 0;
                fator_T[1] = 0;
                fator_T[2] = -2;
                translacao(objetos_iniciados.get_lista_objetos().get(c),fator_T);
            break;
//#######################################################################################################
           
//mapa do teclado para escala
//#######################################################################################################
            case 'A':
            case 'a':
                fator_S[0] = 2;
                fator_S[1] = 1;
                fator_S[2] = 1;
                escala(objetos_iniciados.get_lista_objetos().get(c),fator_S);  
            break;
            case 'S':
            case 's':
                fator_S[0] = 0.5;
                fator_S[1] = 1;
                fator_S[2] = 1;
                escala(objetos_iniciados.get_lista_objetos().get(c),fator_S);
            break;
            case 'D':
            case 'd':
               fator_S[0] = 1;
               fator_S[1] = 2;
               fator_S[2] = 1;
               escala(objetos_iniciados.get_lista_objetos().get(c),fator_S);
            break;
            case 'F':
            case 'f':
              fator_S[0] = 1;
              fator_S[1] = 0.5;
              fator_S[2] = 1;
              escala(objetos_iniciados.get_lista_objetos().get(c),fator_S);
            break;
            case 'G':
            case 'g':
              fator_S[0] = 1;
              fator_S[1] = 1;
              fator_S[2] = 2;
              escala(objetos_iniciados.get_lista_objetos().get(c),fator_S);
            break;
            case 'H':
            case 'h':
              fator_S[0] = 1;
              fator_S[1] = 1;
              fator_S[2] = 0.5;
              escala(objetos_iniciados.get_lista_objetos().get(c),fator_S);
            break;
//#######################################################################################################
            
//mapa do teclado para rotação
//#######################################################################################################
            case 'Z':
            case 'z':
                fator_R[0] = 2;
                fator_R[1] = 0;
                fator_R[2] = 0;
                rotacao(objetos_iniciados.get_lista_objetos().get(c),fator_R);  
            break;
            case 'X':
            case 'x':
                fator_R[0] = -2;
                fator_R[1] = 0;
                fator_R[2] = 0;
                rotacao(objetos_iniciados.get_lista_objetos().get(c),fator_R);
            break;
            case 'C':
            case 'c':
               fator_R[0] = 0;
               fator_R[1] = 2;
               fator_R[2] = 0;
               rotacao(objetos_iniciados.get_lista_objetos().get(c),fator_R);
            break;
            case 'V':
            case 'v':
              fator_R[0] = 0;
              fator_R[1] = -2;
              fator_R[2] = 0;
              rotacao(objetos_iniciados.get_lista_objetos().get(c),fator_R);
            break;
            case 'B':
            case 'b':
              fator_R[0] = 0;
              fator_R[1] = 0;
              fator_R[2] = 2;
              rotacao(objetos_iniciados.get_lista_objetos().get(c),fator_R);
            break;
            case 'N':
            case 'n':
              fator_R[0] = 0;
              fator_R[1] = 0;
              fator_R[2] = -2;
              rotacao(objetos_iniciados.get_lista_objetos().get(c),fator_R);
            break;
//#######################################################################################################   
            case 'P':
            case 'p':
              if(flagproj < 4){
                flagproj ++;
              }else{
                flagproj = 0;
              }
        }
        
}

//abilita menu informativo das teclas utlizadas
//####################################################################################################### 
void keyPressed(){
  if (key == CODED) {
    if (keyCode == java.awt.event.KeyEvent.VK_F1){
        flag = -1*flag;
    }
    
    if(keyCode == java.awt.event.KeyEvent.VK_SHIFT){
      
        if(c - 1 > -1){
          c --;
        }else{
          c = objetos_iniciados.get_lista_objetos().size()-1;
        }      
    }
    
  }
  
   if (key == TAB) {
  
        if((c+1) < objetos_iniciados.get_lista_objetos().size()){
            c ++;
        }else{
            c = 0;
        }
    
  }
  
  
}
