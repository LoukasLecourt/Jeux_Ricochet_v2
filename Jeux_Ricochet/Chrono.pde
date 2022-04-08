// Declaration class Chrono
class Chrono {
  int seconde, minute, compteur, frame;
  boolean activation;

  // Constructeur
  Chrono() {
    this.seconde = 0;
    this.minute = 0;
    this.compteur = 0;
    this.frame = 15;
    this.activation = false;
  }

  // Initialisation variable
  Chrono(int sec, int min, int imagesParSeconde, boolean act) {
    this.seconde = sec;
    this.minute = min;
    this.compteur = 0;
    this.frame = imagesParSeconde;
    this.activation = act;
  }
  
  // Appellation activer 
  void activer() {
    activation = true;
  }

  // Appellation desactiver
  void desactiver() {
    activation = false;
  }

  // Recuperation variable seconde
  int getSeconde() {
    return seconde;
  }

  // Recuperation variable minute
  int getMinute() {
    return minute;
  }

  // Appellation chronometre
  void chronometre() {
    if (activation == true) {
      compteur ++;
      if (compteur == frame) {
        compteur = 0;
        seconde ++;
        if (seconde == 60) {
          minute ++;
          seconde = 0;
        }
      }
    }
  }
}
