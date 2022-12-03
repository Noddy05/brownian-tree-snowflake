
ArrayList<Particle> snowParticles = new ArrayList<Particle>();
ArrayList<PVector> snowCrystals = new ArrayList<PVector>();
int particleRadius = 2;

void setup() {
  size(800, 800);

  snowCrystals.add(new PVector(0, 0));
  snowParticles.add(new Particle(width / 2, 0));
  snowParticles.add(new Particle(width / 2 - 10, 0));
  snowParticles.add(new Particle(width / 2 - 20, 0));
  snowParticles.add(new Particle(width / 2 - 30, 0));
  snowParticles.add(new Particle(width / 2 - 40, 0));
}


void draw() {
  background(30);

  pushMatrix();
  translate(width / 2, height / 2);

  noStroke();
  for (Particle particle : snowParticles) {
    while (!particle.update());
  }
  rotate(PI / 6);
  for (int i = 0; i < 6; i++) {
    rotate(PI / 3);
    for (PVector crystal : snowCrystals) {
      circle(crystal.x, crystal.y, particleRadius);
      circle(crystal.x, -crystal.y, particleRadius);
    }
  }
  popMatrix();
}
