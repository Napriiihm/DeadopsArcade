void apparition() {

  reste= nbzm - kill;  //nombre de zombie de la manche encore vivant

  if (millis() - temps > espace ) {  //si le temps après l'apparition d'un zombie est supérieur à espace
    if (nbzombie2 < nbzm) {  //si le nombre de zombie afficher cumulé est inférieur au nombres de zombie des manches actuelle cumulées
      nbzombie2 = nbzombie2+1;  //apparition d'un nouveau zombie
      temps = millis();  //enregistre le temps à l'apparition du zombie 
      espace = time[int(random(time.length))]; //prend une nouvelle valeur du tableau time à chaque apparition de zombie
    }
  }

  if (reste==0) { //si la manche a était éliminée
    if (tempsok==false) {
      timeok=millis(); //prend le temps à la fin de la manche
      tempsok=true;
    }

    if (millis()-timeok > 5000) {  //temps d'attente de 5sec entre chaque manches
      manche= manche+1;  
      nbzombie1= nbzm; //prend la valeur du nombre de zombies des manches précédentes
      nbzm= nbzm+int(0.5*pow(manche, 2)+5);  //ajoute le nombre de zombie de la nouvelle manche
      tempsok= false;
    }
  }
}