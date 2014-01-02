public class CCanvas extends CNode implements IDrawable {
  public int iWidth = 400;
  public int iHeight = 300;

  public CPoint cptAnchorPoint = null; //value range: (0,1) from left to right
  public color cBackgroundColor = color(128, 128, 128); //grey
  
  //@attn: vishnu
  //1- 'g_' prefix means global variables, for which the variables can be accessed in any scope, inside any class
  //2- if you define below like this, this is a member variable instead of a global.
  //3- g_lightSource is already defined in Application.pde, why declare and create a new one again here?
//  CLightSource g_lightSource = new CLightSource();


  CCanvas() {        
    //size is a global function which will change the settings of the application, only use it in Application.pde.
    //     size(this.iX, this.iY); 

    cptAnchorPoint = new CPoint(0.5, 0.5);
    this.SetPosition(width/2, height/2); //always placed in the middle of the sketch
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    this.DrawBackground();

    return true;
  }


  void DrawBackground() {
    //draw border n bg color
    rectMode(CENTER);
    fill(this.cBackgroundColor);
    //stroke(this.cBackgroundColor);
    strokeWeight(0);//To keep the canvas fixed, otherwise the border changers as per the weight of the trail (comment this line and see)
    rect(this.GetPositionX(), this.GetPositionY(), this.iWidth, this.iHeight);
    //  rect(width/2, height/2, 100,100);
  }



  void Draw () {
    this.DrawBackground();


    // TBD Cbrush
    // stoke(this.CBrush);
    //line(g_inputController.GetX(), g_inputController.GetX(), g_inputController.GetY(), g_inputController.GetLastX(), g_inputController.GetLastY());
    g_lightSource.Draw();
  }
}

