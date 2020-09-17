int currentTime;
int previousTime;
int deltaTime;

ArrayList<Mover> flock;
int flockSize = 30;

boolean debug = false;
Circle circle1;
Circle circle2;

 
void setup () {
  //fullScreen(P2D);
  size (800, 600);
  currentTime = millis();
  previousTime = millis();
  
   circle1=new Circle(random(100,600),random(100,400),50);
  
   circle2=new Circle(random(100,600),random(100,400),50);
   
 

  
  flock = new ArrayList<Mover>();
  
 
    Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-2, 2), random(-2, 2)));
    m.fillColor = color(random(255), random(255), random(255));
    flock.add(m);
  

  flock.get(0).debug = true;
}

void draw () {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;
   
 
  update(deltaTime);
  display();  
  reset();
}

/***
  The calculations should go here
*/
void update(int delta) {
  
  for (Mover m : flock) {
   
    if(circle1.isCollidingCircle(m))
    {
      m.location.x=circle2.location.x;
      m.location.y=circle2.location.y;
    }
    
   
    m.flock(flock);
    m.update(delta);
  }
}

/***
  The rendering should go here
*/
void display () {
  background(0);
   circle1.display();
   circle2.display();
  for (Mover m : flock) {
    m.display();
  }
}
void mouseClicked() 
{
  if(flock.size()<30)
  {
     Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-2, 2), random(-2, 2)));
    m.fillColor = color(random(255), random(255), random(255));
    flock.add(m);
  }
   
}
void reset()
{
  if(keyPressed==true)
      {
         if(key=='r')
        {
           for(int i=0;i<flock.size();i++)
           {
             flock.remove(i);
           }
           
          circle1=new Circle();
          circle2=new Circle();
        }     
      }
}
void keyReleased()
{
    if (key == ' ' ) 
    { 
       circle1=new Circle(random(100,600),random(100,400),50);
       circle2=new Circle(random(100,600),random(100,400),50);
    }
    if(key=='r')
    {
       circle1=new Circle(random(100,600),random(100,400),50);
       circle2=new Circle(random(100,600),random(100,400),50);
       
       Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-2, 2), random(-2, 2)));
        m.fillColor = color(random(255), random(255), random(255));
       flock.add(m);
    }
  
}
void keyPressed() {
  switch (key) {
    case 'd':
      flock.get(0).debug = !flock.get(0).debug;
      break;
  }
   if(keyPressed==true)
  {
   if (key == ' ' ) 
    { 
      circle1=new Circle();
      circle2=new Circle();
    }
  }
}
