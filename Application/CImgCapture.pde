/* -------------------------- This is not working ---------------------------- */
public class CImgCapture extends CScene implements ITimerHandler {
  protected CCanvas canvas = null;
  protected Capture imgCapture = null;

  CImgCapture() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CImgCapture.Init]");

    Capture imgCapture = new Capture (this);
    this.imgCapture.start();

    //Create canvas (create canvas after because the cursor can be drawn over the above ui compoment)
    this.canvas = new CCanvas();
    this.canvas.Init(true);
    this.AddChild(this.canvas);

    return true;
  }

  void Draw() {   
    super.Draw();

    if (this.imgCapture.available()) {
      tint(100); //for darker image    
      this.imgCapture.read();
      this.imgCapture.filter(GRAY);
    }
  }

  //CTimer callback
  public void TimeIsUp(int iTag) {
    this.imgCapture.stop();
    this.imgCapture.saveFrame("photo.jpg");
    //this.canvas.SaveDrawing();
  }
}

