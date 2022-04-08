// Déclaration des différentes classes
Personnage persoBleu, persoJaune, persoVert, persoRouge;
Objectif  objectif1, objectif2, objectif3, objectif4, objectif5, objectif6, objectif7, objectif8, objectif9, objectif10, objectif11, objectif12, objectif13, objectif14, objectif15, objectif16, objectif17;
Hud hud;
Mur [] mur= new Mur[25];
Plateau plateau;
Table table;
boolean fin  = false;
String objectifAleatoire = str(int(random(1, 17)));
Chrono chrono;
PFont police;
String persoSelectionne = "jaune";

// Import kit musique
import ddf.minim.*;
AudioPlayer player;
AudioSnippet robot;
Minim minim;

// Setup
void setup() {
  size(1200, 800);
  background(200);
  frameRate(30);

  // Initialisation police + base de données + plateau
  police = loadFont("Uroob-Regular-48.vlw");
  table = loadTable("base_de_données.csv", "header");
  plateau = new Plateau();

  // Initialisation des objectifs
  objectif1 = new Objectif("1");
  objectif2 = new Objectif("2");
  objectif3 = new Objectif("3");
  objectif4 = new Objectif("4");
  objectif5 = new Objectif("5");
  objectif6 = new Objectif("6");
  objectif7 = new Objectif("7");
  objectif8 = new Objectif("8");
  objectif9 = new Objectif("9");
  objectif10 = new Objectif("10");
  objectif11 = new Objectif("11");
  objectif12 = new Objectif("12");
  objectif13 = new Objectif("13");
  objectif14 = new Objectif("14");
  objectif15 = new Objectif("15");
  objectif16 = new Objectif("16");
  objectif17 = new Objectif("17");

  // Initialisation des personnages
  persoBleu = new Personnage("bleu");
  persoJaune = new Personnage("jaune");
  persoVert = new Personnage("vert");
  persoRouge = new Personnage("rouge");

  // Initialise le hud
  hud = new Hud();

  // Initialisation du chrono et activation.
  chrono = new Chrono();
  chrono.activer();

  //Initialisation différents murs
  mur[0] = new Mur(772, 98, "Simple1");
  mur[1] = new Mur(772, 600, "Simple1");
  mur[2] = new Mur(26, 550, "Simple1");
  mur[3] = new Mur(26, 248, "Simple1");
  mur[4] = new Mur(248, 772, "Simple2");
  mur[5] = new Mur(600, 772, "Simple2");
  mur[6] = new Mur(200, 25, "Simple2");
  mur[7] = new Mur(450, 25, "Simple2");
  mur[8] = new Mur(373, 280, "Double1");
  mur[9] = new Mur(220, 478, "Double1");
  mur[10] = new Mur(672, 478, "Double1");
  mur[11] = new Mur(625, 325, "Double1");
  mur[12] = new Mur(279, 125, "Double4");
  mur[13] = new Mur(480, 575, "Double4");
  mur[14] = new Mur(180, 725, "Double4");
  mur[15] = new Mur(680, 74, "Double4");
  mur[16] = new Mur(470, 174, "Double3");
  mur[17] = new Mur(72, 323, "Double3");
  mur[18] = new Mur(522, 725, "Double3");
  mur[19] = new Mur(322, 523, "Double3");
  mur[20] = new Mur(730, 220, "Double2");
  mur[21] = new Mur(80, 670, "Double2");
  mur[22] = new Mur(730, 670, "Double2");
  mur[23] = new Mur(128, 221, "Double2");

  // Initialisation de la musique
  minim = new Minim(this);
  player = minim.loadFile("musique_ricochet2.mp3", 2048);
  player.play();
}

// Draw
void draw() {
  chrono.chronometre();

  // Selection des personnages bleu/jaune/vert/rouge
  if (mousePressed && (mouseX > persoBleu.getX()-20) && (mouseX < persoBleu.getX()+20) && (mouseY > persoBleu.getY()-20) && (mouseY  < persoBleu.getY()+20)) {
    persoSelectionne = "bleu";
  }
  if (mousePressed && (mouseX > persoJaune.getX()-20) && (mouseX < persoJaune.getX()+20) && (mouseY > persoJaune.getY()-20) && (mouseY  < persoJaune.getY()+20)) {
    persoSelectionne = "jaune";
  }
  if (mousePressed && (mouseX > persoVert.getX()-20) && (mouseX < persoVert.getX()+20) && (mouseY > persoVert.getY()-20) && (mouseY  < persoVert.getY()+20)) {
    persoSelectionne = "vert";
  }
  if (mousePressed && (mouseX > persoRouge.getX()-20) && (mouseX < persoRouge.getX()+20) && (mouseY > persoRouge.getY()-20) && (mouseY  < persoRouge.getY()+20)) {
    persoSelectionne = "rouge";
  }  

  if (fin == false) {
    background(200);

    // Mouvement des personnages
    for (int i=0; i<mur.length-1; i++) {
      persoBleu.mouv(persoSelectionne, persoBleu.contact(mur[i].getX(), mur[i].getY()));
      persoRouge.mouv(persoSelectionne, persoRouge.contact(mur[i].getX(), mur[i].getY()));
      persoVert.mouv(persoSelectionne, persoVert.contact(mur[i].getX(), mur[i].getY()));
      persoJaune.mouv(persoSelectionne, persoJaune.contact(mur[i].getX(), mur[i].getY()));
      if (i==mur.length-1) {
        i=0;
      }
    }

    // Dessine la partie fixe du plateau
    plateau.dessinerFond();
    plateau.dessinerBordure();
    plateau.dessinerCentre(objectifAleatoire);

    // Dessin du hud
    hud.dessinerHud(persoSelectionne);
    hud.setSec(chrono.getSeconde() );
    hud.setMin(chrono.getMinute());

    for (int i=0; i<mur.length-1; i++) {
      mur[i].dessinerMurs();
    }

    // Integration des Objectifs
    objectif1.dessinerObjts();
    objectif2.dessinerObjts();
    objectif3.dessinerObjts();
    objectif4.dessinerObjts();
    objectif5.dessinerObjts();
    objectif6.dessinerObjts();
    objectif7.dessinerObjts();
    objectif8.dessinerObjts();
    objectif9.dessinerObjts();
    objectif10.dessinerObjts();
    objectif11.dessinerObjts();
    objectif12.dessinerObjts();
    objectif13.dessinerObjts();
    objectif14.dessinerObjts();
    objectif15.dessinerObjts();
    objectif16.dessinerObjts();
    objectif17.dessinerObjts();

    // Integration des personnages
    persoBleu.dessinerPerso();
    persoJaune.dessinerPerso();
    persoVert.dessinerPerso();
    persoRouge.dessinerPerso();
  } else {
    // Sauvegarde des resultats dans la base de données si le jeux est terminé
    TableRow ligne = table.addRow(); // Ajoute une nouvelle ligne à la base
    // Ajoute les valeurs de la ligne
    ligne.setString("ID", "2");
    ligne.setString("nb_coups", "kikou");
    ligne.setString("temps", "ui");
    ligne.setString("liste_coups", "0ze");
    saveTable(table, "base_de_données.csv"); // Sauvegarde la base de données
    noLoop();
  }
}
