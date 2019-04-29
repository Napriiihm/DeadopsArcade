void personnage() {    
  PVector personnage = new PVector(x1, y1);  //vecteur vers le personnage
  PVector mouse = new PVector(mouseX, mouseY);  //vecteur vers la souris
  mouse.sub(personnage);  //vecteur de personnage vers la souris

  PVector personnageposition = new PVector(x1, 0);  
  personnageposition.sub(personnage);  //vecteur du personnage vers son projeter ortogonal sur les abscisses


  if (pause==false) {
    a= PVector.angleBetween(personnageposition, mouse);  //angle entre les deux vecteurs
    if (x1>mouseX) {
      a= -a;
    }
  }

  imageMode(CENTER);
  pushMatrix();
  translate(x1, y1);
  rotate(a);
  image(perso, 0, 0, taille1*2, taille1*2);
  popMatrix();
}