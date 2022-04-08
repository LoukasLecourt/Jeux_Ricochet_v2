// Declaration class Hud
class Hud {
  int seconde, minute, nb_coup;

  // Constructeur
  Hud () {
    this.seconde = 0;
    this.minute = 0;
    this.nb_coup = 0;
  }

  // Initialisation variable
  Hud (int sec, int min, int nb) {
    this.seconde = sec;
    this.minute = min;
    this.nb_coup = nb;
  }

  // Appellation setCoup
  void setCoup(int nb) {
    nb_coup = nb;
  }

  // Recuperation variable nb_coup
  int getCoup() {
    return nb_coup;
  }

  // Recuperation variable sec
  void setSec(int sec) {
    seconde = sec;
  }

  // Recuperation variable min
  void setMin(int min) {
    minute = min;
  }

  // Appellation dessinerHud
  void dessinerHud(String perso) {
    PImage hud;
    hud = loadImage("hud_jeux.jpg");
    image(hud, 1000, 400, 400, 800);

    // Titre
    textFont(police);
    fill(255);
    textSize(32);
    text("Jeux ricochet", 953, 34);
    fill(255, 127, 0);
    textSize(32);
    text("Jeux ricochet", 954, 35);

    // Chrono et nombre de coups
    fill(127);
    textSize(25);
    text("TEMPS", 900, 110);
    text(":", 960, 110);
    text("NOMBRE DE COUPS:", 910, 150);
    text("Min,", 995, 110);
    text("Sec", 1060, 110);
    fill(255, 127, 0);
    textSize(27);
    text(minute, 970, 110);
    text(seconde, 1035, 110);
    text(nb_coup, 1060, 150);

    // Personnage selectionnée
    fill(127);
    textSize(25);
    text("PERSONNAGE SÉLECTIONNÉ:", 890, 255);
    fill(0);
    rect(973, 280, 62, 62);
    String id = "ricochet-robots-" + perso + ".jpg";
    PImage persoSelectionne;
    persoSelectionne = loadImage(id);
    image(persoSelectionne, 1005, 312, 55, 55);

    // Messages explication du jeux
    textSize(25);
    fill(175);
    text("DEROULEMENT DU JEU :", 915, 480);
    textSize(18);
    text("Le but est d'atteindre l'objectif identique à celui présent", 850, 570);
    text("au milieu du plateau, pour cela tu peux prendre", 869, 590);
    text("le contrôle de n'importe quel personnage.", 890, 610);
  }
}
