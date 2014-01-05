public class CInputKinect implements IInputController{

  
  CInputKinect(){
    
  }
  
  public boolean Init(){
    if (g_kinect.isInit() == false){
      CLogger.Error("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
      return false;
    }
    
    
    CLogger.Info("CInputKinect initializing.");
    g_kinect.setMirror(true); // mirror is by default enabled//
    g_kinect.enableDepth();  // enable depthMap generation 
    
    g_kinect.enableHand();
    g_kinect.startGesture(SimpleOpenNI.GESTURE_HAND_RAISE); //GESTURE_HAND_RAISE , GESTURE_WAVE

    // set how smooth the hand capturing should be
    g_kinect.setSmoothingHand(0.5);
    
    return true;
  }
  
  public void Update(){
    g_kinect.update();
  }

  public Map<Integer,ArrayList<CTimePVector>> GetAllPath(){
    return this.tvecPathListMap;
  }
   
  public ArrayList<CTimePVector> GetPath(int iInputId){
    ArrayList<CTimePVector> tvecPosList = this.tvecPathListMap.get(new Integer(iInputId));
    if(tvecPosList == null){
      return null;
    }
    
    return tvecPosList;
  }
  
  //always return the first hand
  public float GetX(){
    if(this.tvecPathListMap.size() == 0)
    {
      CLogger.Error("[CInputKinect.GetX()] No hands are tracked.");
      return -1;
    }
    
    Iterator itr = this.tvecPathListMap.entrySet().iterator();     
    while(itr.hasNext())
    {
      Map.Entry mapEntry = (Map.Entry)itr.next(); 
      int iHandId =  (Integer) mapEntry.getKey();
      ArrayList<CTimePVector> tvecPosList = (ArrayList<CTimePVector>)mapEntry.getValue();
      
      if(tvecPosList.size() > 0){
        return tvecPosList.get(0).x;
      }
    }
    
    CLogger.Error("[CInputKinect.GetY()] No position value is recorded.");
    return -1;
  }
  public float GetY(){
    if(this.tvecPathListMap.size() == 0)
    {
      CLogger.Error("[CInputKinect.GetX()] No hands are tracked.");
      return -1;
    }
    
    Iterator itr = this.tvecPathListMap.entrySet().iterator();     
    while(itr.hasNext())
    {
      Map.Entry mapEntry = (Map.Entry)itr.next(); 
      int iHandId =  (Integer) mapEntry.getKey();
      ArrayList<CTimePVector> tvecPosList = (ArrayList<CTimePVector>)mapEntry.getValue();
      
      if(tvecPosList.size() > 0){
        return tvecPosList.get(0).y;
      }
    }
    
    CLogger.Error("[CInputKinect.GetY()] No position value is recorded.");
    return -1;
  }
  
  public float GetLastX(){
    if(this.tvecPathListMap.size() == 0)
    {
      CLogger.Error("[CInputKinect.GetX()] No hands are tracked.");
      return -1;
    }
    
    Iterator itr = this.tvecPathListMap.entrySet().iterator();     
    while(itr.hasNext())
    {
      Map.Entry mapEntry = (Map.Entry)itr.next(); 
      int iHandId =  (Integer) mapEntry.getKey();
      ArrayList<CTimePVector> tvecPosList = (ArrayList<CTimePVector>)mapEntry.getValue();
      
      if(tvecPosList.size() > 1){
        return tvecPosList.get(1).x;
      }
    }
    
    CLogger.Error("[CInputKinect.GetLastX()] No position value is recorded.");
    return -1;
  }
  
  public float GetLastY(){
    if(this.tvecPathListMap.size() == 0)
    {
      CLogger.Error("[CInputKinect.GetX()] No hands are tracked.");
      return -1;
    }
    
    Iterator itr = this.tvecPathListMap.entrySet().iterator();     
    while(itr.hasNext())
    {
      Map.Entry mapEntry = (Map.Entry)itr.next(); 
      int iHandId =  (Integer) mapEntry.getKey();
      ArrayList<CTimePVector> tvecPosList = (ArrayList<CTimePVector>)mapEntry.getValue();
      
      if(tvecPosList.size() > 1){
        return tvecPosList.get(1).y;
      }
    }
    
    CLogger.Error("[CInputKinect.GetY()] No position value is recorded.");
    return -1;
  }
  
  public void DrawCursor(){
    //TODO: visualise the cursor
    
  }
  
  // -----------------------------------------------------------------
  // SImpleOpenNI callbacks
  // -----------------------------------------------------------------
  // hand events
  
  void OnNewHand(SimpleOpenNI curContext,int iHandId, PVector vecPos)
  {
    ArrayList<CTimePVector> tvecPosList = new ArrayList<CTimePVector>();
    
    PVector vecProjectivePos = new PVector();
    g_kinect.convertRealWorldToProjective(vecPos, vecProjectivePos);
    
    CTimePVector tvecPos = new CTimePVector(millis(), vecProjectivePos);
    tvecPosList.add(tvecPos);
 
    this.tvecPathListMap.put(iHandId, tvecPosList);
    
    CLogger.Info("[InputKinect.OnNewHand()] - handId: " + iHandId + ", pos: " + vecPos + " Num. of hands:" + this.tvecPathListMap.size());
  }
  
  void OnTrackedHand(SimpleOpenNI curContext,int handId,PVector pos)
  {
//    CLogger.Info("onTrackedHand - handId: " + handId + ", pos: " + pos );
    
    ArrayList<CTimePVector> tvecPosList = this.tvecPathListMap.get(handId);
    if(tvecPosList == null){
      return;
    }
    
    
    //keep Projection space coordinates instead of real world in tvecPathListMap 
    PVector vecProjectivePos = new PVector();
    g_kinect.convertRealWorldToProjective(pos, vecProjectivePos);
    CTimePVector tvecPos = new CTimePVector(millis(), vecProjectivePos);
    tvecPosList.add(0, tvecPos);
    
    if(tvecPosList.size() >= this.iPathListSize){
      //remove the last point
      tvecPosList.remove(tvecPosList.size()-1); 
    }
  }
  
  void OnLostHand(SimpleOpenNI curContext,int handId)
  {
    this.tvecPathListMap.remove(handId);
    
    CLogger.Info("[InputKinect.onLostHand] - handId: " + handId + " Num. of hands:" + this.tvecPathListMap.size());
  }
  
  // -----------------------------------------------------------------
  // gesture events
  
  void OnCompletedGesture(SimpleOpenNI curContext,int gestureType, PVector pos)
  { 
    int handId = g_kinect.startTrackingHand(pos);
    
    CLogger.Info("[InputKinect.OnCompletedGesture] - gestureType: " + gestureType + ", pos: " + pos + ", handId stracked: " + handId);
    
  }
  
  
}
