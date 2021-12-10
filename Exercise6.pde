PVector cameraPos;
PImage smiley;

void setup() {
  size(640, 480, P3D);
  cameraPos = new PVector(width, 0, 100);
  setupCapture(0);
  setupOpenCV();
smiley = loadImage("smiley.png"); 
smiley.resize(100, 100);
imageMode(CENTER);

}

void draw() {
  scale(2);
  background(0);
  updateOpenCV();
  
  image(buffer, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);

  for (int i=0; i<faces.length; i++) {
    Rectangle face = faces[i];
    if (i == 0) {
      cameraPos.x = face.x - width/2;
    }
   // DEBUG
   //  ellipse(face.x, face.y, face.width, face.height);
   //     ellipse(face.x, face.y, face.width/2, face.height/2);
image(smiley, face.x, face.y);
  }

  pushMatrix();    
  camera(cameraPos.x, cameraPos.y, cameraPos.z, 0, 0, 0, 0, -1, 0);
  
  fill(0, 127, 255);
  stroke(0);
  strokeWeight(1);
  sphere(25);

  popMatrix();
  
  surface.setTitle("" + frameRate);
}

float rotation=0;
