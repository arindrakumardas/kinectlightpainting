/* --------------------------------------------------------------------------
 * CInputManager is a singleton, which means to manage all inputs on the screen, i.e. all hands kinect input, or mouse cursor input.
 * author:  Gigi Ho
 * date:  5/1/2014
 * ----------------------------------------------------------------------------
 */
public class CInputManager {
  public SimpleOpenNI kinect = null;


  public Map<Integer, CInputControllerBase> inputControllerMap = new HashMap<Integer, CInputControllerBase>(); //key: Input id (id of hands / mouse cursor); value: InputController; handId always starts with 1, id 0 is for mouse

  CInputManager() {
  }

  public boolean Init(processing.core.PApplet coreApp) {
    this.kinect = new SimpleOpenNI(coreApp);

    if (this.kinect.isInit() == true)
    {
      CLogger.Info("[CInputManager.Init()] InputController : InputKinect");

      this.kinect.setMirror(true); // mirror is by default enabled//
      this.kinect.enableDepth();  // enable depthMap generation 
      this.kinect.enableRGB(); //Enable the camera image collection

      this.kinect.enableHand();
      this.kinect.startGesture(SimpleOpenNI.GESTURE_HAND_RAISE); //GESTURE_HAND_RAISE , GESTURE_WAVE

        // set how smooth the hand capturing should be
      this.kinect.setSmoothingHand(0.5);
    }
    else {
      //      g_inputController = new CInputMouse();
      CLogger.Info("[CInputManager.Init()] InputController : InputMouse");

      CInputControllerBase mouseInputController = new CInputMouse();
      mouseInputController.Init();
      this.inputControllerMap.put(((CInputMouse)mouseInputController).iDefaultInputId, mouseInputController);
    }

    return true;
  }

  public void Update() {
    //updating kinect
    if (this.kinect.isInit() == true) {
      this.kinect.update();
      
    }

    // for updating mouse vecList
    CInputControllerBase mouseController = this.inputControllerMap.get(0);
    if (mouseController != null && mouseController instanceof CInputMouse) {
      mouseController.Update();
    }
  }

  public Map<Integer, CInputControllerBase> GetAllInput() {
    return this.inputControllerMap;
  }

  public CInputControllerBase GetInput(int iInputId) {
    CInputControllerBase inputController = this.inputControllerMap.get(new Integer(iInputId));
    if (inputController == null) {
      return null;
    }

    return inputController;
  }

  //only call this when there is no canvas in that page. otherwise there will be cursor too in the canvas
  //calling this will always draw cursors everwhere
  public void DrawAllCursor() {
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

        inputController.DrawCursor();
      }
    }
  }
  
  public boolean HasKinect(){
    return this.kinect.isInit();
    
  }


  // -----------------------------------------------------------------
  // SImpleOpenNI callbacks
  // -----------------------------------------------------------------
  // hand events

  void OnNewHand(SimpleOpenNI curContext, int iHandId, PVector vecPos)
  {
    //Create inputController here
    CInputControllerBase kinectInputController = new CInputKinect();
    kinectInputController.Init();

    // convert vecPos to projective space and also CTimePVector
    //    ArrayList<CTimePVector> tvecPosList = new ArrayList<CTimePVector>();
    PVector vecProjectivePos = new PVector();
    this.kinect.convertRealWorldToProjective(vecPos, vecProjectivePos);

    CTimePVector tvecPos = new CTimePVector(millis(), vecProjectivePos);
    //    tvecPosList.add(tvecPos);
    kinectInputController.AddToList(tvecPos);


    //    this.tvecPathListMap.put(iHandId, tvecPosList);
    this.inputControllerMap.put(iHandId, kinectInputController);

    CLogger.Info("[InputKinect.OnNewHand()] - handId: " + iHandId + ", pos: " + vecPos + " Num. of inputs:" + this.inputControllerMap.size());
  }

  void OnTrackedHand(SimpleOpenNI curContext, int handId, PVector pos)
  {
    //    CLogger.Info("onTrackedHand - handId: " + handId + ", pos: " + pos );

    CInputControllerBase kinectInputController = this.inputControllerMap.get(handId);
    if (kinectInputController == null) {
      return;
    }

    //keep Projection space coordinates instead of real world in tvecPathListMap 
    PVector vecProjectivePos = new PVector();
    this.kinect.convertRealWorldToProjective(pos, vecProjectivePos);
    CTimePVector tvecPos = new CTimePVector(millis(), vecProjectivePos);
    //    tvecPosList.add(0, tvecPos);
    kinectInputController.AddToList(0, tvecPos);
  }

  void OnLostHand(SimpleOpenNI curContext, int handId)
  {
    //    this.tvecPathListMap.remove(handId);
    this.inputControllerMap.remove(handId);

    CLogger.Info("[InputKinect.onLostHand] - handId: " + handId + " Num. of inputs:" + this.inputControllerMap.size());
  }

  // -----------------------------------------------------------------
  // gesture events

  void OnCompletedGesture(SimpleOpenNI curContext, int gestureType, PVector pos)
  { 
    int handId = this.kinect.startTrackingHand(pos);

    CLogger.Info("[CInputManager.OnCompletedGesture] - gestureType: " + gestureType + ", pos: " + pos + ", handId stracked: " + handId);
  }


  // -----------------------------------------------------------------
  // Processing default mouse callbacks
  // -----------------------------------------------------------------
  public void MousePressed() {
  }

  public void MouseMoved() {
  }
}

