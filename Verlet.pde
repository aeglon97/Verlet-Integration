Ball ball1, ball2, ball3;

void setup(){
 size(800,800);
 background(255);
 
 color red = color(255,0,0);
 color blue = color(0,255,0);
 color green = color(0,0,255);
  
 ball1 = new Ball(red, 0, 0, 40, 40);
 ball2 = new Ball(green, 400, 400, 40, 40);
 ball3 = new Ball(blue, 600, 600, 40, 40);
}

void draw(){
 background(255);

 ball1.updatePoints();
 ball1.display();
 
 ball2.updatePoints();
 ball2.display();
 
 ball3.updatePoints();
 ball3.display();

}

class Ball {
  float x, y, width, height, oldx, oldy;
  color c;
  float bounce, gravity, friction;
  
  
  Ball (color c, float x, float y, float width, float height){
   this.c = c;
   this.x = x;
   this.y = y;
   this.width = width;
   this.height = height;
   this.oldx = x-5;
   this.oldy = y-5;
   bounce = 0.9;
   gravity = 0.9;
   friction = 0.999;
  }
  
  void display(){
   stroke(0); 
   fill(c);
   ellipse(this.x, this.y, this.width, this.height);
  }
  
  void updatePoints(){
    float vx, vy;
    
    vx = (this.x - this.oldx) * friction;
    vy = (this.y - this.oldy) * friction;
    
    oldx = this.x;
    oldy = this.y;
    
    this.x += vx;
    this.y += vy;
    this.y += gravity;

    if (this.x > 800) {
      this.x = 800;
      this.oldx = this.x + vx * bounce; 
    }
    else if (this.x < 0){
     this.x = 0;
     this.oldx = this.x + vx * bounce;
    }
    if (this.y > 800){
     this.y = 800;
     this.oldy = this.y + vy * bounce;
    }
    else if (this.y < 0){
     this.y = 0;
     this.oldy = this.y + vy * bounce;
    }
  }
  
}