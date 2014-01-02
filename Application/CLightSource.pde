public class CLightSource {

  //@attn: vishnu
  //1- 'g_' prefix means global variables, for which the variables can be accessed in any scope, inside any class
  //2- if you define below like this, this is a member variable instead of a global.
  //3- g_lightSource is already defined in Application.pde, why declare and create a new one again here?
//  IInputController g_inputController = new CInputMouse();

  //@attn: vishnu
  //1- i don't understand why CCanvas would be created inside a CLightSource, it should be the other way round,
  // i.e. a CLightSource to be created inside CCanvas
  //2- if you need to access CCanvas variable inside this class, you can declare it Application.pde as global variable then you can access it everywhere.
  CCanvas g_ccanvas=null;


  float fX;
  float fY;
  float fPx;
  float fPy;
  float fFlow = 0.25;
  //--------For creating trailing effect-----------
  int iNum = 10;
  float fMovX[] = new float[iNum];
  float fMovY[] = new float[iNum];
  //-------------------------------------
  //int iSavedTime;
  void Draw() {

    /* int iPassedTime = millis() - iSavedTime;// Keeping a timer so that only part of the current trail is displayed (the not the whole trail from the beginning)
     if (iPassedTime > 200) {
     iSavedTime = millis(); // Save the current time to restart the timer!
     // background(128); // 
     }*/

    /*
    float targetX = mouseX;
     fX += (targetX - fX) * fFlow;
     float targetY = mouseY;
     fY += (targetY - fY) * fFlow;
     float fWeight = dist(fX, fY, fPx, fPy);
     float fInvWeight=100/fWeight;*/

    //@vishnu
    //1- Draw() is a fucntion which is called 60 times in 1 sec. are you sure you want to create a new object 60 times in 1sec?
    //can you do this in Init() or constructor?
    g_ccanvas= new CCanvas();



    float targetX = g_inputController.GetX();
    fX += (targetX - fX) * fFlow;
    float targetY = g_inputController.GetY();
    fY += (targetY - fY) * fFlow;
    float fWeight = dist(fX, fY, fPx, fPy);
    float fInvWeight=100/fWeight;

    if (fInvWeight>50) {
      fInvWeight=10;
    }
    else {
      fInvWeight=100/fWeight;
    }
    noStroke();
    //stroke(255, 255, 0);
    fill(255, 255, 0, 153);
    //strokeWeight(fInvWeight);
   
    //#################Trailing Effect - Animation########################

    int iSequence = frameCount % iNum;
    fMovX[iSequence] = fX;
    fMovY[iSequence] = fY;

    if ( (fX > (width-g_ccanvas.iWidth)/2) && (fX < g_ccanvas.iWidth+(width-g_ccanvas.iWidth)/2) && (fY > (height-g_ccanvas.iHeight)/2) && (fY < (g_ccanvas.iHeight+(height-g_ccanvas.iHeight)/2))) 
    {
      for (int i = 0; i < iNum; i++) {
        // iSequence+1 is the oldest (smallest) in the array)
        int iIndex = (iSequence+1 + i) % iNum;
        ellipse(fMovX[iIndex], fMovY[iIndex], fInvWeight, fInvWeight);
      }
      iNum=10;//Restoring to original value
      
    }
    else {
      iNum = 2;//
    }
    //##############################################

    fPy = fY;
    fPx = fX;
  }
}

