/* --------------------------------------------------------------------------
 * CPageCapture 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageCapture extends CScene {

  float fCaptureTime;
  float fStartTime = 8;

  CPageCapture() {
    super();
  }


  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageCapture.Init]");

    //Init drawable components inside CLayer
    CLabel testLabel = new CLabel("This is PageCapture");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2, 20);
    this.AddChild(testLabel);

    CTimer captureTimer = new CTimer (6.0);
    captureTimer.Display();

    return true;
  }

  /* ---------------- not working yet ---------------------- 
  void Draw() {   
 
    //Create red light indicator
   fill(255, 0, 0, 100);
   ellipse(50, 50, 30, 30);
   
   this.fCaptureTime = this.fStartTime - millis()/1000;
   
   if (this.fCaptureTime%2 == 1) {
   fill(255, 0, 0, 200);
   ellipse(50, 50, 18, 18);
   } 
   else {
   fill(0);
   ellipse(50, 50, 18, 18);
   }
   if (this.fCaptureTime == 0) {
   g_pageController.GotoPageDisplay();
   }
   }
   --------------------------------------------------------- */
}

