# coding: utf-8
import matrix
import shapes

# Renderiza um poliedro usando a perspectiva cavalier.
def cavalier(poly, angle):
    # Matriz de projeção
    projection = matrix.Matrix(4, 4, [1, 0, 0, 0,
                                      0, 1, 0, 0,
                                      sin(radians(angle)), cos(radians(angle)), 0, 0,
                                      0, 0, 0, 1])
    vertex_n = len(poly.vertexes)
    # Matriz de vértices do poliedro
    vertexes_m = matrix.Matrix(vertex_n, 4, [])
    for index in range(vertex_n):
        vertexes_m.data.append(poly.vertexes[index][0])
        vertexes_m.data.append(poly.vertexes[index][1])
        vertexes_m.data.append(poly.vertexes[index][2])
        vertexes_m.data.append(1)
    vertexes_m *= projection
    #Desenha as linhas na tela
    for edge in poly.edges:
        xi, yi = int(vertexes_m[edge[0]][0]), int(vertexes_m[edge[0]][1])
        xf, yf = int(vertexes_m[edge[1]][0]), int(vertexes_m[edge[1]][1])
        shapes.line_bres(xi, yi, xf, yf, poly.border_color, False)

# Renderiza um poliedro usando a perspectiva cabinet.
def cabinet(poly, angle):
    # Matriz de projeção
    projection = matrix.Matrix(4, 4, [1, 0, 0, 0,
                                      0, 1, 0, 0,
                                      sin(radians(angle))/2, cos(radians(angle))/2, 0, 0,
                                      0, 0, 0, 1])
    vertex_n = len(poly.vertexes)
    # Matriz de vértices do poliedro
    vertexes_m = matrix.Matrix(vertex_n, 4, [])
    for index in range(vertex_n):
        vertexes_m.data.append(poly.vertexes[index][0])
        vertexes_m.data.append(poly.vertexes[index][1])
        vertexes_m.data.append(poly.vertexes[index][2])
        vertexes_m.data.append(1)
    vertexes_m *= projection
    #Desenha as linhas na tela
    for edge in poly.edges:
        xi, yi = int(vertexes_m[edge[0]][0]), int(vertexes_m[edge[0]][1])
        xf, yf = int(vertexes_m[edge[1]][0]), int(vertexes_m[edge[1]][1])
        shapes.line_bres(xi, yi, xf, yf, poly.border_color, False)
        
# Renderiza um poliedro na perspectiva isométrica.
def isometric(poly):    
     # Matriz de projeção
    projection = matrix.Matrix(4, 4, [1, 0, 0, 0,
                                      0, 1, 0, 0,
                                      0, 0, 0, 0,
                                      0, 0, 0, 1])
    # Ângulos de rotação isométrica 
    rx = 35.264
    ry = 45    
    # Aplica a rotação isométrica y ao poliedro
    poly.rotate([0, ry, 0])    
    # Atualiza o poliedro
    poly = poly.update()    
    # Aplica a rotação isométrica x ao poliedro
    poly.rotate([rx, 0, 0])    
    # Atualiza o poliedro
    poly = poly.update()    
    vertex_n = len(poly.vertexes)    
    # Matriz de vértices do poliedro
    vertexes_m = matrix.Matrix(vertex_n, 4, [])
    for index in range(vertex_n):
        vertexes_m.data.append(poly.vertexes[index][0])
        vertexes_m.data.append(poly.vertexes[index][1])
        vertexes_m.data.append(poly.vertexes[index][2])
        vertexes_m.data.append(1)
    vertexes_m *= projection    
    # Desenha as linhas na tela
    for edge in poly.edges:
        xi, yi = int(vertexes_m[edge[0]][0]), int(vertexes_m[edge[0]][1])
        xf, yf = int(vertexes_m[edge[1]][0]), int(vertexes_m[edge[1]][1])
        shapes.line_bres(xi, yi, xf, yf, poly.border_color, False)
    
