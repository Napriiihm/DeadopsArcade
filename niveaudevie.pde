void vie() {
  stroke(0);
  fill(0);
  textSize(width/40);
  text("LIFE=", width/60, height/20);

  if (pvivant== false) {
    fill(255);
    text("You are dead! Zombie killed = "+ kill, width/3, height/2.3) ;
  }

  noStroke();
  fill(80, 250, 60);
  rect(width/11, height/42, pvie*width/500, height/40); //taille du rectangle en fonction de la vie du joueur

  noFill();
  strokeWeight(1);
  stroke(0);
  rect(width/11, height/42, 100*width/500, height/40);

  line(width/11+pvie*width/500, height/42, pvie*width/500+width/11, height/42 + height/40); //distance de la fin du rectangle en fonction de la vie du joueur


  int pourcent= int(pvie); //met pvie en entier
  fill(40, 125, 40);
  text(pourcent+"%", width/3.3, height/20);


  textSize(width/50);
  fill(0);
  if (manche>0) {
    text("Zombie left = " + reste, width/60, height/11);
  }


  textSize(width/25);
  fill(255, 0, 0);
  if (manche>0) {
    text(manche, width/60, height/1.02);
  }
}