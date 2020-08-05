// biblioteca para utilizar áudio
// Sound File não funcionava
import ddf.minim.*;

//---------- CONSTANTES
final int CELL_SIZE    = 25; // tamanho das células do grid
final int GRID_LINES   = 24; // quantidade de linhas do grid
final int GRID_COLUMNS = 12; // quantidade de colunas do grid

final int PIECES      = 7;  // número de peças diferentes
final int ROTATIONS   = 4;  // quantidade de variações (rotações) na forma de cada peça
final int BLOCKS      = 4;  // quantidade de blocos que compõem cada peça - padrão
final int BLOCK_SHIFT = 2;  // posições x e y relativas a um bloco central

// tipo de movimento
final int MOVE_DOWN  = 0; // descer até o fim
final int MOVE_RIGHT = 1; // deslocar uma posição à direita
final int MOVE_LEFT  = 2; // deslocar uma posição à esquerda

//---------- DESIGN E SOM
PImage wallpaper;
PFont font;

// efeitos sonoros
Minim minim;
AudioPlayer soundPieceTransforming, 
  soundPieceFalling, 
  soundLineDeleting, 
  soundLevelUp, 
  soundGameOn, 
  soundGameOver, 
  theme;

// mensagens
String messageToStart;
String messageGameOver;

//---------- VARIÁVEIS DE CONTROLE
boolean gameOn   = false;
boolean gameOver = false;

/** 
 o uso de duas variáveis para controlar o delay permite que o valor se reduza 
 (e a velocidade aumente) com o passar dos níveis, mas que, em algum momento, 
 essa velocidade possa ser restaurada, de forma a dar um respiro ao jogador
 */
float initialDelay = 1000.0; // delay: tempo pra peça mover uma posição abaixo
float levelDelay;            // delay específico do nível
int currentTime;             // milissegundos atuais, pra controlar o delay

int level;

//---------- ELEMENTOS DO JOGO
Grid  gameGrid;
Score gameScore;

PiecesTypes types;  // instância das várias peças possíveis
Piece actualPiece;
Piece nextPiece;

//---------- CONSTRUÇÃO
void setup() {
  size(900, 800);

  //wallpaper = loadImage("wallpaper01.jpg");
  wallpaper = loadImage("wallpaper02.jpg");

  // define fonte do jogo
  font = createFont("BAUHAUS.TTF", 32);
  textFont(font);
  textSize(32);

  // inicializa Minim, para que classes e métodos possam ser usados
  minim = new Minim(this);
  // define cada som
  soundPieceTransforming = minim.loadFile("sound_piece_transforming.mp3");
  soundPieceFalling = minim.loadFile("sound_piece_falling.mp3");
  soundLineDeleting = minim.loadFile("sound_line_deleting.mp3");
  soundLevelUp  = minim.loadFile("sound_level_up_02.mp3");
  soundGameOn   = minim.loadFile("sound_game_on.mp3");
  soundGameOver = minim.loadFile("sound_game_over.mp3");
  theme = minim.loadFile("tetris_theme.mp3");

  // define mensagens
  messageToStart  = "Aperte ENTER para jogar!";
  messageGameOver = "Fim de jogo :(";
}

//---------- INICIALIZAÇÃO
void startGame() {
  theme.setGain(-20);  // reduz volume
  // começa a tocar áudio do início
  // necessário para que toque toda vez que o jogo for iniciado
  soundGameOn.play(0); 

  //theme.setVolume(0.3);
  theme.setGain(-12);
  theme.loop();  // toca tema continuamente a partir do início

  gameOn   = true;
  gameOver = false;

  gameGrid  = new Grid();
  gameScore = new Score();

  types = new PiecesTypes();
  actualPiece = new Piece();
  nextPiece   = new Piece();

  levelDelay = initialDelay;
  currentTime = millis(); // instante atual
  level = 1;
}

//---------- FIM DE JOGO
void endGame() {
  gameOn   = false;
  gameOver = true;

  theme.pause();  // interrompe música
  theme.rewind(); // retorna pro início
  soundGameOver.play();
}

//---------- JOGO
void draw() { 

  if (!gameOn && !gameOver) { 
    // jogo ainda não foi iniciado 

    background(228, 79, 134);

    // mensagem de início
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text(messageToStart, width/2, height/2);
  } else if (gameOn && !gameOver) {
    // jogo iniciado e não terminado

    background(wallpaper);

    gameScore.display();
    gameGrid.display();

    actualPiece.display();

    // checa passagem de tempo (delay) para mover a peça
    int now = millis();
    if (now - currentTime > levelDelay) {
      currentTime = now;
      actualPiece.moveDown();
    }
  } else if (!gameOn && gameOver) {
    // fim de jogo 

    background(57, 73, 135);

    // mensagem de Game Over
    fill(255);
    textSize(40);
    textAlign(CENTER, CENTER);
    text(messageGameOver, width/2, height/2-30);

    // mensagem de início para indicar que é possível jogar de novo
    textSize(22);
    text(messageToStart, width/2, height/2+30);
  }
}

//---------- FUNÇÕES
void keyPressed() {
  if (!gameOn || gameOver) {
    // jogo ainda não foi iniciado
    
    if (key == ENTER) {
      startGame();
    }
  } else {
    // controle das setas
    
    switch (keyCode) {
    case UP: 
      actualPiece.transform();
      break;
    case DOWN: 
      actualPiece.moveToBottom();
      break;
    case RIGHT:
      actualPiece.moveRight();
      break;
    case LEFT:
      actualPiece.moveLeft();
      break;
    }
  }
}

// troca de peça
void goToNextPiece() {
  actualPiece = nextPiece;
  nextPiece   = new Piece();
}

// mudança de nível
void levelUp() {
  level++;
  if (levelDelay > 100) {
    levelDelay *= 0.80;
  } else {
    /**
      caso o delay tenha ficado muito pequeno (<= 100), 
      delay é restaurado para 90% do original.
      se o jogo já foi muito prolongado e a velocidade nunca fica acima de 100,
      velocidade é, pelo menos, reduzida menos intensamente.
    */
    levelDelay = initialDelay * 0.9;
    if (levelDelay == 0) {
      endGame();
    } else {
      initialDelay = levelDelay;
    }
  }

  soundLevelUp.play();
}
