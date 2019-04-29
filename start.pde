
void menu() {
  background(#646464);
  color col = color(#902929, 80);

  //titre 
  textSize(width/20);
  fill(#FA8E00);
  text("ZombieGame", width/2.8+ pos1, height/5);

  //bouton play
  noFill();
  strokeWeight(1);
  stroke(0);
  rect(width/2.7+ pos1, height/3, width/3.9, height/14);
  fill(0);
  textSize(width/40);
  text("Play", width/2.1+ pos1, height/2.65);

  //bouton info
  noFill();
  rect(width/2.7+ pos1, height/2, width/3.9, height/14);
  fill(0);
  textSize(width/40);
  text("Info", width/2.1+ pos1, height/1.82);

  //bouton exit
  noFill();
  rect(width/2.7+ pos1, height/1.5, width/3.9, height/14);
  fill(0);
  textSize(width/40);
  text("Exit", width/2.1+ pos1, height/1.4);


  //bouton retour
  noFill();
  rect(width/14+ pos2, height/5.6, width/3.9, height/14);
  fill(0);
  textSize(width/40);
  text("retour", width/6+ pos2, height/4.5);

  //Informations
  fill(0);
  textSize(width/42);
  text("Deplacer vous avec les touches :", width/2.8+ pos2, height/5);
  text("Mettez pause avec la touche :", width/2.8+ pos2, height/4);
  text("Tirer avec votre souris :", width/2.8+ pos2, height/3.4);
  fill(#FFB700);
  text("Z Q S D", width/1.49+ pos2, height/5);
  text("TAB", width/1.54+ pos2, height/4);
  text("Clique gauche", width/1.68+ pos2, height/3.4);


  if (info==false) {
    pos1= pos1+50;
    if (pos1>= 0) {
      pos1= 0;
    } 

    //if(mousePressed==true){
    if ( (mouseX>width/2.7+ pos1) && (mouseX<width/2.7 + width/3.9+ pos1) && (mouseY>height/3) && (mouseY<height/3 + height/14) ) { //bouton play  
      fill(col);
      rect(width/2.7+ pos1, height/3, width/3.9, height/14);
      fill(0);
      textSize(width/40);
      text("Play", width/2.1+ pos1, height/2.65);

      if (mousePressed==true) {
        temps= millis();
        play=true;
      }
    }
    if ( (mouseX>width/2.7+ pos1) && (mouseX<width/2.7 + width/3.9+ pos1) && (mouseY>height/2) && (mouseY<height/2 + height/14) ) { //bouton info
      fill(col);
      rect(width/2.7+ pos1, height/2, width/3.9, height/14);
      fill(0);
      textSize(width/40);
      text("Info", width/2.1+ pos1, height/1.82);

      if (mousePressed==true) {
        info=true;
      }
    }
    if ( (mouseX>width/2.7+ pos1) && (mouseX<width/2.7 + width/3.9+ pos1) && (mouseY>height/1.5) && (mouseY<height/1.5 + height/14) ) { //bouton Exit
      fill(col);
      rect(width/2.7+ pos1, height/1.5, width/3.9, height/14);
      fill(0);
      textSize(width/40);
      text("Exit", width/2.1+ pos1, height/1.4);

      if (mousePressed==true) {
        exit();
      }
    }
  } else if (info==true) {
    pos1= pos1-50; 
    if (pos1<= -width) {
      pos1= -width;
    }


    if ( (mouseX>width/14+ pos2) && (mouseX<width/14 + width/3.9+ pos2) && (mouseY>height/5.6) && (mouseY<height/5.6 + height/14) ) { //bouton retour
      fill(col);
      rect(width/14+ pos2, height/5.6, width/3.9, height/14);
      fill(0);
      textSize(width/40);
      text("retour", width/6+ pos2, height/4.5);
      if (mousePressed==true) {   
        info=false;
      }
    }
  }

  pos2= width+pos1;
}