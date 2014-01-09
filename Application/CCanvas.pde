public class CCanvas extends CNode implements IDrawable {
  public int iWidth = 400;
  public int iHeight = 300;

  public int iLightLifeSpan = 200; //1s

  public CPoint cptAnchorPoint = null; //value range: (0,1) from left to right
  public color cBackgroundColor = color(128, 128, 128); //grey

  protected boolean bIsRecorded = false;
  protected PGraphics pgRecordedDrawing = null;

  //@attn: vishnu
  //1- 'g_' prefix means global variables, for which the variables can be accessed in any scope, inside any class
  //2- if you define below like this, this is a member variable instead of a global.
  //3- g_lightSource is already defined in Application.pde, why declare and create a new one again here?
  CLightSource lightSource = new CLightSource();

  // this is to support multi light source
  Map<Integer, CLightSource> lightSourceMap = new HashMap<Integer, CLightSource>(); //key: Input id (id of hands / mouse cursor); value: path list 



  CCanvas() {        
    //size is a global function which will change the settings of the application, only use it in Application.pde.
    //     size(this.iX, this.iY); 

    this.iWidth = int(width*0.7);
    this.iHeight = int(height*0.7);
    this.cptAnchorPoint = new CPoint(0.5, 0.5);
    this.SetPosition(width*0.5, height*0.6); //always placed in the middle of the sketch
  }

  boolean Init() {
    return this.Init(true);
  }

  boolean Init(boolean bIsDrawingCapture) {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CCanvas.Init()] IsRecorded: " + bIsRecorded);
    this.bIsRecorded = bIsDrawingCapture;

    this.pgRecordedDrawing = createGraphics(width, height);



    this.DrawBackground();

    return true;
  }

  public void Draw() {
    this.DrawBackground();

    // loop throught all inputController and draw on canvas accordingly
    Map<Integer, CInputControllerBase> inputControllerMap = g_inputManager.GetAllInput();
    if (inputControllerMap.size() > 0)
    {
      Iterator itrInput = inputControllerMap.entrySet().iterator();     
      while (itrInput.hasNext ())
      {
        Map.Entry mapEntry = (Map.Entry)itrInput.next(); 
        int iInputId =  (Integer)mapEntry.getKey();
        CInputControllerBase inputController = (CInputControllerBase)mapEntry.getValue();

        // Check if according light is created yet; otherwise crate
        CLightSource curLightSource = this.lightSourceMap.get(iInputId);
        if (curLightSource == null) {
          curLightSource = new CLightSource();
          lightSourceMap.put(iInputId, curLightSource);
        }

        if (!this.DrawLight(inputController, curLightSource)) {
          //only DrawCursor outside canvas.
          inputController.DrawCursor();
        }
      }
    }
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


  public boolean DrawLight(CInputControllerBase inputController, CLightSource curLightSource) {
    boolean bHasDrawnLight = false;

    CTimePVector tvecPos;
    CTimePVector tvecPreviousPos;
    ListIterator itrVecPos = inputController.GetPath().listIterator();
    beginShape();
    noFill();
    stroke(curLightSource.colLight);
    strokeJoin(ROUND);
    strokeWeight(curLightSource.fDefatulSize);

    if (this.bIsRecorded) {


      this.pgRecordedDrawing.beginShape();
      this.pgRecordedDrawing.noFill();
      this.pgRecordedDrawing.stroke(curLightSource.colLight);
      this.pgRecordedDrawing.strokeJoin(ROUND);
      this.pgRecordedDrawing.strokeWeight(curLightSource.fDefatulSize);
    }
    int iIdx = 0;
    while (itrVecPos.hasNext ())
    {
      if(iIdx == 0){
        this.pgRecordedDrawing.beginDraw();
        
      }else if(iIdx > 0){
        this.pgRecordedDrawing.endDraw();
      }
      iIdx++;
      tvecPos = (CTimePVector) itrVecPos.next();

      float fDistance = -1; //distance with previous point
      float fTimeSpent = -1;
      float fSpeed = 0;
      if (itrVecPos.hasNext()) {
        tvecPreviousPos = (CTimePVector) itrVecPos.next();
        itrVecPos.previous();
        fDistance = tvecPos.dist(tvecPreviousPos);
        fTimeSpent = tvecPos.iTime - tvecPreviousPos.iTime;
        fSpeed = fDistance / fTimeSpent;
      }
      //only draw if the point is still alive and within canvas
      //FIXME: a better way is not to check whether PointInsideCanvas but use a mask as a frame to cover the 4 sides

      //           CLogger.Debug("[Canvas.Draw][" +iIdx +"] " + " PointTime:" + tvecPos.iTime + " Age: " + (millis() - tvecPos.iTime) + "ms" + " Distance:" + fDistance + " TimeSpent:" + fTimeSpent + " Speed: "+ fSpeed);
      if (millis() - tvecPos.iTime <= iLightLifeSpan) {
        if (PointInsideCanvas(tvecPos.x, tvecPos.y)) {
          if (fSpeed > 1) { //speed threshold. Speed rnage: [0,5], factor [0.1, 1]
            if (fSpeed > 5) {
              fSpeed = 5;
            }
            float fFactor = 1 - map(fSpeed, 0, 5, 0, 0.9);
            //                CLogger.Debug("[Canvas.Draw]" + " fSpeed:" +fSpeed + " fFactor:" + fFactor);
            strokeWeight(curLightSource.fDefatulSize * fFactor);
            this.pgRecordedDrawing.strokeWeight(curLightSource.fDefatulSize * fFactor);
          }
          else {
            strokeWeight(curLightSource.fDefatulSize);
            this.pgRecordedDrawing.strokeWeight(curLightSource.fDefatulSize);
          }

          vertex(tvecPos.x, tvecPos.y);
          this.pgRecordedDrawing.vertex(tvecPos.x, tvecPos.y);
          bHasDrawnLight = true;
        }
      }
      else {
        //once a value exceed the timespan, any values after will also exceed the timespan
        break;
      }
    }
    endShape();
    this.pgRecordedDrawing.endShape();

    return bHasDrawnLight;
  }

  public void SaveDrawing() {
    if (this.pgRecordedDrawing != null) {
      this.pgRecordedDrawing.endDraw();
      this.pgRecordedDrawing.save(Configs.SAVED_DRAWING_FILEPATH);
    }
  }

  public boolean PointInsideCanvas(float fPosX, float fPosY) {
    PVector vecVertexTL = this.GetVertexTL();
    PVector vecVertexBR = this.GetVertexBR();

    if (fPosX >= vecVertexTL.x && fPosX <= vecVertexBR.x) {
      if (fPosY >= vecVertexTL.y && fPosY <= vecVertexBR.y) {
        return true;
      }
    }
    return false;
  }

  public PVector GetVertexTL() {
    float iVertexX = this.GetPositionX() - this.cptAnchorPoint.GetX()*this.iWidth;
    float iVertexY = this.GetPositionY() - this.cptAnchorPoint.GetY()*this.iHeight;

    return new PVector(iVertexX, iVertexY);
  }

  public PVector GetVertexTR() {
    float iVertexX = this.GetPositionX() + this.cptAnchorPoint.GetX()*this.iWidth;
    float iVertexY = this.GetPositionY() - this.cptAnchorPoint.GetY()*this.iHeight;

    return new PVector(iVertexX, iVertexY);
  }

  public PVector GetVertexBL() {
    float iVertexX = this.GetPositionX() - this.cptAnchorPoint.GetX()*this.iWidth;
    float iVertexY = this.GetPositionY() + this.cptAnchorPoint.GetY()*this.iHeight;

    return new PVector(iVertexX, iVertexY);
  }

  public PVector GetVertexBR() {
    float iVertexX = this.GetPositionX() + this.cptAnchorPoint.GetX()*this.iWidth;
    float iVertexY = this.GetPositionY() + this.cptAnchorPoint.GetY()*this.iHeight;

    return new PVector(iVertexX, iVertexY);
  }
}

