void restart() {
  //bouton menu
  fill(100, 100, 100, 150);
  strokeWeight(2);
  stroke(50);
  rect(width/2+50, height/2, 150, 100);
  fill(255);
  textSize(width/40);
  text("Menu", width/2+70, height/2+60);

  //bouton resume ou replay
  fill(100, 100, 100, 150);
  rect(width/2-200, height/2, 175, 100);
  fill(255);
  textSize(width/40);
  if (pvivant == true ) {
    text("Resume", width/2+20-200, height/2+60);
  } else {
    text("Replay", width/2+20-200, height/2+60);
  }


  //bouton menu
  if ( (mouseX > (width/2+50)) && (mouseX < ((width/2)+150+50)) && (mouseY > (height/2)) && (mouseY < ((height/2)+100)) ) {
    fill(150, 150, 150, 150);
    strokeWeight(2);
    stroke(50);
    rect(width/2+50, height/2, 150, 100);
    fill(255);
    textSize(width/40);
    text("Menu", width/2+70, height/2+60);
    if (mousePressed==true) {
      music.pause();
      fire.pause();
      setup();  //redémarre le programme
    }
  }
  //bouton resume ou replay
  if ( (mouseX>width/2-200) && (mouseX<width/2-200+175) && (mouseY>height/2) && (mouseY<height/2+100) ) {
    fill(150, 150, 150, 150);
    rect(width/2-200, height/2, 175, 100);
    fill(255);
    textSize(width/40);
    if (pvivant == true ) {
      text("Resume", width/2+20-200, height/2+60);
    } else {
      text("Replay", width/2+20-200, height/2+60);
    }
    if (mousePressed==true) {
      if (pvivant==false) { //bouton replay
        music.pause();
        fire.pause();
        setup();  //redémarre le programe
        play= true;
      } else { //bouton resume
        pause= false;
      }
    }
  }
}