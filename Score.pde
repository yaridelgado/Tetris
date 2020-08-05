class Score {

  // multiplicador - para definir pontuação para passagem de nível
  int levelMultiplicator;
  int points; // pontos do jogador

  Score () {
    levelMultiplicator = 500; // multiplicador inicial, do primeiro nível
    points = 0;
  }

  // exibe placar
  void display() {
    pushMatrix(); // configuração original
    translate(100, 100);

    fill(0);

    // PLACAR
    textSize(32);
    textAlign(RIGHT, TOP);
    text("PLACAR", 150, 0);

    // pontos
    textSize(22);
    text(points, 150, 35);

    // NÍVEL
    textSize(32);
    textAlign(RIGHT, TOP);
    text("NÍVEL", 150, 80);

    // nível
    textSize(22);
    text(level, 150, 115);

    popMatrix(); // restaura configuração original

    // exibe peça seguinte, para preparar jogador
    displayNextPiece();
  }

  // desenha peça seguinte
  void displayNextPiece() {
    pushMatrix(); // configuração original
    translate(600, 100);

    fill(0);

    // PRÓXIMA
    textSize(26);
    textAlign(LEFT, TOP);
    text("PRÓXIMA PEÇA", 50, 0);

    // desenha peça com posições definidas
    nextPiece.display(75, 75);

    popMatrix(); // restaura configuração original
  }

  // pontos pela adição da peça ao grid
  void addPiecePoints() {
    // multiplica pelo nível para que os pontos adicionados aumentem conforme o jogo evolui
    points += 10 * level;
    checkScore();
  }

  // pontos pela exclusão de uma linha
  void addLinePoints() {
    points += 100 * level;
    checkScore();
  }

  // pontos pela mudança de nível
  void addLevelUpPoints() {
    points += 500 * level;
  }

  // verifica pontuação para controlar mudança de nível
  void checkScore() {
    // verifica se pontuação necessária para passar de nível foi superada
    if (points >= level * levelMultiplicator) {
      levelUp();                 // sobe de nível
      levelMultiplicator += 500; // aumenta o multiplicador
      addLevelUpPoints();        // adiciona pontos pela passagem de nível
    }
  }
}
