// Global constants
float[] range_freq = {1./20, 1./3}; //Hz NB usare il punto per convertire gli interi a float altrimenti ottieni divisione di interi
float pi = (float)Math.PI; // definizione della costante pigreco convertita a float 
float[] range_omega = {range_freq[0]*2*pi, range_freq[1]*2*pi}; // range di frequenza per movimento, valore minimo e massimo
float[] range_dist = {RADIUS/2, 2*RADIUS}; // raggio dei cerchi

class Agent {
  private float centerX, centerY, posX, posY;
  private float omegaX, omegaY, phiX, phiY;
  private float radius;
  private float dist;
  color c;
  Agent(){
    this.centerX = random(0.1*width, 0.9*width);
    this.centerY = random(0.1*height, 0.9*height);
    colorMode(HSB, 100);
    this.c = color(random(0, 100), random(50, 100), random(50, 100));
    this.reasoning();
    this.planning(0);
  }
 
 //private void perception() {
 //}
  
  private void reasoning() {
   this.dist = random(range_dist[0], range_dist[1]);   
   this.omegaX = random(range_omega[0], range_omega[1]);
   this.omegaY = random(range_omega[0], range_omega[1]);
   this.phiX = random(0, pi*2);
   this.phiY = random(0, pi*2);
   this.posX = this.centerX + this.dist*(float)Math.cos(this.phiX);
   this.posY = this.centerY + this.dist*(float)Math.cos(this.phiY);
  }
  
  private void planning(float t) {
    this.posX = this.centerX + this.dist*(float)Math.cos(t * this.omegaX + this.phiX);
    this.posY = this.centerY + this.dist*(float)Math.sin(t * this.omegaY + this.phiY); 
  }
  
  private void action(float t) {
    this.planning(t);
    // draw...
    noStroke();
    colorMode(HSB);
    fill(hue(this.c), saturation(this.c), brightness(this.c), ALPHA_ELEMS);
    ellipse(this.posX, this.posY, RADIUS, RADIUS);
  }
}
