import java.util.Collections;
import java.util.Arrays;

/*
###############################################################################
#	CONJUNTO DE CLASSES DE PRIMITIVAS
###############################################################################
*/

/*
+==============================================================================
|		Um vértice definido por suas coordenadas x, y e z.
+==============================================================================
*/
class Vertice{
	public int x;
	public int y;
	public int z;

	public Vertice(int x, int y, int z){
		this.x = x;
		this.y = y;
		this.z = z;
	}

	/*
	+==========================================================================
	|		Método estático que calcula e retorna o vértice médio de um array
	|		de vértices.
	+==========================================================================
	*/
	public Vertice calculaMedia(Vertice[] vertices){
		int x = 0;
		int y = 0;
		int z = 0;
		for(int i = 0; i < vertices.length; i++){
			x += vertices[i].x;
			y += vertices[i].y;
			z += vertices[i].z;
		}
		x /= vertices.length;
		y /= vertices.length;
		z /= vertices.length;
		return new Vertice(x, y, z);
	}

	/*
	+==========================================================================
	|		Método estático que ordena um array de vértices de forma 
	|		DECRESCENTE à partir da amplitude de seu y;
	+==========================================================================
	*/
	public Vertice[] ordenarPorY(Vertice[] vertices){
		int biggestDY = 0;
		ArrayList<Vertice> listaDeVertices = new ArrayList<Vertice>(Arrays.asList(vertices));
		Collections.sort(listaDeVertices, Collections.reverseOrder());
		return listaDeVertices.toArray(new Vertice[listaDeVertices.size()]);		
	}
}

/*
+==============================================================================
|		Uma aresta definida por seus vértices inicial e final.
+==============================================================================
*/
class Aresta{
	public int indiceInicio;
	public int indiceFim;

	public Aresta(int inicio, int fim){
		this.indiceInicio = indiceInicio;
		this.indiceFim = indiceFim;
	}
}

/*
+==============================================================================
|		Um polígono definido por seus vértices e arestas.
+==============================================================================
*/
class Poligono{
	public Vertice[] vertices;
	public Aresta[] arestas;
	public Vertice centro;
	public color corDaLinha;
	public color corDePreenchimento;

	public Poligono(Vertice[] vertices, Aresta[] arestas){
		this.vertices = vertices;
		this.arestas = arestas;
	}
}

/*
+==============================================================================
|		Uma face de um poliedro definido pelos índices dos vértices e arestas
|		que a compõem.
+==============================================================================
*/
class Face{
	public int[] indiceVertices; // Índice dos vértices que compõem a face.
	public int[] indiceArestas; // Índice das arestas que compõem a face.
	public Vertice centro; // Vértice central da face.
	public color preenchimento; // Cor RGBA de preenchimento da face.

	public Face(int[] indiceVertices, int[] indiceArestas){
		this.indiceVertices = indiceVertices;
		this.indiceArestas = indiceArestas;
	}

  public Face(int[] indiceVertices, int[] indiceArestas, color preenchimento){
    this.indiceVertices = indiceVertices;
    this.indiceArestas = indiceArestas;
    this.preenchimento = preenchimento;
  }
}

/*
+==============================================================================
|		Um poliedro definido por seus vértices, arestas e faces.
+==============================================================================
*/
class Poliedro extends Poligono{
	public Face[] faces;

	Poliedro(Vertice[] vertices, Aresta[] arestas){
    super(vertices, arestas);
	}

  Poliedro(Vertice[] vertices, Aresta[] arestas, Face[] faces){
    super(vertices, arestas);
    this.faces = faces;
  }

	/*
	+==========================================================================
	|		Método que coloca todos os vértices do poliedro em uma matriz de
	|		vértices.
	+==========================================================================
	*/
	public Matriz matrizDeVertices(){
		Matriz matrizDeVertices = new Matriz(vertices.length, 4);
		for(int indice = 0; indice < vertices.length; indice++){
			matrizDeVertices.dados[indice][0] = vertices[indice].x;
			matrizDeVertices.dados[indice][1] = vertices[indice].y;
			matrizDeVertices.dados[indice][2] = vertices[indice].z;
			matrizDeVertices.dados[indice][3] = 1;
		}
		return matrizDeVertices;
	}
}

/*
###############################################################################
#	CONJUNTO DE MÉTODOS PARA DESENHO DE LINHAS E CIRCUNFERÊNCIAS
###############################################################################
*/
class Linha{

	/*
	+==========================================================================
	|		Desenha linhas de acordo a função disponivel no processing (aplicação
	|		apenas para fins acadêmicos).
	+==========================================================================
	*/
	public void linha(Vertice inicio, Vertice fim){
		line(inicio.x,inicio.y,fim.x,fim.y);
	}
}

/*
###############################################################################
#	CONJUNTO DE MÉTODOS PARA O PREENCHIMENTO DE POLÍGONOS
###############################################################################
*/
class Preenchimento{
	/*
	+==========================================================================
	|		Preenche um polígono utilizando o algoritmo boundary-fill.
	+==========================================================================
	*/
	public void boundaryFill(Poligono poligono){

	}

	/*
	+==========================================================================
	|		Preenche um polígono utilizando o algoritmo de scanlines
	+==========================================================================
	*/
	public void scanlines(Poligono poligono){

	}
}

/*
###############################################################################
#	CONJUNTO DE MÉTODOS PARA A RENDERIZAÇÃO DE POLIEDROS
###############################################################################
*/
class Renderizador{
	/*
	+==========================================================================
	|		Método que renderiza o objeto 3D de acordo com o algoritmo
	|		especificado no objeto (padrão: PERSPECTIVA_COM_UM_PF)
	+==========================================================================
	*/
	public void Renderizar(Objeto3D objeto){

	}

	/*
	+==========================================================================
	|		Renderiza um conjunto de objetos 3D ordenados pela coordenada Z do
	|		ponto central.
	+==========================================================================
	*/
	public void Renderizar(Objeto3D[] arrayDeObjetos){

	}
}
