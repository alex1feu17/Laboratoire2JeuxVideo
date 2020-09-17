public class Rectangle {
  
   float x,y,w,h;

   
   Rectangle()
   {
     x=random (width);
     y=random (height);
      
   }
   Rectangle(PVector loc,float _w,float _h) 
    {
     this.x= loc.x;
     this.y= loc.y;
     this.w=_w;
     this.h=_h;
    }
    void update () 
    {
   
    }
   void display () 
   {
    noStroke();
    fill (127, 127, 127, 127);   
    rect(x, y,w,h); 
   }
   
   boolean isInside(Mover other) 
  {
    boolean Result=false;
    if (other.location.x>this.x&&other.location.x<this.x+this.w)
    {
      if(other.location.y>this.y&&other.location.y<this.y+this.h)
      {
      
       Result= true;
       
      }     
    } 
   return Result;
  }
}
