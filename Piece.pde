class Piece {

  // peça, contendo todas suaas possíveis variações/rotações
  int[][][] format = new int[ROTATIONS][BLOCKS][BLOCK_SHIFT];
  color pieceColor;
  int actualVariation; // variação atual
  int x, y;            // posições iniciais, bloco de referência

  Piece() {
    // gera um índice randômico
    // de 0 a 7 para que o 6 possa ser selecionado
    int r = floor(random(0, 7));
    
    // peça do índice gerado é selecionada do arranjo de peças
    format = types.PIECE_ROTATION[r];
    actualVariation = 0;          // primeira rotação: formato original
    pieceColor = types.COLORS[r]; // cor correspondente

    // para aparecer centralizada e originalmente fora do grid
    x = GRID_COLUMNS/2-1;
    y = -2;
  }

  // desenha peça 
  // para se movimentar e cair no grid; considera posições iniciais geradas
  void display() {
    fill(pieceColor);
    stroke(255);

    // desenha cada bloco
    for (int i = 0; i < BLOCKS; i++) {
      int xShift = format[actualVariation][i][0]; // deslocamento horizontal do bloco
      int yShift = format[actualVariation][i][1]; // deslocamento vertical do bloco
      rect(CELL_SIZE*(x + xShift), CELL_SIZE*(y + yShift), CELL_SIZE, CELL_SIZE);
    }
  }

  // desenha peça em lugar específico, fora do grid
  // para ser exibida; considera posições recebidas
  void display(int translateX, int translateY) {
    fill(pieceColor);
    stroke(255);

    // desenha cada bloco
    for (int i = 0; i < BLOCKS; i++) {
      int xShift = format[0][i][0]; // deslocamento horizontal do bloco
      int yShift = format[0][i][1]; // deslocamento vertical do bloco  
      rect(translateX + CELL_SIZE*xShift, translateY + CELL_SIZE*yShift, CELL_SIZE, CELL_SIZE);
    }
  }

  // rotaciona peça
  void transform() {
    // caso ela esteja dentro do grid e possa transformar, é rotacionada
    if (gameGrid.insideGrid(x, y) && gameGrid.pieceTransformationFits(this)) {
      // modifica rotação atual
      // mantém o limite até o número máximo de rotações/variações da peça
      actualVariation = (actualVariation + 1) % ROTATIONS;
      soundPieceTransforming.play(0);
    }
    // caso contrário, nada acontece
  }

  // desce peça uma linha por vez
  void moveDown() {
    // verifica se peça encaixa uma posição abaixo
    if (gameGrid.pieceFits(this, MOVE_DOWN)) {
      // altera posição de referência - mesmo que mover peça
      y++;
    } else {
      // alcançou o fim do grid, deve ser adicionada
      gameGrid.addPieceToGrid(this);
      soundPieceFalling.play(0);
    }
  }

  // desce peça até ela alcançar o final
  void moveToBottom() {
    // enquanto a peça encaixar uma posição abaixo, será movida
    while (gameGrid.pieceFits(this, MOVE_DOWN)) {
      // altera posição de referência - mesmo que mover peça
      y++;
    }
    
    // alcançou o fim do grid, para de cair e deve ser adicionada
    gameGrid.addPieceToGrid(this);
    soundPieceFalling.play(0);
  }

  // move uma posição à direita
  void moveRight() {
    if (gameGrid.insideGrid(x, y) && gameGrid.pieceFits(this, MOVE_RIGHT)) {
      // peça encaixa, pode ser movida
      // altera posição de referência - mesmo que mover peça
      x++;
    }
  }

  // move uma posição à esquerda
  void moveLeft() {
    if (gameGrid.insideGrid(x, y) && gameGrid.pieceFits(this, MOVE_LEFT)) {
      // peça encaixa, pode ser movida
      // altera posição de referência - mesmo que mover peça
      x--;
    }
  }
}
