// Declaration class Personnage
class Personnage {
  // Atribut
  float poseX, poseY;
  int posAleatoire, compteur;
  String perso;

  // Constructeurs
  Personnage(String p) {
    this.posAleatoire = int(random(0, 255));
    this.compteur = 0;
    this.perso = p;
    for (int positionX=25; positionX <800; positionX+=50) {
      for (int positionY=25; positionY < 800; positionY+=50) {
        if (compteur == posAleatoire) {
          poseY = float(positionY);
          poseX = float(positionX);
        }
        compteur+=1;
      }
    }
  }

  // Initialisation variables
  Personnage(int pX, int pY, String p) {
    this.poseX = pX;
    this.poseY = pY;
    this.posAleatoire = int(random(0, 255));
    this.compteur = 0;
    this.perso = p;
  }

  // Appellation dessinerPerso
  void dessinerPerso() {
    String id = "ricochet-robots-" + perso + ".jpg";
    PImage persoSelectionne;
    persoSelectionne = loadImage(id);
    image(persoSelectionne, poseX, poseY, 35, 35);
  }

  // Recuperation variable poseX
  float getX() {
    return poseX;
  }

  // Recuperation variable poseY
  float getY() {
    return poseY;
  }

  // Si il y a contact entre un mur et un personnage il s'arrête
  boolean contact(int pX, int pY) {
    boolean stop = false;
    for (int i =0; i<mur.length; i++) {
      stop = dist(poseX, poseY, pX, pY) < 15;
    }
    if (stop) {
      player.close();
      return false;
    } else {
      return true;
    }
  }

  // Si il n'y a pas de contact entre un mur et un personnage et qu'un des 4 déplacements est effectué par l'activation d'une flèche directionnelle il se déplace
  void mouv(String persoSelectionne, boolean contact) {
    if (persoSelectionne == perso) {
      robot = minim.loadSnippet("waka_waka3.mp3");
      // Si c'est gauche
      if ( keyCode == LEFT) {
        if (contact && (poseX>25 && poseX<375 && poseY>25 && poseY<775 || poseX>475 && poseX<775 && poseY>25 && poseY<775)) {
          poseX -=0.5;
          robot.play();
        } else {
          keyCode = 0;
        }
      }
      // Si c'est droit
      if ( keyCode == RIGHT) {
        if (contact && (poseX>25 && poseX<328 && poseY>25 && poseY<775 || poseX>455 && poseX<775 && poseY>25 && poseY<775)) {
          poseX +=0.5;
          robot.play();
        } else {
          keyCode = 0;
        }
      }
      // Si c'est haut
      if ( keyCode == UP) {
        if (contact && (poseY>25 && poseY<330 && poseX>25 && poseX<775 || poseY>475 && poseY<775 && poseX>25 && poseX<775)) {
          poseY -=0.5;
          robot.play();
        } else {
          keyCode = 0;
        }
      }
      // Si c'est bas
      if ( keyCode == DOWN ) {
        if (contact && (poseY>25 && poseY<328 && poseX>25 && poseX<775 || poseY>455 && poseY<775 && poseX>25 && poseX<775)) {
          poseY +=0.5;
          robot.play();
        } else {
          keyCode = 0;
        }
      }
    }
  }
}
