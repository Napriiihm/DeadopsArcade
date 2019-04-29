void tir() {
  if (mousePressed==true) {

    nbbullets2=nbbullets2+0.6;  //augmentation du nombre de balle
    if ( nbbullets2>=30) {
      nbbullets1=nbbullets2-30;  //pas plus de 30 balles appeler
    }

    if (tirsound==false) {
      fire.loop(); 
      tirsound=true;
    }
  } else {
    fire.pause();
    tirsound=false;
  }
}

class Bullets {

  PVector mouse;
  PVector perso;

  float x2, y2;
  float ecart;

  boolean pos;

  Bullets() {
    pos= false;
  }

  void shoot() {
    if (pos==false) {  
      mouse = new PVector(mouseX, mouseY);
      perso = new PVector(x1, y1);

      mouse.sub(perso); //vecteur du personnage vers la souris 
      mouse.setMag(50);

      ecart= random(1,3.5);

      x2= x1 +ecart*mouse.x;  //
      y2= y1 +ecart*mouse.y;  //positions de la premiere balle plus loin que le canon
      pos= true;
    }

    stroke(#FADD35);
    strokeWeight(2);
    line(x2, y2, x2+mouse.x, y2+mouse.y);  //balle

    x2= x2 +1.4*mouse.x ;  //
    y2= y2 +1.4*mouse.y ;  //mouvement de la balle
  }
}
