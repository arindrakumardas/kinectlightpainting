public class CButton extends CLayer { //this class extends CLayer because it needs to call AddChild()
  public IButtonHandler handler = null;

  public float fBtnSize = 50;
  public String strBtnCaption = null;

  protected PImage imgNormalImage = null;
  protected PImage imgSelectedImage = null;

  protected boolean bButtonOver = false;
  protected boolean bButtonSeleced = false;
  protected int iButtonOverStartTime = -1; //default is -1, means not ButtonOver

  protected final int SELECT_BUTTON_REQUIRED_TIME = 1000; //ms

  CButton (String strNormalImgPath) {
    super();
    this.imgNormalImage = loadImage(strNormalImgPath);
    this.imgNormalImage.resize(int(fBtnSize), int(fBtnSize));
    this.imgSelectedImage = this.imgNormalImage;
    //    this.SetPosition(fPosX, fPosY);
  }

  CButton (String strNormalImgPath, String strSelectedImgPath) {
    super();
    this.imgNormalImage = loadImage(strNormalImgPath);
    this.imgNormalImage.resize(int(fBtnSize), int(fBtnSize));
    this.imgSelectedImage = loadImage(strSelectedImgPath);
    this.imgSelectedImage.resize(int(fBtnSize), int(fBtnSize));
    //    this.SetPosition(fPosX, fPosY);
  }

  public boolean Init() {
    return this.Init(0, 0, null);
  }

  //below is trying to add the label as a child under this. but it's not working yet. Uncomment Draw() to see.
  public boolean Init(float fPosX, float fPosY, String strCaption) {
    if (!super.Init()) {
      return false;
    }

    this.SetPosition(fPosX, fPosY);
    if (strCaption != null) {
      CLabel captionLabel = new CLabel(strBtnCaption);
      captionLabel.fFontSize = 10;
      CLogger.Debug("[CButton.Init()] X: " + this.GetPositionX() + " y:"+ this.GetPositionY());
      captionLabel.SetPosition(this.GetPositionX(), this.GetPositionY()+this.fBtnSize);

      CLogger.Debug("[CButton.Init()] CaptionX: " + captionLabel.GetPositionX() + " CaptionY:"+ captionLabel.GetPositionY());
      this.AddChild(captionLabel);
    }

    return true;
  }

  public void SetHandler(IButtonHandler buttonHandler) {
    this.handler = buttonHandler;
  }

  public void Update() {
    super.Update();

    //Check if button is being over by any input
    if (this.IsButtonOver()) {
      this.bButtonOver = true;
      if (iButtonOverStartTime == -1) { //only set at first time
        iButtonOverStartTime = millis();

        CLogger.Debug("[CButton.Update] Button is being over. ButtonOverStartTime: " + iButtonOverStartTime);
      }
      else {
        int iButtonOverTime = millis() - iButtonOverStartTime;
        if (iButtonOverTime > SELECT_BUTTON_REQUIRED_TIME) {
          CLogger.Debug("[CButton.Update] Button is selected!");

          //@FIXME: maybe only call once?
          if (this.handler != null) {
            this.bButtonSeleced = true;
            this.handler.OnButtonSelected(this.iTag);
          }
        }
      }
    }
    else {
      this.bButtonOver = false;
      iButtonOverStartTime = -1;
    }
  }

  public void Draw() {
    //FIXME: uncomment below will lead to null pointer exception
    //    super.Draw();
    this.Update();

    //Draw button according to ButtonOver state
    imageMode(CENTER);
    if (this.bButtonOver) {
      image(imgSelectedImage, this.GetPositionX(), this.GetPositionY(), this.fBtnSize, this.fBtnSize);
       
      //Also draw button selection time arc
      int iButtonOverTime = millis() - iButtonOverStartTime;
      float fArcEndAngle = ((float(iButtonOverTime) / float(SELECT_BUTTON_REQUIRED_TIME)) * 2*PI) - HALF_PI;

      //      CLogger.Debug("[CButton.Draw()] ButtonOverTime: "+ iButtonOverTime + " Over %: " +  float(iButtonOverTime) / float(SELECT_BUTTON_REQUIRED_TIME));

      noStroke();
      fill(color(0, 255, 0, 100));
      arc(this.GetPositionX(), this.GetPositionY(), this.fBtnSize, this.fBtnSize, -HALF_PI, fArcEndAngle, PIE);
    } 
    else {
      image(imgNormalImage, this.GetPositionX(), this.GetPositionY(), this.fBtnSize, this.fBtnSize);
    }
  }

  public boolean IsButtonOver() {
    Map<Integer, CInputControllerBase> inputControllerMap = g_inputManager.GetAllInput();
    if (inputControllerMap.size() > 0)
    {
      Iterator itrInput = inputControllerMap.entrySet().iterator();     
      while (itrInput.hasNext ())
      {
        Map.Entry mapEntry = (Map.Entry)itrInput.next(); 
        int iInputId =  (Integer)mapEntry.getKey();
        CInputControllerBase inputController = (CInputControllerBase)mapEntry.getValue();

        //Button default anchor point is top left, need to recalculate center by position
        float fDistance = dist(this.GetPositionX(), this.GetPositionY(), inputController.GetX(), inputController.GetY()); 
        if (fDistance < this.fBtnSize/2 + inputController.fCursorSize/2) {
          //collide 
          return true;
        }
      }
    } 

    return false;
  }
}

