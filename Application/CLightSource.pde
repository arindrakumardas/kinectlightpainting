public class CLightSource {

  IInputController g_inputController = new CInputMouse();
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

