# coding: utf-8

# Função que pinta uma linha, dados os seus pontos inicial e final, usando o algoritmo de Bresenham.
# A entrada são respectivamente, as posições x e y dos pontos inicial e final, uma tupla de cores para a linha,
# um booleano que controla se os pontos devem ser destacados e um booleano que controla se as coordenadas dos pontos
# devem ser escritas na tela.
# Apenas as coordenadas dos pontos são argumentos obrigatórios. Os demais possuem valores-padrão.
def line_bres(xi, yi, xf, yf,
                   line_color = 0,
                   paint_points = True):
    # Pré-calcula as distâncias x e y entre os pontos.
    dx = xf - xi
    dy = yf - yi
    
    # Caso a reta seja tenha muita inclinação.
    steep = abs(dy) > abs(dx)
    if steep:
        # Rotaciona a linha
        xi, yi = yi, xi
        xf, yf = yf, xf
    
    # Caso a reta seja traçada da direita para a esquerda.
    swap = xf < xi
    if swap:
        xi, xf = xf, xi
        yi, yf = yf, yi
    
    # Recalcula as distâncias x e y entre os pontos
    dx = xf - xi
    dy = yf - yi
    
    # Calcula o erro
    error = 0
    incy = 1 if yi < yf else -1
    
    stroke(line_color)
    # Itera entre os pontos
    y = yi
    for x in range(int(xi), int(xf + 1)):
        point(y, x) if steep else point(x, y)
        error -= abs(dy)
        if error < 0:
            y += incy
            error += dx
    
    if steep:
        # Desfaz a rotação
        xi, yi = yi, xi
        xf, yf = yf, xf
    
    # Pinta os pontos inicial e final de acordo com a entrada.
    if paint_points:
        fill(line_color)
        textAlign(CENTER)
        ellipse(xi, yi, 3, 3)
        ellipse(xf, yf, 3, 3)
        text("({}, {})".format(xi, yi), xi, yi + 12)
        text("({}, {})".format(xf, yf), xf, yf + 12)

####################################################################################################################

# Função que desenha uma linha dados os pontos inicial e final segundo o algoritmo DDA.
# Os argumentos de entrada são, respectivamente, x e y dos pontos inicial e final da linha, 
# a cor a ser usada para desenhar(opcional) e um booleano que controla se os pontos devem ser destacados. 
def line_dda(xi, yi, xf, yf, line_color = 0, paint_points = False):    
    # Define a distância x entre os pontos
    dx = xf - xi
    # Caso o ponto final esteja em uma coordenada x menor que o ponto inicial,
    # eles são trocados e dx é recalculado.
    if dx < 0:
        xi, yi, xf, yf = xf, yf, xi, yi
        dx = xf - xi
    # Define a distância y entre os pontos
    dy = yf - yi
    # Define a posição inicial de pintura
    x = xi
    y = yi
    
    # A maior diferença de coordenadas define a quantidade de passos para pintar a linha.
    if abs(dx) > abs(dy):
        steps = abs(dx)
    else:
        steps = abs(dy)
    
    if steps == 0:
        steps = 1
    
    # Define os incrementos x e y por iteração.
    incx = float(dx)/float(steps)
    incy = float(dy)/float(steps)
    
    # Troca a cor de pintura
    stroke(line_color)
    
    # Pinta os pontos inicial e final de acordo com a entrada.
    if paint_points:
        fill(line_color)
        textAlign(CENTER)
        ellipse(xi, yi, 3, 3)
        ellipse(xf, yf, 3, 3)
        text("({}, {})".format(xi, yi), xi, yi + 12)
        text("({}, {})".format(xf, yf), xf, yf + 12)
    
    # Pinta o primeiro ponto
    point(x, y)
    k = 0
    
    # Pinta a linha
    while k < steps:
        x += incx
        y += incy
        point(x, y)
        k += 1

####################################################################################################################

# Função que desenha uma circunferência na tela, dados o centro e o raio.
# Os argumentos de entrada são, respectivamente, as coordenadas x e y do centro, o raio,
# a cor da circunferência(opcional) e um booleano que controla se o centro deve ser destacado. 
def circle_bres(xc, yc, r, c_color = 0, draw_center = True):
    # Define a posição relativa do ponto de início.
    x = 0
    y = r
    # Define o valor inicial da variável de decisão.
    d = 3 - (2 * r)
    # Troca a cor de desenho do círculo.
    stroke(c_color)
    
    if draw_center:
        # Troca a cor de preenchimento.
        fill(c_color)
        # Troca o alinhamento e tamanho do texto.
        textAlign(CENTER)
        textSize(10)
        # Desenha a elipse que marca o ponto central.
        ellipse(xc, yc, 3, 3)
        # Desenha o texto das coordenadas do ponto central.
        text("({}, {})".format(xc, yc), xc, yc + 12)
    
    # Itera sobre x até que o octante seja totalmente desenhado.
    while x <= y:
        # Pinta os pontos nas posições relativas ao centro,
        # de forma simétrica nos oito octantes.
        point(xc + x, yc + y)
        point(xc - x, yc + y)
        point(xc + x, yc - y)
        point(xc - x, yc - y)
        point(xc + y, yc - x)
        point(xc - y, yc - x)
        point(xc + y, yc + x)
        point(xc - y, yc + x)
        
        # Toma a decisão de qual pixel pintar no octante principal.
        if d < 0:
            d += (4 * x) + 6
        else:
            d += 4 * (x - y) + 10
            y -= 1
        x += 1
