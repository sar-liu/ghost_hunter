import ddf.minim.*;
Minim minim;
AudioSample swoosh;
AudioPlayer player; 
PImage bg;
PImage ghost;
float ghostX=0;
float ghostY=0;
int points=0;

void setup(){
  frameRate(1.3);
  size(1920,1080);
  bg=loadImage("bg.jpg");
  ghost=loadImage("ghost.png");
  minim = new Minim(this);
  swoosh = minim.loadSample("swoosh.mp3",512);
  player = minim.loadFile("crazy.mp3");
  player.loop(); 
  
}

void draw(){
  background(bg);
   text(points,260,70);
    textSize(40);
    text("Ghosts Vanquished",100,120);
    textSize(40);
  if (frameCount%2==0){
    ghostX=random(50,1570);
    ghostY=random(50,730);
    image(ghost,ghostX,ghostY,200,200);  
  }

}

void mousePressed(){
  if(mouseX>ghostX && mouseX<ghostX+200 && mouseY>ghostY && mouseY<ghostY+200){
    points++;
    swoosh.trigger();
  
    text("Gotcha!",width/2-50,height/2-20);
    textSize(40);
    
  }
}
