# coding: utf-8

# Classe responsável por manter matrizes e efetuar suas operações.
class Matrix:    
    # Construtor da classe
    def __init__(self, m, n, data = []):
        self.rows = m
        self.columns = n
        self.data = data
    
    # Define a soma das instâncias(+)
    # Retorna uma matriz que é igual à soma da matriz atual com outra.
    def __add__(self, other):
        # Garante que a operação só seja feita entre matrizes de mesmo tamanho,
        # se ambas estiverem preenchidas e forem do mesmo tipo.
        assert type(self) == type(other), "Tipo {} esperado, tipo {} recebido.".format(type(self), type(other))
        assert len(self) == len(other) and self.rows == other.rows and self.columns == other.columns, "Dimensões incompatíveis para adição de matrizes: {}, {}".format(len(self), len(other))
        # Percorre os dados e soma de acordo.
        result_data = []
        for index in range(len(self.data)):
            result_data.append(self.data[index] + other.data[index])        
        return Matrix(self.rows, self.columns, result_data)        
    
    # Define a multiplicação das instâncias(*)
    # Retorna uma matriz que é igual à multiplicação da matriz atual e da
    # matriz ou escalar que é o argumento.
    def __mul__(self, other):
        # Caso se trate de uma multiplicação de matrizes...
        if type(other) == type(self):            
            m1, n1, d1 = self.rows, self.columns, len(self)
            m2, n2, d2 = other.rows, other.columns, len(other)
            # Garante que o número de colunas da primeira matriz seja igual
            # ao número de linhas da segunda
            assert n1 == m2, "Tamanho incompatível para multiplicação de matrizes"
            # Cria o array de dados da matriz resultante
            matrix_data = []
            for index in range(m1 * n2):
                i = floor(index / n2)
                j = index % n2
                matrix_data.append(0)
                for k in range(n1):
                    matrix_data[index] += self[i][k] * other[k][j]
            # Cria a matriz resultante
            result = Matrix(m1, n2, matrix_data)
            return result
        # Caso se trate de uma multiplicação de matriz por escalar...
        elif type(other) == type(0):
            # Cria o array de dados da matriz
            result_data = []
            for index in range(len(self)):
                result_data.append(self.data[index] * other)
            # Cria e retorna a matriz resultante
            return Matrix(self.rows, self.columns, result_data)
        else:
            raise TypeException('Tipo de argumento inesperado para multiplicação de matriz.({})'.format(type(other)))
            # Levanta exceção.
            
    def __sub__(self, other):
        # Garante que a operação só seja feita entre matrizes de mesmo tamanho,
        # se ambas estiverem preenchidas e forem do mesmo tipo.
        assert type(self) == type(other), "Tipo {} esperado, tipo {} recebido.".format(type(self), type(other))
        assert len(self) == len(other) and self.rows == other.rows and self.columns == other.columns, "Dimensões incompatíveis para subtração de matrizes"
        # Percorre os dados e soma de acordo.
        result_data = []
        for index in range(len(self.data)):
            result_data.append(self.data[index] - other.data[index])        
        return Matrix(self.rows, self.columns, result_data)        
        
    # Define a comparação de igualdade(==)
    def __eq__(self, other):
        assert type(other) == type(self), "Tipo {} esperado, tipo {} recebido.".format(type(self), type(other))
        if len(other) != len(self):
            return False
        else:
            for index in range(len(self.data)):
                if other.data[index] != self.data[index]:
                    break
                    return False
            return True
        
    # Define a comparação de diferença(!=)
    def __ne__(self, other):
        return not (self == other)
    
    # Define a obtenção do tamanho das instâncias(len())
    def __len__(self):
        # Retorna o número total de entradas da matriz.
        return len(self.data)
    
    # Define a representação em string das instâncias(str())
    def __str__(self):
        m, n, d = self.rows, self.columns, len(self)
        assert d == (m*n), "Matriz incompleta. Não é possível imprimir."
        string = "|"
        for index in range(d):
            string += str(self.data[index])
            if index % n - 2 == 0:
                string += "|\n|"
            else:
                string += "\t"
        # Remove os caracteres desnecessários ao fim.
        string = string.rstrip("|")
        return string
    
    # Define a obteção de uma posição da matriz(m[index][j])
    # Mais especificamente, retorna um array contendo toda a linha especificada;
    # o uso do segundo par de brackets fará com que seja executado o __getitem__
    # do array retornado.
    def __getitem__(self, index):
        slice_start = (index * self.columns) # Primeira posição da linha index
        slice_end = (slice_start + (self.columns)) # Primeira posição da linha index + 1
        return self.data[slice_start:slice_end]
    
    # Transpõe a instância
    # Retorna um objeto Matrix contendo a transposta da matriz atual
    def transposed(self):
        m, n, d = self.rows, self.columns, len(self)
        assert d == (m*n), "Matriz incompleta. Não é possível transpor."
        result_data = []
        for i in range(m):
            for j in range(n):
                result_data[(j * m) + i] = self[i][j]
        return Matrix(n, m, result_data)
    
    def trim(self, br, bc, er, ec):
        r = (er - br)
        c = (ec - bc)
        result = Matrix(r, c)
        for i in range(br, er):
            for j in range(bc, ec):
                result.data.append(self[i][j])
        
        return result

#########################################################################################################################################################
