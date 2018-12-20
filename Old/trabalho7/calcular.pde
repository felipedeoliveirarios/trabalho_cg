

void calcular_normal_Zmedio(objeto_3d objeto){

  for(int i = 0; i < objeto.get_faces().size(); i ++){
        int[] pontos_face = objeto.get_faces().get(i).get_pontos();
        double x = 0,y = 0,z = 0;
        double d;
        double face[][] = new double[pontos_face.length][3];
        //float[][]  p = new float[3][3];
        double p_o[] = {100,100,-200};
        double l[] = new double[3];
        double n[] = new double[3];
        double v;
        
         for(int j = 0; j < pontos_face.length; j++){
              face[j][0] = objeto.get_pontos()[pontos_face[j]-1][0];
              face[j][1] = objeto.get_pontos()[pontos_face[j]-1][1];
              face[j][2] = objeto.get_pontos()[pontos_face[j]-1][2];
          }
        
        
        for(int j = 0; j < face.length; j++){
         
            x = x + face[j][0];
            y = y + face[j][1];
            z = z + face[j][2];
             
        }
        
        x = x/face.length;
        y = y/face.length;
        z = z/face.length;
        
        
        d = Math.sqrt(x*x+y*y+z*z);
        
        objeto.get_faces().get(i).set_z_medio(d);

        
        n[0] = (face[2][1]-face[1][1])*(face[0][2]-face[1][2])-(face[0][1]-face[1][1])*(face[2][2]-face[1][2]);
        n[1] = (face[2][2]-face[1][2])*(face[0][0]-face[1][0])-(face[0][2]-face[1][2])*(face[2][0]-face[1][0]);
        n[2] = (face[2][0]-face[1][0])*(face[0][1]-face[1][1])-(face[0][0]-face[1][0])*(face[2][1]-face[1][1]);
        
        l[0] = (p_o[0]-face[1][0]);
        l[1] = (p_o[1]-face[1][1]);
        l[2] = (p_o[2]-face[1][2]);
        
        v = n[0]*l[0] + n[1]*l[1] + n[2]*l[2];
        
        
        if(v >= 0){
          objeto.get_faces().get(i).set_normal(true);
        }else{
          objeto.get_faces().get(i).set_normal(false);
        }
        
        objeto.get_faces().get(i).set_M_pontos(face);
      
  }


}
