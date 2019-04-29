class Zombie {
  //Data
  float taille2;

  boolean vivant;
  float vie;
  float apparition;  //temps de latence entre son affichage et son mouvement
  boolean score;  //augmente le nombre de kill une seule fois lorsqu'il meurt
  boolean time;  //apparition prend le temps une seule fois lorsqu'il est appelé
  boolean toucher;  //le zombie se fait toucher
  float b;  //angle de rotation

  //mouve1
  PVector location;  //vecteur de sa position

  //mouve2
  PVector speed;  //second vecteur de vitesse
  float t1, t2;  //deux temps distincts

  //Constructor
  Zombie() {
    taille2 = width/32;
    location= new PVector(random(60, width-60), random(60, height-60));
    vivant = true;
    vie= 100;
    time= false;
    apparition= millis();
    score= false;
    toucher=false;

    speed = new PVector(0, 0);
    t1=random(100);  
    t2=random(100);
  }

  void spawn() {
    if (time== false) {
      apparition= millis();
      time= true;
    }

    if (vivant == true) {
      PVector zloc= new PVector(location.x, location.y);  //égal au vecteur location
      PVector pzombie= new PVector(location.x, 0);
      pzombie.sub(zloc);  //vecteur du zombie vers son projeter ortogonal sur les abscisses
      PVector pers= new PVector(x1, y1);
      pers.sub(zloc);  //vecteur du zombie vers le personnage
      if (pvivant==true) {
        b= PVector.angleBetween(pers, pzombie);  //angle entre les deux vecteurs
        if (location.x>x1) {
          b= -b;
        }
      } else {
        b= PVector.angleBetween(speed, pzombie);
        if (speed.x<0) {
          b= -b;
        }
      }

      imageMode(CENTER);
      pushMatrix();
      translate(location.x, location.y);
      rotate(b);
      int index=0;
      if (toucher== false || pause==true ) {      //
        index=0;                                 //
      } else if (toucher==true) {                //
        index= int(random(zombieimage.length));  //  l'index change en fonction de l'état du zombie
      }
      image(zombieimage[index], 0, 0, taille2, taille2);  //charge l'image numéro "index" du tableau zombieimage[]

      popMatrix();
    }
  }

  void mouve1() {
    float vitesse= width/150;

    PVector perso = new PVector(x1, y1);
    perso.sub(location);  //vecteur du zombie vers le personnage
    perso.setMag(vitesse);  //modifie la taille du vecteur mais pas son orientation

    if (millis() - apparition > 500) {  //bouge 0,5sec après avoir apparut
      location.add(perso);
    }
  }

  void mouve2() {    
    t1=t1+0.02;  
    t2=t2+0.02;  
    speed.x= noise(t1);
    speed.y=  noise(t2);
    speed.x = map(speed.x, 0, 1, -5, 5);
    speed.y = map(speed.y, 0, 1, -5, 5);

    location.add(speed);

    //MUR
    if (location.x<= 0 + taille2/2) {
      location.x= 0 + taille2/2;
    } else if (location.x>= width - taille2/2 ) {
      location.x= width - taille2/2;
    }

    if (location.y<= 0 + taille2/2) {
      location.y= 0 + taille2/2;
    } else if (location.y>= height - taille2/2 ) {
      location.y= height - taille2/2;
    }
  }


  void kill() {
    float a= atan((taille2/2)/dist(x1, y1, location.x, location.y));  //angle entre le personnage et le centre du zombie et entre le personnage et le bord du zombie

    PVector perso = new PVector(x1, y1);
    PVector zombie = new PVector(location.x, location.y);
    zombie.sub(perso);  //vecteur du personnage vers le zombie

    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(perso);  //vecteur du personnage vers la souris 

    float b= PVector.angleBetween(zombie, mouse);  //angle entre les deux vecteurs

    if ( mousePressed == true) {
      if ( b < a && pvivant == true ) {
        vie = vie - 5;
        toucher= true;
        if (vie <= 0) {
          vie = 0;
          vivant = false;
          toucher= false;
          if (score== false) {
            kill= kill+1;
            score= true;
          }
        }
      } else {
        toucher= false;
      }
    } else {
      toucher= false;
    }
  }

  void choc() {
    float d= dist(location.x, location.y, x1, y1); //distance entre le personnage et le zombie

    if ( d < (taille1+taille2)/2 && (vivant==true) && (millis() - apparition > 500)) {
      pvie= pvie-0.3;
    }
    if (pvie <= 0) {
      pvie =0;
      pvivant= false;
      fire.pause();
    }
  }
}