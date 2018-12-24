class Terreno{
  /*
  +==========================================================================
  |    Método que gera uma grade plana.
  +==========================================================================
  */
	public Objeto3D gerarTerrenoPlano(){
		Vertice[] verticesTerreno = new Vertice[NUM_VERTICES_TERRENO];
		int numVerticesPorLado = (int)Math.sqrt(NUM_VERTICES_TERRENO);
		int indiceX, indiceZ;
		for (int indice = 0; indice < NUM_VERTICES_TERRENO; indice++){
			indiceX = floor(indice / numVerticesPorLado);
			indiceZ = indice % numVerticesPorLado;
			verticesTerreno[indice] = new Vertice((indiceX * numVerticesPorLado) - (NUM_VERTICES_TERRENO / 2), 0, (indiceZ * numVerticesPorLado) - (NUM_VERTICES_TERRENO / 2)); //Cria um vértice sobre o plano XZ

		}
		Aresta[] arestasTerreno = new Aresta[(numVerticesPorLado * (int)(numVerticesPorLado - 1)) * 2];
		int indiceAresta = 0;
    
    for(int indice = 0; indice < (verticesTerreno.length - 1); indice++){
      if((indice + 1) % numVerticesPorLado != 0){
        arestasTerreno[indiceAresta] = new Aresta(indice, indice + 1);
        indiceAresta++;
      }
    }
    
    for(int indice = 0; indice < (verticesTerreno.length - numVerticesPorLado); indice++){
        arestasTerreno[indiceAresta] = new Aresta(indice, indice + numVerticesPorLado);
        indiceAresta++;
    }
    
    Face[] facesTerreno = new Face[(numVerticesPorLado - 1) * (numVerticesPorLado - 1)];
    int indiceVertice = 0;
    int indiceFace = 0;
    indiceAresta = 0;
    int indiceAresta2 = 0;
    int[] arrayVertices = null;
    int[] arrayArestas = null;
    for (int indiceLoop = 0; indiceFace < numVerticesPorLado * (numVerticesPorLado - 1); indiceLoop++){
      if (indiceFace == facesTerreno.length)break;
      if((indiceLoop + 1) % numVerticesPorLado != 0){// pula o último de cada linha
        arrayVertices = new int[]{indiceVertice, indiceVertice + 1, indiceVertice + numVerticesPorLado, indiceVertice + numVerticesPorLado + 1};
        arrayArestas = new int[]{(indiceAresta), (indiceAresta + (numVerticesPorLado - 1)), (indiceAresta2 + (numVerticesPorLado * (numVerticesPorLado - 1))), (indiceAresta2 + (numVerticesPorLado * (numVerticesPorLado - 1)) + 1)};
        facesTerreno[indiceFace] = new Face(arrayVertices, arrayArestas, color(0, 0, 0));
        indiceFace++;        
        indiceAresta++;
      }
      indiceVertice++;
      indiceAresta2++;
    }
		Objeto3D terreno = new Objeto3D(new Poliedro(verticesTerreno, arestasTerreno, facesTerreno));
    terreno.poliedro.corDaLinha = color(255, 255, 255);
		return terreno;
	}

	/*
	+==========================================================================
	|		Método acidenta um terreno (altera o valor y de vértices 
	|		aleatórios).
	+==========================================================================
	*/
	public void acidentar(Objeto3D terreno){
		int numAcidentes = (int)random(MAX_NUM_ACIDENTES);
		int indiceVertice;
		for (int iteracao = 0; iteracao < numAcidentes; iteracao++){
			indiceVertice = (int) random(terreno.poliedro.vertices.length);
			terreno.poliedro.vertices[indiceVertice].y = (int)((Math.random() - 0.5) * (MAX_AMPLITUDE_ACIDENTES * 2));
		}
		
	}

	/*
	+==========================================================================
	|		Método que suaviza o terreno (reduz o dy de um vértice com sua 
	|		4-vizinhança baseado num fator real armazenado nas constantes)
	+==========================================================================
	*/
	public void suavizar(Objeto3D terreno){
		//pega os vértices de maior dy
		//pega os vértices da 4-vizinhança e altera o y deles baseado em um fator float < 1 (definido nas constantes)
		//aplica recursão nesses 4 vértices, reduzindo o fator float (elevando ao quadrado)
		//finaliza a recursão se o fator double for < 0.1

		Vertice verticesOrdenados[] = new Vertice(0, 0, 0).ordenarPorY(terreno.poliedro.vertices);
		int indiceX, indiceZ;
		int numVerticesPorLado = (int)Math.sqrt(NUM_VERTICES_TERRENO);
		for (int indice = 0; indice < verticesOrdenados.length; indice++){
			if (verticesOrdenados[indice].y == 0){break;} //finaliza a execução ao alcançar vértices planos.
				indiceX = (verticesOrdenados[indice].x + (NUM_VERTICES_TERRENO / 2))/numVerticesPorLado;
				indiceZ = (verticesOrdenados[indice].z + (NUM_VERTICES_TERRENO / 2))/numVerticesPorLado;

				suavizarVizinhanca(terreno.poliedro.vertices, indiceX, indiceZ, FATOR_DE_SUAVIZACAO_BASE);
		}
    for (int indice = verticesOrdenados.length; indice >= 0; indice--){
      if (verticesOrdenados[indice].y == 0){break;} //finaliza a execução ao alcançar vértices planos.
        indiceX = (verticesOrdenados[indice].x + (NUM_VERTICES_TERRENO / 2))/numVerticesPorLado;
        indiceZ = (verticesOrdenados[indice].z + (NUM_VERTICES_TERRENO / 2))/numVerticesPorLado;

        suavizarVizinhanca(terreno.poliedro.vertices, indiceX, indiceZ, FATOR_DE_SUAVIZACAO_BASE);
    }

	}

	/*
	+==========================================================================
	|		Método recursivo que suaviza a vizinhança de um vértice.
	+==========================================================================
	*/
	public void suavizarVizinhanca(Vertice[] verticesTerreno, int indiceX, int indiceZ, double fator){
		if (fator > 0.1){
			int numVerticesPorLado = (int)Math.sqrt(NUM_VERTICES_TERRENO);
			Vertice[] vizinhos = new Vertice[4];
			int indice = (indiceX * numVerticesPorLado) + indiceZ;
			if (indiceX < 9){// tem vizinho à direita
				vizinhos[0] = verticesTerreno[indice + 1];
			} else {
				vizinhos[0] = null;
			}

			if (indiceX > 0){// tem vizinho à esquerda
				vizinhos[1] = verticesTerreno[indice - 1];
			} else {
				vizinhos[1] = null;
			}

			if (indiceZ < 9){// tem vizinho acima
				vizinhos[2] = verticesTerreno[indice + numVerticesPorLado];
			} else {
				vizinhos[2] = null;
			}

			if (indiceZ > 0){//tem vizinho abaixo
				vizinhos[3] = verticesTerreno[indice - numVerticesPorLado];
			} else {
				vizinhos[3] = null;
			}

			double novoFator = fator * fator;
			for(int indiceLoop = 0; indiceLoop < 4; indiceLoop++){ //altera os vizinhos
				if (vizinhos[indiceLoop] != null && //se o vizinho existir
            abs(vizinhos[indiceLoop].y) < abs((float)(verticesTerreno[indice].y * fator)) && //se o vizinho possuir dy menor que o dy que será definido
            ((vizinhos[indiceLoop].y >= 0 && verticesTerreno[indice].y >= 0) || (vizinhos[indiceLoop].y <= 0 && verticesTerreno[indice].y <= 0))){ //se tiverem o mesmo sinal
				vizinhos[indiceLoop].y = (int)((float)verticesTerreno[indice].y * fator);
				}
				
			}

			if (vizinhos[0] != null){
				suavizarVizinhanca(verticesTerreno, indiceX + 1, indiceZ, novoFator);
			}

			if (vizinhos[1] != null){
				suavizarVizinhanca(verticesTerreno, indiceX - 1, indiceZ, novoFator);
			}

			if (vizinhos[2] != null){
				suavizarVizinhanca(verticesTerreno, indiceX, indiceZ + 1, novoFator);
			}

			if (vizinhos[3] != null){
				suavizarVizinhanca(verticesTerreno, indiceX, indiceZ - 1, novoFator);
			}
		}
	}
}
