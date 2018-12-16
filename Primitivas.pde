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
	static Vertice calculaMedia(Vertice[] vertices){
		int x = 0;
		int y = 0;
		int z = 0;
		for(int i = 0; i < vertices.length){
			x += vertices[i].x;
			y += vertices[i].y;
			z += vertices[i].z;
		}
		x /= vertices.length;
		y /= vertices.length;
		z /= vertices.length;
		return new Vertice(x, y, z);
	}
}

/*
+==============================================================================
|		Uma aresta definida por seus vértices inicial e final.
+==============================================================================
*/
class Aresta{
	public Vertice inicio;
	public Vertice fim;

	public Aresta(Vertice inicio, Vertice fim){
		this.inicio = inicio;
		this.fim = fim;
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
	public Color corDaLinha;
	public Color corDePreenchimento;

	public Poligono(Vertice[] vertices, Aresta[] arestas){
		this.vertice = vertices;
		this.aresta = arestas;
	}
}

/*
+==============================================================================
|		Um poliedro definido por seus vértices, arestas e faces.
+==============================================================================
*/
class Poliedro extends Poligono{
	public Poligono[] faces;
}

/*
###############################################################################
#	CONJUNTO DE MÉTODOS PARA DESENHO DE LINHAS E CIRCUNFERÊNCIAS
###############################################################################
*/
class Linha{

	/*
	+==========================================================================
	|		Desenha linhas de acordo com o algoritmo analítico (aplicação
	|		apenas para fins acadêmicos).
	+==========================================================================
	*/
	public static void linhaAnalitico(Vertice inicio, Vertice fim){

	}

	/*
	+==========================================================================
	|		Desenha linhas de acordo com o algoritmo de análise diferencial
	| 		digital(DDA). É lento por fazer cálculos contínuos em 
	|		Vertice-flutuante.
	+==========================================================================
	*/
	public static void linhaDDA(Vertice inicio, Vertice fim){

	}

	/*
	+==========================================================================
	|		Desenha linhas de acordo com o algoritmo de rasterização de 
	|		Bresenham, atualizado para atender a todos os octantes.
	+==========================================================================
	*/
	public static void linhaBresenham(Vertice inicio, Vertice fim){

	}

	/*
	+==========================================================================
	|		Desenha uma circunferência, dados seu ponto central e raio,
	|		segundo o algoritmo de Bresenham, atualizado para atender a todos
	|		os octantes.
	+==========================================================================
	*/
	public static void circunferenciaBresenham(Vertice centro, int raio){

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
	public static void boundaryFill(Poligono poligono){

	}

	/*
	+==========================================================================
	|		Preenche um polígono utilizando o algoritmo de scanlines
	+==========================================================================
	*/
	public static void scanlines(Poligono poligono){

	}
}