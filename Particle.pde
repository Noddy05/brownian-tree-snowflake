float randomSpread = 3;

class Particle {
  float x, y;
  
  Particle(float x, float y){
    this.x = x; this.y = y;
  }
  
  boolean update(){
    x -= 1;
    if(x < 0) 
      resetParticle();
      
    y += random(-randomSpread, randomSpread);
    return checkCollisions(true);
  }
  
  void resetParticle(){
    x = size;
    y = 0;
    if(checkCollisions(false)){
      noLoop();
    }
  }
  
  boolean checkCollisions(boolean resetParticle){
    for(int i = 0; i < snowCrystals.size(); i++){
      PVector crystal = snowCrystals.get(snowCrystals.size() - 1 - i);
      
      if(squaredDistance(x, abs(y), crystal.x, abs(crystal.y)) <= particleDiameter * particleDiameter){
        snowCrystals.add(new PVector(x, y));
        if(resetParticle)
          resetParticle();
          
        return true;
      }
    }
    return false;
  }
  
  //Using custom distance function for optimal performance
  float squaredDistance(float ax, float ay, float bx, float by){
    //(ax - bx)^2 + (ay - by)^2
    return 
    (ax * ax + bx * bx - 2 * ax * bx) + 
    (ay * ay + by * by - 2 * ay * by);
  }
  
  void drawParticle(){
    fill(255);
    circle(x, y, particleDiameter);
  }
}
