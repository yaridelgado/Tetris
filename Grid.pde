class Grid {

  // cores padrão
  // iguais pelo design: as linhas da grade não aparecem
  color emptyCellColor  = color(25), 
    emptyCellStroke = color(25);

  // o grid é definido pela matriz de células
  Cell[][] cells = new Cell[GRID_COLUMNS][GRID_LINES];

  // inicializa células com coordenadas, tamanho, cor e linha padrão
  // o status é livre por default
  Grid() {
    for (int i = 0; i < GRID_COLUMNS; i++) {
      for (int j = 0; j < GRID_LINES; j++) {
        cells[i][j] = new Cell(i*CELL_SIZE, j*CELL_SIZE, CELL_SIZE, emptyCellColor, emptyCellStroke);
      }
    }
  }

  // desenha grid
  void display() {
    //pushMatrix(); // configuração original
    translate(300, 100); // mantém configuração devido ao desenho das peças

    for (int i = 0; i < GRID_COLUMNS; i++) {
      for (int j = 0; j < GRID_LINES; j++) {
        Cell c = cells[i][j];

        fill(c.cellColor);
        stroke(c.cellStroke);
        rect(c.x, c.y, c.size, c.size);
      }
    }

    //popMatrix(); // restaura configuração original
  }

  // verifica se determinada posição do grid está livre
  boolean isFree(int x, int y) {
    // verifica se coordenadas estão dentro do grid
    if (insideGrid(x, y)) {
      return cells[x][y].free; // retorna estado da célula
    } else if (y < 0) {
      // não há problema se uma peça estiver antes (acima) do grid,
      // significa que ela acabou de ser criada
      return true;
    } else {
      return false;
    }
  }

  // verifica se coordenadas estão dentro do grid
  boolean insideGrid(int x, int y) {
    return x >= 0 && x < GRID_COLUMNS && 
      y >= 0 && y < GRID_LINES;
  }

  // verifica se o movimento pretendido para a peça é possível
  boolean pieceFits(Piece piece, int movement) {
    boolean fits = true;

    int[][] pieceFormat = piece.format[piece.actualVariation]; // formato/variação atual
    // posições de referência
    int x = piece.x;
    int y = piece.y;

    // simula a posição da peça de acordo com o movimento desejado
    switch (movement) {
    case MOVE_DOWN:  
      y += 1; // simula se é possível descer uma posição
      break;
    case MOVE_RIGHT:  
      x += 1; // simula se é possível mover uma posição à direita
      break;
    case MOVE_LEFT:  
      x -= 1; // simula se é possível mover uma posição à esquerda
      break;
    }
    // peça passa a ter posição simulada, para verificar se grid poderia ser ocupado

    for (int i = 0; i < BLOCKS; i++) {
      int xShift = pieceFormat[i][0];
      int yShift = pieceFormat[i][1];

      // verifica se cada célula, de acordo com os deslocamentos dos blocos, está ocupada
      // caso esteja, é retornado false - a peça não encaixa
      // movimento não será realizado
      if (!isFree(x+xShift, y+yShift)) {
        fits = false;
        break;
      }
    }

    return fits;
  }

  // verifica se a transformação da peça é possível
  boolean pieceTransformationFits(Piece piece) {
    boolean fits = true;

    int variation = piece.actualVariation; // índice do formato/variação atual
    int nextVariation = (variation + 1) % ROTATIONS; // índice da próxima rotação
    // a rotação a ser simulada e verificada é a próxima
    // a lógica seguida é a mesma pra quando a peça precisa se movimentar
    int[][] nextFormat   = piece.format[nextVariation];
    int x = piece.x;
    int y = piece.y;

    for (int i = 0; i < BLOCKS; i++) {
      int xShift = nextFormat[i][0];
      int yShift = nextFormat[i][1];

      // verifica, de acordo com os deslocamentos dos blocos, se cada bloco está dentro do grid
      // e se cada célula correspondente está ocupada
      // caso um deles seja verdadeiro, é retornado false - a peça não encaixa
      // movimento não será realizado
      if (y+yShift >= GRID_LINES || !isFree(x+xShift, y+yShift)) {
        fits = false;
        break;
      }
    }

    return fits;
  }

  // quando a peça não pode mais descer, ela é adicionada ao grid
  void addPieceToGrid(Piece piece) {
    int[][] pieceFormat = piece.format[piece.actualVariation];
    int x = piece.x;
    int y = piece.y;

    for (int i = 0; i < BLOCKS; i++) {
      int xShift = pieceFormat[i][0]; // deslocamento horizontal do bloco
      int yShift = pieceFormat[i][1]; // deslocamento vertical do bloco

      if (y+yShift > 0) {
        // o bloco está dentro do grid
        // célula é preenchida - passa a ter a cor da peça e o status de ocupada
        cells[x+xShift][y+yShift].changeState(piece.pieceColor, piece.pieceColor);
      } else { 
        // bloco não cabe no grid, peça não cabe
        // jogo deve ser encerrado
        gameOver = true;
        endGame();
      }
    }

    gameScore.addPiecePoints(); // soma pontos
    checkFullLines();           // verifica linhas completas
    goToNextPiece();            // muda a peça
  }

  // verifica linhas completas
  void checkFullLines() {
    for (int i = 0; i < GRID_LINES; i++) {
      // percorre cada linha

      boolean fullLine = true;

      // checa todas as células
      for (int j = 0; j < GRID_COLUMNS; j++) {
        if (cells[j][i].free) {
          fullLine = false;
          break;
        }
      }

      // todas as células estão ocupadas, então linha será excluída
      if (fullLine) {
        deleteLine(i);
        gameScore.addLinePoints(); // soma pontos
      }
    }
  }

  // exclui linha completa
  // recebe o índice da linha no grid
  void deleteLine(int index) {
    // substitui linhas de baixo para cima
    while (index > 0) {
      for (int j = 0; j < GRID_COLUMNS; j++) {
        // linha é substituída pela linha acima, um bloco por vez
        // para que não fiquem linhas vazias e blocos "flutuando"
        // a desejada será excluída, devido à substituição
        Cell aboveCell = cells[j][index-1];
        cells[j][index].setCell(aboveCell);
      }

      index--; // sobe uma linha
    }

    soundLineDeleting.play(0);
  }
}
