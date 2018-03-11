Point point1, point2, point3;
ArrayList<Stick> sticks = new ArrayList<Stick>();
ArrayList<Point> points = new ArrayList<Point>();

Stick stick1, stick2, stick3, stick4;
float bounce, gravity, friction;

void setup(){
 size(800,800);
 background(255);
 
 color red = color(255,0,0);
 color blue = color(0,255,0);
 color green = color(0,0,255);
  
 points.add(new Point(red, 0, 0));
 points.add(new Point(red, 100, 0));
 points.add(new Point(red, 100, 100));
 points.add(new Point(red, 0, 100));
 
 sticks.add(new Stick(points.get(0), points.get(1)));
 sticks.add(new Stick(points.get(1), points.get(2)));
 sticks.add(new Stick(points.get(2), points.get(3)));
 sticks.add(new Stick(points.get(0), points.get(3)));
 
 stick1 = new Stick(points.get(0), points.get(1));
 stick2 = new Stick(points.get(1), points.get(2));
 stick3 = new Stick(points.get(2), points.get(3));
 stick4 = new Stick(points.get(0), points.get(3));
 
 bounce = 0.9;
 gravity = 0.9;
 friction = .99;

}

void draw(){
 background(255);
 
 for (int i = 0; i < points.size(); i++){
   points.get(i).display();
 }
 
 stick1.display();
 stick2.display();
 stick3.display();
 stick4.display();
 /*for (int i = 0; i < sticks.size(); i++){
  sticks.get(i).display(); 
 }*/
 
 update();
}

void update(){
 updatePoints();
 //updateSticks();
}

class Point {
  float x, y, oldx, oldy;
  color c;
  float bounce, gravity, friction;
  
  Point (color c, float x, float y){
   this.c = c;
   this.x = x;
   this.y = y;
   this.oldx = x-5;
   this.oldy = y-5;
  }
  
  void display(){
   stroke(0); 
   fill(c);
   ellipse(this.x, this.y, 10, 10);
  }
}

  void updatePoints(){
    float vx, vy;
    
    for (int i = 0; i < points.size(); i++){
      Point p = points.get(i);
      vx = (p.x - p.oldx) * friction;
      vy = (p.y - p.oldy) * friction;
    
      p.oldx = p.x;
      p.oldy = p.y;
    
      p.x += vx;
      p.y += vy;
      p.y += gravity;

    if (p.x > 800) {
      p.x = 800;
      p.oldx = p.x + vx * bounce; 
    }
    else if (p.x < 0){
     p.x = 0;
     p.oldx = p.x + vx * bounce;
    }
    if (p.y > 800){
     p.y = 800;
     p.oldy = p.y + vy * bounce;
    }
    else if (p.y < 0){
     p.y = 0;
     p.oldy = p  .y + vy * bounce;
    }
    }
  } 

class Stick {
 Point point1, point2;
 double length;
 
 Stick (Point point1, Point point2){
  this.point1 = point1;
  this.point2 = point2;
  this.length = distance(point1, point2);
 }

 double distance (Point p0, Point p1){
   double dx = p1.x - p0.x;
   double dy = p1.y - p0.y;
   return Math.sqrt(dx * dx + dy * dy);
 }
 
 void display(){
  fill(0,0,0);
  line(point1.x, point1.y, point2.x, point2.y); 
 }  
}

void updateSticks(){
 for(int i = 0; i < sticks.size(); i++){
   Stick stick = sticks.get(i);
   float dx = stick.point2.x - stick.point1.x;
   float dy = stick.point2.y - stick.point1.y;
   
   double distance = Math.sqrt(dx * dx + dy * dy);
   double difference = stick.length;
   double percent = difference / distance / 2;
   double adjustX = dx * percent;
   double adjustY = dy * percent;
   
   stick.point1.x -= adjustX;
   stick.point1.y -= adjustY;
   stick.point2.x += adjustX;
   stick.point2.y += adjustY;
 }
}

/*
CHANGES:
-TURNED "BALLS" INTO "POINTS"
-TOOK OUT WIDTH AND HEIGHT PARAMETERS OF POINTS, CHANGED TO 10 X 10
-TOOK OUT UPDATEPOINTS() FUNCTION FROM POINT CLASS
*/