/* The CTimer is supposed to be used twice
 * once with a countdown of 6secs during capturing mode
 * and once with a countdown of 4secs during starting mode
 *
 * for this I was thinking to have as an input parameter the fStartTime
*/

public class CTimer extends CNode {

  float fCaptureTime;
  float fStartTime;

  CTimer (float fStartTime) {
    this.fCaptureTime = this.fStartTime - millis()/1000;
  }


  void Display () {

    //this.Update();

    if (fCaptureTime == 0) {
      g_pageController.GotoPageDisplay();
      //  background(100);
    }
    //    CLabel timerLabel = new CLabel(fCaptureTime);
    //    timerLabel.fFontSize = 14;
    //    timerLabel.SetPosition(200, 200);
    //    this.AddChild(timerLabel);
    //text(fCaptureTime, 200, 200);

/* ------- this should be implemented in CPageCapture
    //Create red light indicator
    fill(255, 0, 0, 100);
    ellipse(50, 50, 30, 30);
    if (this.fCaptureTime%2 == 1) {
      fill(255, 0, 0, 200);
      ellipse(50, 50, 18, 18);
    } 
    else {
      fill(0);
      ellipse(50, 50, 18, 18);
    }
*/ 
  }
}

