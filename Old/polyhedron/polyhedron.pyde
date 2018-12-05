import shapes
import rendering
import matrix
import math

# Variáveis globais
window_width = 640
window_height = 480
cubo = None
x_axis, y_axis, z_axis = None, None, None
controls = False
controls_string_off = "Pressione [TAB] para exibir os controles"
controls_string_on = """Translacao:
Q = X+ | W = X-
E = Y+ | R = Y-
T = Z+ | Y = Z-

Escala:
A = X+ | S = X-
D = Y+ | F = Y-
G = Z+ | H = Z-

Rotacao:
Z = X+ | X = X-
C = Y+ | V = Y-
B = Z+ | N = Z-"""

controls_string_extra = """Extras:
[TAB] = Exibe/Esconde
o menu de ajuda.

[BACKSPACE] = Reinicia
o poliedro para suas
configuracoes originais.

P = Altera a funcao
de projecao."""

class Polyhedron:    
    
    # Variáveis de Classe
    render_method = 0
    proj_angle = 45
    
    # Construtor da classe
    def __init__(self):
        # Define os valores padrão dos atributos do objeto
        self.vertexes = []
        self.edges = []
        self.rotation = [0, 0, 0]
        self.translation = [0, 0, 0]
        self.scaling = [1, 1, 1]
        self.info = False
        self.border_color = 255
    
    # Adiciona um vértice à lista
    def addVertex(self, new_vertex):
        if type(new_vertex[0]) is int:
            self.vertexes.append(new_vertex)
        elif type(new_vertex[0]) is float:
            self.vertexes.append(new_vertex)
        elif type(new_vertex[0]) is list:
            for single_vertexes in new_vertex:
                self.addVertex(single_vertexes)
        else:
            assert 0 == 1, "Vértice(s) inválido(s)!"

    # Adiciona uma aresta à lista
    def addEdge(self, new_edge):
        if type(new_edge[0]) is int:
            self.edges.append(new_edge)
        elif type(new_edge) is list:
            for single_edges in new_edge:
                self.addEdge(single_edges)
        else:
            assert 0 == 1, "Aresta(s) inválida(s)!"
    
    # Altera os valores dos ângulos de rotação
    def rotate(self, angle_array):
        self.rotation = angle_array
    
    # Altera os valores de translação
    def translate(self, translation_array):
        self.translation = translation_array
    
    # Altera os valores da escala
    def scale(self, scale_array):
        self.scaling = scale_array
    
    # Retorna uma cópia do poliedro tendo aplicado escala, rotação e translação.
    def update(self):
        vertex_n = len(self.vertexes)
        
        # Cria a matriz de vértices
        updated_m = matrix.Matrix(vertex_n, 3, [])
        for index in range(vertex_n):
            updated_m.data.append(self.vertexes[index][0])
            updated_m.data.append(self.vertexes[index][1])
            updated_m.data.append(self.vertexes[index][2])
        
        # Calcula o ponto central do objeto
        mean = [0, 0, 0]
        for vertex in self.vertexes:
            mean[0] += vertex[0]
            mean[1] += vertex[1]
            mean[2] += vertex[2]
        
        mean[0] = float(mean[0]) / vertex_n 
        mean[1] = float(mean[1]) / vertex_n
        mean[2] = float(mean[2]) / vertex_n
        
        # Cria uma matriz de translação inicial.
        itransl_m = matrix.Matrix(vertex_n, 3, [])
        for index in range(vertex_n):
            itransl_m.data.append(-mean[0])
            itransl_m.data.append(-mean[1])
            itransl_m.data.append(-mean[2])
        
        sx, sy, sz = self.scaling[0], self.scaling[1], self.scaling[2] 
        
        # Cria uma matriz de escala.
        scale_m = matrix.Matrix(3, 3, [sx, 0, 0,
                                       0, sy, 0,
                                       0, 0, sz])
        
        # Pré-calcula os valores de seno e cosseno dos ângulos de rotação
        a = cos(radians(self.rotation[0]))
        b = sin(radians(self.rotation[0]))
        c = cos(radians(self.rotation[1]))
        d = sin(radians(self.rotation[1]))
        e = cos(radians(self.rotation[2]))
        f = sin(radians(self.rotation[2]))
        
        # Cria a matriz de rotação geral.
        # Essa matriz foi obtida pela multiplicação das
        # três matrizes de rotação uma pela outra.
        rotation_m = matrix.Matrix(3, 3, [((c * e) - (b * d * f)), (-a * f), ((d * e) + (b * c * f)),
                                          ((b * d * e) + (c * f)), (a * e), ((-b * c * e) + (d * f)),
                                          (-a * d), b, (a * c)])
        
        # Cria a matriz de translação do polígono.
        transl_m = matrix.Matrix(vertex_n, 3, [])
        for index in range(vertex_n):
            transl_m.data.append(self.translation[0])
            transl_m.data.append(self.translation[1])
            transl_m.data.append(self.translation[2])
        
        # Aplica a translação inicial nos pontos do polígono.
        updated_m += itransl_m
        # Aplica a escala nos pontos do polígono.
        updated_m *= scale_m
        # Aplica a rotação nos pontos do polígono.
        updated_m *= rotation_m
        # Desfaz a translação inicial nos pontos do polígono.
        updated_m -= itransl_m
        # Aplica a matriz de translação nos pontos do polígono.
        updated_m += transl_m
        
        # Exclui as matrizes de operação
        itransl_m = None
        scale_m = None
        rotation_m = None
        transl_m = None
        
        # Cria o polígono atualizado
        updated = Polyhedron()
        for index in range(vertex_n):
            updated.addVertex(updated_m[index])
        
        for index in range(len(self.edges)):
            updated.addEdge(self.edges[index])
        
        
        updated.info = self.info
        updated.border_color = self.border_color
        updated.render_method = self.render_method
        
        return updated
        
   
    # Renderiza o polígono 
    def render(self):
        if self.render_method == 0:
            rendering.cavalier(self.update(), self.proj_angle)            
        elif self.render_method == 1:
            rendering.cabinet(self.update(), self.proj_angle)
        elif self.render_method == 2:
            rendering.isometric(self.update())
    
    # Função padrão que retorna a cópia de um objeto    
    def __copy__(self):
        new = Polyhedron()
        new.vertexes = self.vertexes
        new.edges = self.edges
        new.rotation = self.rotation
        new.translation = self.translation
        new.scaling = self.scaling
        new.filled = self.filled
        new.paint_points = self.paint_points
        new.border_color = self.border_color
        new.fill_color = self.fill_color
        new.render_method = self.render_method
        return new

####################################################################################################################################################
            
def setup():
    global cubo, x_axis, y_axis, z_axis
    #size(window_width, window_height) # Define o tamanho da janela.
    fullScreen()
    background(0) # Define a cor do plano de fundo(branco).
    ellipseMode(RADIUS) # Define que as elipses tenham sua posição definida pelo centro.
    textAlign(CENTER) # Define o alinhamento do texto
    textSize(10) # Define o tamanho do texto
    
    # Eixos
    
    x_axis = Polyhedron()
    x_axis.addVertex([0, 0, 0])
    x_axis.addVertex([1, 0, 0])
    x_axis.addEdge([0, 1])
    x_axis.translate([width/2, height/2, 0])
    x_axis.border_color = color(0, 0, 200)
    x_axis.scale([2000, 2000, 2000])
    
    y_axis = Polyhedron()
    y_axis.addVertex([0, 0, 0])
    y_axis.addVertex([0, 1, 0])
    y_axis.addEdge([0, 1])
    y_axis.translate([width/2, height/2, 0])
    y_axis.border_color = color(200, 0, 0)
    y_axis.scale([2000, 2000, 2000])
    
    z_axis = Polyhedron()
    z_axis.addVertex([0, 0, 0])
    z_axis.addVertex([0, 0, 1])
    z_axis.addEdge([0, 1])
    z_axis.translate([width/2, height/2, 0])
    z_axis.border_color = color(0, 200, 0)
    z_axis.scale([2000, 2000, 3000])
    
    # Poliedro de teste
    cubo = Polyhedron()
    cubo.addVertex([-1, -1, -1]) # A, 0
    cubo.addVertex([-1, 1, -1]) # B, 1
    cubo.addVertex([1, 1, -1]) # C, 2
    cubo.addVertex([1, -1, -1]) # D, 3
    cubo.addVertex([-1, -1, 1]) # E, 4
    cubo.addVertex([-1, 1, 1]) # F, 5
    cubo.addVertex([1, 1, 1]) # G, 6
    cubo.addVertex([1, -1, 1]) # H, 7
    
    cubo.addEdge([0, 1])
    cubo.addEdge([1, 2])
    cubo.addEdge([2, 3])
    cubo.addEdge([3, 0])
    cubo.addEdge([4, 5])
    cubo.addEdge([5, 6])
    cubo.addEdge([6, 7])
    cubo.addEdge([7, 4])
    cubo.addEdge([0, 4])
    cubo.addEdge([1, 5])
    cubo.addEdge([2, 6])
    cubo.addEdge([3, 7])
    
    cubo.scale([100, 100, 100])
    cubo.translate([(width/2), (height/2), 0])
    cubo.info = True
    cubo.border_color = 255
    Polyhedron.proj_angle = 45
    cubo.render()
    
def draw():
    background(0)
    
    if controls:
        fill(95)
        textSize(16)
        text(controls_string_on, 100, 20)
        text(controls_string_extra, width-100, 20)
        x_axis.render()
        y_axis.render()
        z_axis.render()
    else:
        fill(95)
        textSize(16)
        text(controls_string_off, width/2, 20)
        
    cubo.render()

def keyPressed():
    global controls
    
    # Controle da ajuda
    if key == TAB:
        controls = True if not controls else False
    # Controle de reset
    elif key == BACKSPACE:
        reset()
                    
    # Controles de translação
    elif key == 'Q' or key == 'q':
        cubo.translation[0] += 20
    elif key == 'W' or key == 'w':
        cubo.translation[0] -= 20
    elif key == 'E' or key == 'e':
        cubo.translation[1] += 20
    elif key == 'R' or key == 'r':
        cubo.translation[1] -= 20
    elif key == 'T' or key == 't':
        cubo.translation[2] += 20
    elif key == 'Y' or key == 'y':
        cubo.translation[2] -= 20

    # Controles de escala
    elif key == 'A' or key == 'a':
        cubo.scaling[0] += 5
    elif key == 'S' or key == 's':
        cubo.scaling[0] -= 5
    elif key == 'D' or key == 'd' :
        cubo.scaling[1] += 5
    elif key == 'F' or key == 'f' :    
        cubo.scaling[1] -= 5
    elif key == 'G' or key == 'g' :
        cubo.scaling[2] += 5
    elif key == 'H' or key == 'h' :    
        cubo.scaling[2] -= 5

    # Controles de rotação
    elif key == 'Z' or key == 'z' :
        cubo.rotation[0] += 5
    elif key == 'X' or key == 'x' :    
        cubo.rotation[0] -= 5
    elif key == 'C' or key == 'c' :
        cubo.rotation[1] += 5
    elif key == 'V' or key == 'v' :    
        cubo.rotation[1] -= 5
    elif key == 'B' or key == 'b' :
        cubo.rotation[2] += 5
    elif key == 'N' or key == 'n' :    
        cubo.rotation[2] -= 5
    
    # Controle da troca de projeção
    elif key == 'P' or key == 'p':
       Polyhedron.render_method = (Polyhedron.render_method + 1) % 3
        
def reset():
    global cubo
    cubo.scale([100, 100, 100])
    cubo.translate([(width/2), (height/2), 0])
    cubo.rotate([0, 0, 0])
