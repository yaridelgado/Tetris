final class PiecesTypes {

  // cores das peças
  // cada peça tem uma cor específica
  color[] COLORS = new color[7];
  // peças e todas as suas possíveis rotações
  int[][][][] PIECE_ROTATION = new int[PIECES][ROTATIONS][BLOCKS][BLOCK_SHIFT];

  PiecesTypes() {
    //---------- CORES
    COLORS[0] = color(66, 173, 204);  // AZUL CLARO
    COLORS[1] = color(127, 30, 96);   // VIOLETA
    COLORS[2] = color(214, 43, 77);   // VERMELHO
    COLORS[3] = color(228, 79, 134);  // ROSA
    COLORS[4] = color(255, 194, 129); // AMARELO
    COLORS[5] = color(57, 73, 135);   // AZUL-MARINHO
    COLORS[6] = color(230, 92, 58);   // CORAL

    //---------- PEÇAS
    ////   @   ////
    //// @ @ @ ////
    PIECE_ROTATION[0][0][0][0] = -1; // peça 0, rotação 0 (original), bloco/célula 0, coordenada x
    PIECE_ROTATION[0][0][0][1] = 0;  // peça 0, rotação 0 (original), bloco/célula 0, coordenada y
    PIECE_ROTATION[0][0][1][0] = 0;  // peça 0, rotação 0 (original), bloco/célula 1, coordenada x (referência)
    PIECE_ROTATION[0][0][1][1] = 0;  // peça 0, rotação 0 (original), bloco/célula 1, coordenada y (referência)
    PIECE_ROTATION[0][0][2][0] = 1;  // peça 0, rotação 0 (original), bloco/célula 2, coordenada x
    PIECE_ROTATION[0][0][2][1] = 0;  // peça 0, rotação 0 (original), bloco/célula 2, coordenada y
    PIECE_ROTATION[0][0][3][0] = 0;  // peça 0, rotação 0 (original), bloco/célula 3, coordenada x
    PIECE_ROTATION[0][0][3][1] = 1;  // peça 0, rotação 0 (original), bloco/célula 3, coordenada y
    
    PIECE_ROTATION[0][1][0][0] = 0;  // peça 0, rotação 1, bloco/célula 0, coordenada x (referência)
    PIECE_ROTATION[0][1][0][1] = 0;  // peça 0, rotação 1, bloco/célula 0, coordenada y (referência)
    PIECE_ROTATION[0][1][1][0] = 1;
    PIECE_ROTATION[0][1][1][1] = 0;
    PIECE_ROTATION[0][1][2][0] = 0;
    PIECE_ROTATION[0][1][2][1] = -1;
    PIECE_ROTATION[0][1][3][0] = 0;
    PIECE_ROTATION[0][1][3][1] = 1;

    PIECE_ROTATION[0][2][0][0] = -1;
    PIECE_ROTATION[0][2][0][1] = 0;
    PIECE_ROTATION[0][2][1][0] = 0;
    PIECE_ROTATION[0][2][1][1] = 0;
    PIECE_ROTATION[0][2][2][0] = 1;
    PIECE_ROTATION[0][2][2][1] = 0;
    PIECE_ROTATION[0][2][3][0] = 0;
    PIECE_ROTATION[0][2][3][1] = -1;

    PIECE_ROTATION[0][3][0][0] = -1;
    PIECE_ROTATION[0][3][0][1] = 0;
    PIECE_ROTATION[0][3][1][0] = 0;
    PIECE_ROTATION[0][3][1][1] = 0;
    PIECE_ROTATION[0][3][2][0] = 0;
    PIECE_ROTATION[0][3][2][1] = -1;
    PIECE_ROTATION[0][3][3][0] = 0;
    PIECE_ROTATION[0][3][3][1] = 1;

    //// @ @   ////
    ////   @ @ ////
    PIECE_ROTATION[1][0][0][0] = PIECE_ROTATION[1][2][0][0] = -1; // peça 1, rotações 0 e 2 (iguais), bloco/célula 0, coordenada x
    PIECE_ROTATION[1][0][0][1] = PIECE_ROTATION[1][2][0][1] = 1;  // peça 1, rotações 0 e 2 (iguais), bloco/célula 0, coordenada y
    PIECE_ROTATION[1][0][1][0] = PIECE_ROTATION[1][2][1][0] = 0;  // peça 1, rotações 0 e 2 (iguais), bloco/célula 1, coordenada x
    PIECE_ROTATION[1][0][1][1] = PIECE_ROTATION[1][2][1][1] = 1;  // peça 1, rotações 0 e 2 (iguais), bloco/célula 1, coordenada y
    PIECE_ROTATION[1][0][2][0] = PIECE_ROTATION[1][2][2][0] = 0;  // peça 1, rotações 0 e 2 (iguais), bloco/célula 2, coordenada x (referência)
    PIECE_ROTATION[1][0][2][1] = PIECE_ROTATION[1][2][2][1] = 0;  // peça 1, rotações 0 e 2 (iguais), bloco/célula 2, coordenada y (referência)
    PIECE_ROTATION[1][0][3][0] = PIECE_ROTATION[1][2][3][0] = 1;  // peça 1, rotações 0 e 2 (iguais), bloco/célula 3, coordenada x
    PIECE_ROTATION[1][0][3][1] = PIECE_ROTATION[1][2][3][1] = 0;  // peça 1, rotações 0 e 2 (iguais), bloco/célula 3, coordenada y

    PIECE_ROTATION[1][1][0][0] = PIECE_ROTATION[1][3][0][0] = -1; // peça 1, rotações 1 e 3 (iguais), bloco/célula 0, coordenada x
    PIECE_ROTATION[1][1][0][1] = PIECE_ROTATION[1][3][0][1] = 0;  // peça 1, rotações 1 e 3 (iguais), bloco/célula 0, coordenada y
    PIECE_ROTATION[1][1][1][0] = PIECE_ROTATION[1][3][1][0] = 0;
    PIECE_ROTATION[1][1][1][1] = PIECE_ROTATION[1][3][1][1] = 0;
    PIECE_ROTATION[1][1][2][0] = PIECE_ROTATION[1][3][2][0] = -1;
    PIECE_ROTATION[1][1][2][1] = PIECE_ROTATION[1][3][2][1] = -1;
    PIECE_ROTATION[1][1][3][0] = PIECE_ROTATION[1][3][3][0] = 0;
    PIECE_ROTATION[1][1][3][1] = PIECE_ROTATION[1][3][3][1] = 1;
    
    ////   @ @ ////
    //// @ @   ////
    PIECE_ROTATION[2][0][0][0] = PIECE_ROTATION[2][2][0][0] = 0; // peça 2, rotações 0 e 2 (iguais), bloco/célula 0, coordenada x
    PIECE_ROTATION[2][0][0][1] = PIECE_ROTATION[2][2][0][1] = 1; // peça 2, rotações 0 e 2 (iguais), bloco/célula 0, coordenada y
    PIECE_ROTATION[2][0][1][0] = PIECE_ROTATION[2][2][1][0] = 1;
    PIECE_ROTATION[2][0][1][1] = PIECE_ROTATION[2][2][1][1] = 1;
    PIECE_ROTATION[2][0][2][0] = PIECE_ROTATION[2][2][2][0] = -1;
    PIECE_ROTATION[2][0][2][1] = PIECE_ROTATION[2][2][2][1] = 0;
    PIECE_ROTATION[2][0][3][0] = PIECE_ROTATION[2][2][3][0] = 0;
    PIECE_ROTATION[2][0][3][1] = PIECE_ROTATION[2][2][3][1] = 0;

    PIECE_ROTATION[2][1][0][0] = PIECE_ROTATION[2][3][0][0] = 0; // peça 2, rotações 1 e 3 (iguais), bloco/célula 0, coordenada x
    PIECE_ROTATION[2][1][0][1] = PIECE_ROTATION[2][3][0][1] = 0; // peça 2, rotações 1 e 3 (iguais), bloco/célula 0, coordenada y
    PIECE_ROTATION[2][1][1][0] = PIECE_ROTATION[2][3][1][0] = 1;
    PIECE_ROTATION[2][1][1][1] = PIECE_ROTATION[2][3][1][1] = 0;
    PIECE_ROTATION[2][1][2][0] = PIECE_ROTATION[2][3][2][0] = 1;
    PIECE_ROTATION[2][1][2][1] = PIECE_ROTATION[2][3][2][1] = -1;
    PIECE_ROTATION[2][1][3][0] = PIECE_ROTATION[2][3][3][0] = 0;
    PIECE_ROTATION[2][1][3][1] = PIECE_ROTATION[2][3][3][1] = 1;
    
    ////// @ //////
    ////// @ //////
    ////// @ //////
    ////// @ //////
    PIECE_ROTATION[3][0][0][0] = PIECE_ROTATION[3][2][0][0] = 0;
    PIECE_ROTATION[3][0][0][1] = PIECE_ROTATION[3][2][0][1] = -1;
    PIECE_ROTATION[3][0][1][0] = PIECE_ROTATION[3][2][1][0] = 0;
    PIECE_ROTATION[3][0][1][1] = PIECE_ROTATION[3][2][1][1] = 0;
    PIECE_ROTATION[3][0][2][0] = PIECE_ROTATION[3][2][2][0] = 0;
    PIECE_ROTATION[3][0][2][1] = PIECE_ROTATION[3][2][2][1] = 1;
    PIECE_ROTATION[3][0][3][0] = PIECE_ROTATION[3][2][3][0] = 0;
    PIECE_ROTATION[3][0][3][1] = PIECE_ROTATION[3][2][3][1] = 2;

    PIECE_ROTATION[3][1][0][0] = PIECE_ROTATION[3][3][0][0] = -1;
    PIECE_ROTATION[3][1][0][1] = PIECE_ROTATION[3][3][0][1] = 0;
    PIECE_ROTATION[3][1][1][0] = PIECE_ROTATION[3][3][1][0] = 0;
    PIECE_ROTATION[3][1][1][1] = PIECE_ROTATION[3][3][1][1] = 0;
    PIECE_ROTATION[3][1][2][0] = PIECE_ROTATION[3][3][2][0] = 1;
    PIECE_ROTATION[3][1][2][1] = PIECE_ROTATION[3][3][2][1] = 0;
    PIECE_ROTATION[3][1][3][0] = PIECE_ROTATION[3][3][3][0] = 2;
    PIECE_ROTATION[3][1][3][1] = PIECE_ROTATION[3][3][3][1] = 0;
    
    //// @ @ ////
    //// @ @ ////
    // piece 4, all rotations are the same
    PIECE_ROTATION[4][0][0][0] = PIECE_ROTATION[4][1][0][0] = PIECE_ROTATION[4][2][0][0] = PIECE_ROTATION[4][3][0][0] = 0;
    PIECE_ROTATION[4][0][0][1] = PIECE_ROTATION[4][1][0][1] = PIECE_ROTATION[4][2][0][1] = PIECE_ROTATION[4][3][0][1] = 0;
    PIECE_ROTATION[4][0][1][0] = PIECE_ROTATION[4][1][1][0] = PIECE_ROTATION[4][2][1][0] = PIECE_ROTATION[4][3][1][0] = 1;
    PIECE_ROTATION[4][0][1][1] = PIECE_ROTATION[4][1][1][1] = PIECE_ROTATION[4][2][1][1] = PIECE_ROTATION[4][3][1][1] = 0;
    PIECE_ROTATION[4][0][2][0] = PIECE_ROTATION[4][1][2][0] = PIECE_ROTATION[4][2][2][0] = PIECE_ROTATION[4][3][2][0] = 0;
    PIECE_ROTATION[4][0][2][1] = PIECE_ROTATION[4][1][2][1] = PIECE_ROTATION[4][2][2][1] = PIECE_ROTATION[4][3][2][1] = 1;
    PIECE_ROTATION[4][0][3][0] = PIECE_ROTATION[4][1][3][0] = PIECE_ROTATION[4][2][3][0] = PIECE_ROTATION[4][3][3][0] = 1;
    PIECE_ROTATION[4][0][3][1] = PIECE_ROTATION[4][1][3][1] = PIECE_ROTATION[4][2][3][1] = PIECE_ROTATION[4][3][3][1] = 1;

    ///// @   ////
    ///// @   ////
    ///// @ @ ////
    PIECE_ROTATION[5][0][0][0] = 0;
    PIECE_ROTATION[5][0][0][1] = 1;
    PIECE_ROTATION[5][0][1][0] = 1;
    PIECE_ROTATION[5][0][1][1] = 1;
    PIECE_ROTATION[5][0][2][0] = 0;
    PIECE_ROTATION[5][0][2][1] = 0;
    PIECE_ROTATION[5][0][3][0] = 0;
    PIECE_ROTATION[5][0][3][1] = -1;

    PIECE_ROTATION[5][1][0][0] = 0;
    PIECE_ROTATION[5][1][0][1] = 0;
    PIECE_ROTATION[5][1][1][0] = 1;
    PIECE_ROTATION[5][1][1][1] = 0;
    PIECE_ROTATION[5][1][2][0] = 2;
    PIECE_ROTATION[5][1][2][1] = 0;
    PIECE_ROTATION[5][1][3][0] = 2;
    PIECE_ROTATION[5][1][3][1] = -1;

    PIECE_ROTATION[5][2][0][0] = 0;
    PIECE_ROTATION[5][2][0][1] = -1;
    PIECE_ROTATION[5][2][1][0] = 1;
    PIECE_ROTATION[5][2][1][1] = -1;
    PIECE_ROTATION[5][2][2][0] = 1;
    PIECE_ROTATION[5][2][2][1] = 0;
    PIECE_ROTATION[5][2][3][0] = 1;
    PIECE_ROTATION[5][2][3][1] = 1;

    PIECE_ROTATION[5][3][0][0] = 0;
    PIECE_ROTATION[5][3][0][1] = 0;
    PIECE_ROTATION[5][3][1][0] = 1;
    PIECE_ROTATION[5][3][1][1] = 0;
    PIECE_ROTATION[5][3][2][0] = 2;
    PIECE_ROTATION[5][3][2][1] = 0;
    PIECE_ROTATION[5][3][3][0] = 0;
    PIECE_ROTATION[5][3][3][1] = 1;
    
    ////   @ ////
    ////   @ ////
    //// @ @ ////
    PIECE_ROTATION[6][0][0][0] = 0;
    PIECE_ROTATION[6][0][0][1] = 1;
    PIECE_ROTATION[6][0][1][0] = 1;
    PIECE_ROTATION[6][0][1][1] = 1;
    PIECE_ROTATION[6][0][2][0] = 1;
    PIECE_ROTATION[6][0][2][1] = 0;
    PIECE_ROTATION[6][0][3][0] = 1;
    PIECE_ROTATION[6][0][3][1] = -1;

    PIECE_ROTATION[6][1][0][0] = 0;
    PIECE_ROTATION[6][1][0][1] = 0;
    PIECE_ROTATION[6][1][1][0] = 1;
    PIECE_ROTATION[6][1][1][1] = 0;
    PIECE_ROTATION[6][1][2][0] = 2;
    PIECE_ROTATION[6][1][2][1] = 0;
    PIECE_ROTATION[6][1][3][0] = 2;
    PIECE_ROTATION[6][1][3][1] = 1;

    PIECE_ROTATION[6][2][0][0] = 0;
    PIECE_ROTATION[6][2][0][1] = -1;
    PIECE_ROTATION[6][2][1][0] = 1;
    PIECE_ROTATION[6][2][1][1] = -1;
    PIECE_ROTATION[6][2][2][0] = 0;
    PIECE_ROTATION[6][2][2][1] = 0;
    PIECE_ROTATION[6][2][3][0] = 0;
    PIECE_ROTATION[6][2][3][1] = 1;

    PIECE_ROTATION[6][3][0][0] = 0;
    PIECE_ROTATION[6][3][0][1] = 0;
    PIECE_ROTATION[6][3][1][0] = 1;
    PIECE_ROTATION[6][3][1][1] = 0;
    PIECE_ROTATION[6][3][2][0] = 2;
    PIECE_ROTATION[6][3][2][1] = 0;
    PIECE_ROTATION[6][3][3][0] = 0;
    PIECE_ROTATION[6][3][3][1] = -1;
  }
}
