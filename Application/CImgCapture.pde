public class CImgCapture extends CScene {
  protected Capture imgCapture = null;

  CImgCapture() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CImgCapture.Init]");

    this.imgCapture = new Capture(Application.this);
    this.imgCapture.start();

    return true;
  }

  void Draw() {   
    super.Draw();

    if (this.imgCapture.available()) {
      tint(50); //for darker image    
      this.imgCapture.read();
      this.imgCapture.filter(GRAY);
    }
    image(this.imgCapture, 0, 0);
  }

  //CTimer callback
  public void CapturePhoto() {
    this.imgCapture.stop();
    saveFrame(Configs.SAVED_PHOTO_FILEPATH);
    //this.canvas.SaveDrawing();
  }
}

