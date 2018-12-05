# Trabalho CG
Os arquivos antigos de códigos para referência devem ser colocados na pasta Old.
## Usando o GIT diretamente do terminal
Para adicionar um novo arquivo, use `git add <caminho_do_arquivo>`  
Para remover um arquivo, use `git rmv <caminho_do_arquivo>`  
Ao adicionar um único arquivo, `<caminho_do_arquivo>` deve conter o nome e extensão do arquivo. Ao adicionar diretórios contendo vários arquivos, apenas o diretório-pai precisa ser especificado.
## Padrão de código
Defini como padrão de código o uso de `camelCase` nos nomes das variáveis, métodos e classes. Nomes de classes devem começar com letras maiúsculas. Classes, como é do costume de Java, sempre têm seus nomes iniciados com letras maiúsculas. Evitar identificadores pouco descritivos (como `x`, `i` ou `count`). Para constantes, usar `UPPERCASE` combinada com `snake_case`. Evitar escrever linhas além da coluna 80. No cabeçalho dos métodos, não é necessário o uso de uma sintaxe específica para gerar documentação automática; porém, favor usar o seguinte padrão para destacar a função de cada método:
```java
/*
+==============================================================================
|		Um vértice definido por suas coordenadas x, y e z.
+==============================================================================
*/ 
```
Procurar manter classes com a maior coesão possível, isto é, evitar reunir muitas funcionalidades diferentes em uma só classe. Não é necessária a criação de um arquivo separado para cada classe; porém, procurar manter a coesão.