
ArrayList<Particle> snowParticles = new ArrayList<Particle>();
ArrayList<PVector> snowCrystals = new ArrayList<PVector>();
float particleDiameter = 2;
int drawnIndex;
float size = 550;

void setup() {
  fullScreen();

  snowCrystals.add(new PVector(0, 0));
  for(int i = 0; i < 20; i++){
    snowParticles.add(new Particle(size, 0));
  }
  background(30);  
  noStroke();
}

int corners = 6;
void draw() {
  if (keyPressed == false)
    return;
  translate(width / 2, height / 2);
  rotate(PI / corners);

  for (Particle particle : snowParticles) {
    while(!particle.update());
  }
  for (int i = 0; i < corners; i++) {
    rotate(2 * PI / corners);
    for (int j = drawnIndex; j < snowCrystals.size(); j++) {
      PVector crystal = snowCrystals.get(j);
      
      circle(crystal.x, crystal.y, particleDiameter);
      circle(crystal.x, -crystal.y, particleDiameter);
    }
  }
  
  drawnIndex = snowCrystals.size();
}
