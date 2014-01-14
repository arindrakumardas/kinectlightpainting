public class CImgCapture extends CScene {
//  protected Capture imgCapture = null;
//  protected PImage prevFrame;
//  protected PImage frameCapture;
    Kinect kinectCam = null;
    PImage imgCapture = null;


  CImgCapture() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CImgCapture.Init]");

//    this.imgCapture = new Capture(Application.this);
//    this.frameCapture = createImage(imgCapture.width,imgCapture.height,GRAY);
//    this.imgCapture.start();
    kinectCam = new Kinect(Application.this);
    kinectCam.start();

    return true;
  }

  void Draw() {   
    super.Draw();

//    if (this.imgCapture.available()) {
//      tint(50); //for darker image    
//      this.imgCapture.read();
//      this.imgCapture.filter(GRAY);
//    }
    
    kinectCam.enableRGB(true);
    this.imgCapture = kinectCam.getVideoImage();  
    image(this.imgCapture, 0, 0);

//    image(this.imgCapture, width/2, height/2);
  }

  //CTimer callback
  public void CapturePhoto() {
    
    //CLogger.Debug("[CImgCapture] "+" width "+imgCapture.width+" height "+imgCapture.height);
//    this.frameCapture=imgCapture.get();  
//    this.frameCapture.save(Configs.SAVED_PHOTO_FILEPATH);
//    this.imgCapture.stop();
    
    //this.canvas.SaveDrawing();
  }
}
