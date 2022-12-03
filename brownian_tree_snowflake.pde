
ArrayList<Particle> snowParticles = new ArrayList<Particle>();
ArrayList<PVector> snowCrystals = new ArrayList<PVector>();
float particleRadius = 2;
int drawnIndex;

void setup() {
  size(800, 800);

  snowCrystals.add(new PVector(0, 0));
  for(int i = 0; i < 20; i++){
    snowParticles.add(new Particle(width / 2 - random(50), 0));
  }
  background(30);
}

int corners = 6;
void draw() {

  pushMatrix();
  translate(width / 2, height / 2);

  noStroke();
  for (Particle particle : snowParticles) {
    while (!particle.update());
  }
  rotate(PI / corners);
  for (int i = 0; i < corners; i++) {
    rotate(2 * PI / corners);
    for (int j = drawnIndex; j < snowCrystals.size(); j++) {
      PVector crystal = snowCrystals.get(j);
      
      circle(crystal.x, crystal.y, particleRadius);
      circle(crystal.x, -crystal.y, particleRadius);
    }
  }
  
  drawnIndex = snowCrystals.size();
  popMatrix();
}
