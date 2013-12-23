public class CCanvas extends CNode implements IDrawable{

//  public int iX=0;
//  public int iY=0;

  public int iWidth = 400;
  public int iHeight = 300;
  
  public CPoint cptAnchorPoint = null; //value range: (0,1) from left to right
  
  public color cBackgroundColor = color(128,128,128); //grey
  
  CCanvas(){        
    //size is a global function which will change the settings of the application, only use it in Application.pde.
//     size(this.iX, this.iY); 

    cptAnchorPoint = new CPoint(0.5, 0.5);
    this.SetPosition(width/2, height/2); //always placed in the middle of the sketch

  }
  
  boolean Init(){
    if(!super.Init()){
      return false;
    }

    this.DrawBackground();
     
    return true;
  }
  
  
  void DrawBackground(){
    //draw border n bg color
    rectMode(CENTER);
    fill(this.cBackgroundColor);
    rect(this.GetPositionX(), this.GetPositionY(), this.iWidth, this.iHeight);
//    rect(width/2, height/2, 100,100);
    
  }
  
  
    
  void Draw () {
    this.DrawBackground();
    
    
    // TBD Cbrush
    // stoke(this.CBrush);
    line(mouseX, mouseY, pmouseX, pmouseY);
 }
  
}
