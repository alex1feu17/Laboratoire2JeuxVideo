class Circle 
{
   color fillColor=color(random(0,255),random(0,255),random(0,255));
   private float radius;
   private float diametre;
   PVector location;
   Circle()
   {
     location = new PVector();    
     location.x=-50;
     location.y=-50;
     radius=0;
   }
   Circle (float _x, float _y, float radius) 
   {
     location = new PVector();    
    location.x = _x; 
    location.y = _y;
    
    setRadius(radius);
   }
    
    float getRadius() 
    {
    return radius;
    }
    
    
    void setRadius(float radius) 
    {
    this.radius = radius;
    diametre = 2 * radius;
    }
    
    void display()
    {
      noStroke();
      fill(fillColor);
      circle(location.x,location.y,radius);
    }
    
    boolean isCollidingCircle(Mover other) 
    {
        boolean result = false;
        
      if (dist(other.location.x,other.location.y,this.location.x,this.location.y)<this.radius)
      {
       
                result= true;
         
           
      } 
        
        
        return result;
    }

}
