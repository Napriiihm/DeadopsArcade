void mouve() {
  float vitesse= width/120;


  //UNE SEULE TOUCHE
  if ((touches['z'] == true) && (touches['d'] == false)  && (touches['s'] == false)  && (touches['q'] == false)) {
    y1= y1 -vitesse;
  }
  if ((touches['z'] == false) && (touches['d'] == true)  && (touches['s'] == false)  && (touches['q'] == false)) {
    x1= x1 +vitesse;
  }
  if ((touches['z'] == false) && (touches['d'] == false)  && (touches['s'] == true)  && (touches['q'] == false)) {
    y1= y1 +vitesse;
  }
  if ((touches['z'] == false) && (touches['d'] == false)  && (touches['s'] == false)  && (touches['q'] == true)) {
    x1= x1 -vitesse;
  }

  //if(touche)

  //DEUX TOUCHES  
  vitesse= sqrt( pow(vitesse, 2) / 2 );

  // z + d ou z + q
  if ((touches['z'] == true) && (touches['d'] == true)  && (touches['s'] == false)  && (touches['q'] == false)) {
    y1= y1 -vitesse;
    x1= x1 +vitesse;
  }
  if ((touches['z'] == true) && (touches['d'] == false)  && (touches['s'] == false)  && (touches['q'] == true)) {
    y1= y1 -vitesse;
    x1= x1 -vitesse;
  }

  // s + d ou s + q
  if ((touches['z'] == false) && (touches['d'] == true)  && (touches['s'] == true)  && (touches['q'] == false)) {
    y1= y1 +vitesse;
    x1= x1 +vitesse;
  }
  if ((touches['z'] == false) && (touches['d'] == false)  && (touches['s'] == true)  && (touches['q'] == true)) {
    y1= y1 +vitesse;
    x1= x1 -vitesse;
  }


  //MUR
  if (x1<= 0 + taille1/2) {
    x1= 0 + taille1/2;
  } else if (x1>= width - taille1/2 ) {
    x1= width - taille1/2;
  }

  if (y1<= 0 + taille1/2) {
    y1= 0 + taille1/2;
  } else if (y1>= height - taille1/2 ) {
    y1= height - taille1/2;
  }
}


void keyPressed() { // la fonction s'acive uniquement une fois qu'une touche est appuyée 
  if (key != CODED) {
    touches[key] = true; //la case de la touche appuyée devient vraie
  }
}

void keyReleased() { // la fonction s'acive uniquement une fois qu'une touche est relachée
  if (key != CODED) {
    touches[key] = false; //la case de la touche relachée devient fausse
  }
}
