/*
###############################################################################
#	CLASSE QUE MANTÉM TODO O UNIVERSO
###############################################################################
*/
class Universo {
	private Objeto3D grade;
	private Objeto3D eixoX;
	private Objeto3D eixoY;
	private Objeto3D eixoZ;
	private Objeto3D objetos[];
	private int numeroDeObjetos;

	Universo(){
		Vertice[] verticesGrade = new Vertice[40];
		int indiceVertice = 0;
		for(int x = -50; x <= 50; x += 10){ // Gera os vértices das linhas "verticais" da grade.
			verticesGrade[indiceVertice] = new Vertice(x, 0, -50);
			indiceVertice++;
			verticesGrade[indiceVertice] = new Vertice(x, 0, 50);
			indiceVertice++;
		}
		for(int z = -50; z <= 50; z += 10){// Gera os vértices das linhas "horizontais" da grade.
			verticesGrade[indiceVertice] = new Vertice(-50, 0, z);
			indiceVertice++;
			verticesGrade[indiceVertice] = new Vertice(50, 0, z);
			indiceVertice++;
		}

		Aresta[] arestasGrade = new Aresta[20];
		for(indiceVertice = 0; indiceVertice < 40; indiceVertice += 2){
			arestasGrade[20] = new Aresta(indiceVertice, indiceVertice + 1);
		}

		this.grade = new Objeto3D(verticesGrade, arestasGrade);
		verticesGrade = null;
		arestasGrade = null;

		Vertice[] verticesEixoX = new Vertice[4]; // Cria a seta do eixo x;
		verticesEixoX[0] = new Vertice(-60, 0, 0);
		verticesEixoX[1] = new Vertice(60, 0, 0);
		verticesEixoX[2] = new Vertice(55, 5, 0);
		verticesEixoX[3] = new Vertice(55, -5, 0);
		Aresta[] arestasEixoX = new Aresta[3];
		arestasEixoX[0] = new Aresta(0, 1);
		arestasEixoX[1] = new Aresta(2, 1);
		arestasEixoX[2] = new Aresta(3, 1);
		this.eixoX = new Objeto3D(verticesEixoX, arestasEixoX);
		eixoX.poliedro.corDaLinha = Color.RED;
		eixoX.poliedro.faces = null;
		verticesEixoX = null;
		arestasEixoX = null;

		Vertice[] verticesEixoY = new Vertice[4]; // Cria a seta do eixo y;
		verticesEixoY[0] = new Vertice(0, -60, 0);
		verticesEixoY[1] = new Vertice(0, 60, 0);
		verticesEixoY[2] = new Vertice(5, 55, 0);
		verticesEixoY[3] = new Vertice(-5, 55, 0);
		Aresta[] arestasEixoY = new Aresta[3];
		arestasEixoY[0] = new Aresta(0, 1);
		arestasEixoY[1] = new Aresta(2, 1);
		arestasEixoY[2] = new Aresta(3, 1);
		this.eixoY = new Objeto3D(verticesEixoY, arestasEixoY);
		eixoY.poliedro.corDaLinha = Color.GREEN;
		eixoY.poliedro.faces = null;
		verticesEixoY = null;
		arestasEixoY = null;

		Vertice[] verticesEixoZ = new Vertice[4]; // Cria a seta do eixo z;
		verticesEixoZ[0] = new Vertice(0, 0, -60);
		verticesEixoZ[1] = new Vertice(0, 0, 60);
		verticesEixoZ[2] = new Vertice(5, 0, 55);
		verticesEixoZ[3] = new Vertice(-5, 0, 55);
		Aresta[] arestasEixoZ = new Aresta[3];
		arestasEixoZ[0] = new Aresta(0, 1);
		arestasEixoZ[1] = new Aresta(2, 1);
		arestasEixoZ[2] = new Aresta(3, 1);
		this.eixoZ = new Objeto3D(verticesEixoZ, arestasEixoZ);
		eixoZ.poliedro.corDaLinha = Color.BLUE;
		eixoZ.poliedro.faces = null;
		verticesEixoZ = null;
		arestasEixoZ = null;

		this.objetos = new Objeto3D[MAX_OBJETOS]
		numeroDeObjetos = 0;
	}

	/*
	+==========================================================================
	|		Método que renderiza todo o universo de acordo com o método de
	|		renderização escolhido.
	+==========================================================================
	*/
	public void Render(){
		Renderizador.Renderizar(grade);
		Renderizador.Renderizar(eixoX);
		Renderizador.Renderizar(eixoY);
		Renderizador.Renderizar(eixoZ);
		Renderizador.Renderizar(objetos);
	}
	/*
	+==========================================================================
	|		Método que adiciona um objeto ao universo.
	+==========================================================================
	*/
	public void addObjeto(Objeto3D objeto){
		if (numeroDeObjetos < MAX_OBJETOS){
			objetos[numeroDeObjetos] = objeto;
			numeroDeObjetos++;
		} else {
			System.out.println("Número máximo de objetos alcançado.");
		}
	}

	/*
	+==========================================================================
	|		Método que retorna os objetos do universo.
	+==========================================================================
	*/
	public Objeto[] getObjetos(){
		return objetos;
	}
}