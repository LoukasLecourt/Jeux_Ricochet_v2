// Declaration class Mur
class Mur {
  int angle, poseX, poseY, tailleX, tailleY;
  String type;

  // Initialisation variable
  Mur(int pX, int pY, String t) {
    this.angle=90;
    this.poseX=pX;
    this.poseY=pY;
    this.tailleX=0;
    this.tailleY=0;
    this.type=t;
  }

  // Appellation dessinerMurs
  void dessinerMurs() {
    PImage mur;
    // Dessin mur simple
    if (type == "Simple1") {
      mur = loadImage("ricochet-robots-murSimple1.jpg");
      tailleX=48;
      tailleY=14;
    } else {
      if (type == "Simple2") {
        mur = loadImage("ricochet-robots-murSimple2.jpg");
        tailleX=14;
        tailleY=48;
        // Dessin mur double
      } else {
        if (type == "Double1") {
          mur = loadImage("ricochet-robots-murDouble1.png");
          tailleX=57;
          tailleY=57;
        } else {
          if (type == "Double2") {
            mur = loadImage("ricochet-robots-murDouble2.png");
            tailleX=56;
            tailleY=56;
          } else {
            if (type == "Double3") {
              mur = loadImage("ricochet-robots-murDouble3.png");
              tailleX=56;
              tailleY=58;
            } else {
              mur = loadImage("ricochet-robots-murDouble4.png");
              tailleX=56;
              tailleY=61;
            }
          }
        }
      }
    }
    image(mur, poseX, poseY, tailleX, tailleY);
  }

  // Recuperation variable poseX
  int getX() {
    return poseX;
  }
  
  // Recuperation variable poseY
  int getY() {
    return poseY;
  }
}
