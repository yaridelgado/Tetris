class Cell {

  int x, y;     // coordenadas
  int size;
  color cellColor, cellStroke;
  boolean free; // status: livre ou preenchida
  
  Cell(int aX, int aY, int aSize, color aCellColor, color aCellStroke) {
    x = aX;
    y = aY;
    size = aSize;
    cellColor  = aCellColor;
    cellStroke = aCellStroke;
    free = true;
  }
  
  // atribui o valor de uma célula a outra
  // usado no momento da exclusão de linhas, quando uma precisa ser substituída pela anterior (acima)
  void setCell(Cell definedCell) {
    cellColor  = definedCell.cellColor;
    cellStroke = definedCell.cellStroke;
    free = definedCell.free;
  }

  // altera o status da célula - de livre para ocupada e vice versa
  // precisa da indicação de cor, visto que a cor padrão da célula livre é definida pelo grid
  void changeState(color aColor, color aStroke) {
    cellColor  = aColor;
    cellStroke = aStroke;
    free = !free;
  }

}
