// Declaration class Objectif
class Objectif {
  // Atribut
  float cooX, cooY;
  int posAleatoire, compteur;
  String objts;

  // Constructeur
  Objectif(String p) {
    this.posAleatoire = int(random(0, 255));
    this.compteur = 0;
    this.objts = p;
    for (int positionX=25; positionX <800; positionX+=50) {
      for (int positionY=25; positionY < 800; positionY+=50) {
        if (compteur == posAleatoire) {
          cooY = float(positionY);
          cooX = float(positionX);
        }
        compteur+=1;
      }
    }
  }

  // Initialisation variable
  Objectif(int cX, int cY, String p) {
    this.cooX = cX;
    this.cooY = cY;
    this.posAleatoire = int(random(0, 255));
    this.compteur = 0;
    this.objts = p;
  }

  // Appellation dessinerObjts
  void dessinerObjts() {
    String id = "ricochet-robots-objectif" + objts + ".jpg";
    PImage objtsSelectionne;
    objtsSelectionne = loadImage(id);
    image(objtsSelectionne, cooX, cooY, 35, 35);
  }
}
