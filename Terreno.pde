class Terreno{
	public Objeto3D gerarTerrenoPlano(){
		Vertice[] verticesTerreno = new Vertice[NUM_VERTICES_TERRENO];
		int numVerticesPorLado = (int)Math.sqrt(NUM_VERTICES_TERRENO);
		int indiceX, indiceZ;
		for (int indice = 0; indice < NUM_VERTICES_TERRENO; indice++){
			indiceX = Math.floor(indice / numVerticesPorLado);
			indiceZ = indice % numVerticesPorLado;
			Vertice verticesTerreno[indice] = new Vertice((indiceX * numVerticesPorLado) - (NUM_VERTICES_TERRENO / 2), 0, (indiceZ * numVerticesPorLado) - (NUM_VERTICES_TERRENO / 2)); //Cria um vértice sobre o plano XZ

		}
		Aresta[] arestasTerreno = new Aresta[180];
		int indiceAresta = 0;
		for (indiceX = 0; indiceX < numVerticesPorLado; indiceX++){ //ARESTAS "VERTICAIS"
			for (indiceZ = 0; indiceZ < (numVerticesPorLado - 1); indiceZ++){
				Aresta[indiceAresta] = new Aresta((numVerticesPorLado * indiceX) + indiceZ, (numVerticesPorLado * indiceX) + (indiceZ + 1));
				indiceAresta++;
			}
		}

		for (indiceZ = 0; indiceZ < numVerticesPorLado; indiceZ++){ //ARESTAS "HORIZONTAIS"
			for (indiceX = 0; indiceX < (numVerticesPorLado - 1); indiceX++){
				Aresta[indiceAresta] = new Aresta((numVerticesPorLado * indiceX) + indiceZ, (numVerticesPorLado * (indiceX + 1)) + (indiceZ));
				indiceAresta++;
			}
		}

		Objeto3D terreno = new Objeto3D(new Poliedro(verticesTerreno, arestasTerreno));
		return terreno;
	}

	/*
	+==========================================================================
	|		Método acidenta um terreno (altera o valor y de vértices 
	|		aleatórios).
	+==========================================================================
	*/
	public static void acidentar(Objeto3D terreno){
		int numAcidentes = (Math.random() * MAX_NUM_ACIDENTES);
		int indiceVertice = 0;
		for (int iteracao = 0; iteracao < numAcidentes; iteracao++){
			int indiceVertice = (Math.random() * terreno.poliedro.vertices.length);
			terreno.poliedro.vertices[indiceVertice].y = ((Math.random() - 0.5) * (MAX_AMPLITUDE_ACIDENTES * 2));
		}
		
	}

	/*
	+==========================================================================
	|		Método que suaviza o terreno (reduz o dy de um vértice com sua 
	|		4-vizinhança baseado num fator real armazenado nas constantes)
	+==========================================================================
	*/
	public static void suavizar(Objeto3D terreno){
		//pega os vértices de maior dy
		//pega os vértices da 4-vizinhança e altera o y deles baseado em um fator float < 1 (definido nas constantes)
		//aplica recursão nesses 4 vértices, reduzindo o fator float (elevando ao quadrado)
		//finaliza a recursão se o fator double for < 0.1

		Vertice verticesOrdenados[] = Vertice.ordenarPorY(terreno.poliedro.vertices);
		int indiceX, indiceZ;
		int numVerticesPorLado = (int)Math.sqrt(NUM_VERTICES_TERRENO);
		for (int indice = 0; indice < verticesOrdenados.length; index++){
			if (verticesOrdenados[index].y == 0){break;} //finaliza a execução ao alcançar vértices planos.
				indiceX = (verticesOrdenados[index].x + (NUM_VERTICES_TERRENO / 2))/numVerticesPorLado;
				indiceZ = (verticesOrdenados[index].z + (NUM_VERTICES_TERRENO / 2))/numVerticesPorLado;

				suavizarVizinhança(terreno.poliedro.vertices, indiceX, indiceZ, FATOR_DE_SUAVIZAÇÃO_BASE);
		}

	}

	/*
	+==========================================================================
	|		Método recursivo que suaviza a vizinhança de um vértice.
	+==========================================================================
	*/
	public static void suavizarVizinhança(Vertice[] VerticesTerreno, int indiceX, int indiceZ, double fator){
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
				vizinhos[2] = verticesTerreno[indice + numVerticesPorLado]
			} else {
				vizinhos[2] = null;
			}

			if (indiceZ > 0){//tem vizinho abaixo
				vizinhos[3] = verticesTerreno[indice - numVerticesPorLado]
			} else {
				vizinhos[3] = null;
			}

			double novoFator = fator * fator;
			for(indiceLooṕ = 0; indiceLoop < 4; indiceLoop++){ //altera os vizinhos
				if (vizinhos[indiceLoop] == null && vizinhos[indiceLoop].y < verticesTerreno[indice].y){
				contunue; //pula os nulos e os vértices mais altos ou similares ao atual.
				}
				vizinhos[indiceLoop].y = verticesTerreno[indice].y * fator;
			}

			if (vizinhos[0] != null){
				suavizarVizinhança(VerticesTerreno, indiceX + 1, indiceZ, novoFator);
			}

			if (vizinhos[1] != null){
				suavizarVizinhança(VerticesTerreno, indiceX - 1, indiceZ, novoFator);
			}

			if (vizinhos[2] != null){
				suavizarVizinhança(VerticesTerreno, indiceX, indiceZ + 1, novoFator);
			}

			if (vizinhos[3] != null){
				suavizarVizinhança(VerticesTerreno, indiceX, indiceZ - 1, novoFator);
			}
			
			
			
			
		}
	}
}
