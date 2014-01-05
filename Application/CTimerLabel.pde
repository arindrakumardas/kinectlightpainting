/* The CTimer is supposed to be used twice
 * once with a countdown of 6secs during capturing mode
 * and once with a countdown of 4secs during starting mode
 *
 * for this I was thinking to have as an input parameter the fStartTime
*/

public class CTimerLabel extends CLabel{
  public ITimerHandler handler = null;
  public float fTimerDurationSec = 5; //(in sec)Time duration that want to count down
  public boolean bDisplayLabel = true;

  protected int iTimerTargetMSec = 0; //(in msec)
  protected int iTimerMSec = 0; //for keeping counting-down time (also the time that will be displayed)
  
  
  //below are not necessary now
  float fCaptureTime;
  float fStartTime;
  //@deperacated
  CTimerLabel (float fStartTime) {
    this.fCaptureTime = this.fStartTime - millis()/1000;
  }
  
  CTimerLabel(ITimerHandler timerHandler, float fTimerDurationSec){
    this.handler = timerHandler;
    this.fTimerDurationSec = fTimerDurationSec;
    this.iTimerTargetMSec = int(millis() + fTimerDurationSec*1000);
    this.iTimerMSec = int(fTimerDurationSec*1000);
    CLogger.Debug("[CTimer] timerSec:" + this.iTimerMSec);
  }
  
  public void Update(){
    super.Update();
    // keep time
    this.iTimerMSec = this.iTimerTargetMSec - millis(); //this is for counting down
    
    
    // callback when timer is up
    if(this.iTimerMSec < 0){
      if(this.handler == null){
        CLogger.Error("[CTimer.Update()]timer handler is null.");
      }
      this.handler.TimeIsUp();
    }
    
  }
  
  //@FIXME: the first digit of 6 can't be shown , but rather it shows 1 more sec after counting down to '0'. FIX This.
  public void Draw(){
    //set label text before drawing
    this.strText = "" + round(iTimerMSec/1000);
//    CLogger.Debug("[CTimer.Draw()] before draw, timerSec:" + this.iTimerMSec + " strText: " +this.strText);

    
    //draw the label if bDisplayLabel is true
    if(bDisplayLabel){
      super.Draw();
    }
    
//    CLogger.Debug("[CTimer.Draw()] after Draw, timerSec:" + this.iTimerMSec+ " strText: " +this.strText);
    this.Update();

    
    
  }

  //@deperated
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

  }
}

