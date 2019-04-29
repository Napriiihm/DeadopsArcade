//personnage
float x1, y1;
float taille1;
boolean pvivant;
float pvie;
PImage perso;
float a; //angle de rotation de l'image

//touches
boolean[] touches = new boolean[256]; //tableau de boolean pour savoir si une touche est active

//zombie
Zombie[] zombie = new Zombie[50000]; //tableau d'objets des zombies
int nbzombie1;  //début d'appel du tableau
int nbzombie2;  //fin de l'appel du tableau
int temps;  //enregistre le temps à chaque aparition de zombie
int time[] = {200, 500, 800, 1000};  //temps de latence aléatoire entre chaque apparition de zombie
int espace;  //prend une nouvelle valeur du tableau time à chaque apparition de zombie
PImage[] zombieimage = new PImage[10]; //tableau des 10 images des zombies
int index;  //index de l'image affichée

//pause
boolean pause;  
boolean ok;  //pour changer l'état de pause qu'une fois

//vague
int timeok;  //temps à la fin d'une manche
int manche;  
int nbzm;  //définie le maximum que doit atteindre nbzombie2 après chaque manche
int reste;  //zombie restant
boolean tempsok;  //enregistre timeok une seul fois

//score
int kill; //nombre de kill total   
PFont font;  //police

//tir
Bullets[] bullets = new Bullets[999999];  //tableau d'objet des balles
float nbbullets1;  //début d'appel du tableau
float nbbullets2;  //fin d'appel du tableau
boolean tirsound;  //pour lancer le son une fois

//Background
PImage back;

//son
import ddf.minim.*;  //librairie du son
AudioPlayer fire;
AudioPlayer music;
Minim minim;
boolean musicplay;  //lancer la musique une seul fois

//start
boolean play;  //lance le jeux
boolean info;  //ouvre le menu info
int pos1;  //position du 1er menu
int pos2;  //position du second menu (info)

void setup() {
  //size(1425,825);
  fullScreen();

  //personnage
  x1 = width/2;
  y1 = height/2;
  taille1= width/32;
  pvivant= true;
  pvie= 100;
  perso = loadImage("perso.png");

  //Zombie
  for (int i=0; i < zombieimage.length; i++) { //load les 10 images des zombies dans le tableau zombieimage[]
    zombieimage[i] = loadImage("zombie"+i+".png");
  }

  for (int i=0; i < zombie.length; i++) {  //tous les objets Zombie sont placer dans le tableau zombie[]
    zombie[i] = new Zombie();
  }
  nbzombie1= 0;
  nbzombie2= 0;
  temps= millis();
  espace= 2000;

  //pause
  pause= false;
  ok= false;

  //vague
  tempsok= false;
  manche= 1;
  nbzm= 5;
  reste= 5;

  //score
  kill= 0;
  font=loadFont("BradleyHandITC-48.vlw");

  //tir
  for (int i=0; i < bullets.length; i++) {  //toutes les balles sont placer dans le tableau bullets[]
    bullets[i] = new Bullets();
  }
  nbbullets1= 0;
  nbbullets2= 0;
  tirsound=false;

  //Background
  back = loadImage("sol.png");
  back.resize(width, height);

  //son
  minim = new Minim(this);
  fire = minim.loadFile("GunSound.mp3");
  music = minim.loadFile("musique de fond.mp3");
  musicplay=false;

  //start
  play= false;
  info= false;
  pos1= 0;
  pos2= width;
}

void draw() {

  //image(back,0,0,width,height);
  textFont(font);
  if (play==false) {
    menu();
  }

  if (play==true) {
    background(back);
    if (musicplay==false) {
      music.loop();
      musicplay=true;
    }

    for (int i=int(nbbullets1); i < int(nbbullets2); i++) {
      bullets[i].shoot();
    }

    //personnage
    if (pvivant== true) {
      if (pause== false) {
        tir();
        mouve();
      }
      personnage();
    }

    //zombie
    if (pause== false) { 
      apparition();
    }

    for (int i= nbzombie1; i < nbzombie2; i++) {
      zombie[i].spawn();
      if (pvivant == true) { 
        if (pause== false) {
          zombie[i].mouve1();
        }
      } else {
        //mouve aléatoire
        zombie[i].mouve2();
      }
      if (pause== false) {
        zombie[i].kill();
        zombie[i].choc();
      }
    }

    vie();
    pause();

    if ( pvivant == false || pause==true) {
      restart();
    }
  }
}