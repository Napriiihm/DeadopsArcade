void pause() {
  if (keyPressed) {
    if (key ==  TAB) {
      if (ok == false && pvivant==true) {
        pause = !pause;
        ok = true;
      }
    } else {
      ok = false;
    }
  } else {
    ok = false;
  }

  if (pause== true) {
    fire.pause();
    noStroke();
    fill(100, 100, 100, 150);
    rect(width/2 -10, height/2 - 30, 15, 40); //
    rect(width/2 +10, height/2 - 30, 15, 40); // signe de pause

    textSize(width/40);
    fill(255);
    text("Pause:    Zombie killed = " + kill, width/3, height/2.3);
  }
}  