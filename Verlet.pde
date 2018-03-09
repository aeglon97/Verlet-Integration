float x = 10;
float y = 10;
float oldx, oldy, vx, vy;
float bounce, gravity, friction;

void setup(){
 size(800,800);
 background(255);
 oldx = 5;
 oldy = 5;
 bounce = 0.9;
 gravity = 0.5;
 friction = 0.999;
}

void draw(){
  background(255);
  fill(0,0,255);
  ellipse(x,y,50,50);
  updatePoints();
}

void updatePoints(){ 
 //check bounce
 if (x > 800) {
  x = 800;
  //whenever you hit a wall, decrease velocity (slow down)
  oldx = x + vx * bounce;      
 }
 else if (x < 0){
   x = 0;
   oldx = x + vx * bounce;
 }
 
 if (y > 800){
  y = 800;
  oldy = y + vy * bounce;
 }
 else if (y < 0){
  y = 0;
  oldy = y + vy * bounce;
 }
 
 vx = (x - oldx) * friction;
 vy = (y - oldy) * friction;
 
 oldx = x;
 oldy = y;
 
 x += vx;
 y += vy;
 y += gravity;  
}