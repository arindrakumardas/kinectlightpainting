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
    g_kinect.startGesture(SimpleOpenNI.GESTURE_HAND_RAISE); //_WAVE

    // set how smooth the hand capturing should be
    //context.setSmoothingHands(.5);
    
    return true;
  }
  
  public void Update(){
    g_kinect.update();
  }
  
  public Map<Integer,ArrayList<CTimePVector>> GetAllPath(){
    //TODO
    return this.tvecPathListMap;
  }
  
  public ArrayList<PVector> GetPath(int iInputId){
    ArrayList<PVector> vecProjPosList = new ArrayList<PVector>();
    ArrayList<PVector> vecRealPosList = this.vecPathListMap.get(new Integer(iInputId));;
    if(vecRealPosList == null){
      return null;
    }
 
    PVector vecRealPos;
    PVector vecProjPos = new PVector();
        
    Iterator itrVecPos = vecRealPosList.iterator();
    while(itrVecPos.hasNext())
    {
      vecRealPos = (PVector) itrVecPos.next(); 
      g_kinect.convertRealWorldToProjective(vecRealPos,vecProjPos);
      
      vecProjPosList.add(vecProjPos);
    }
    
    return vecRealPosList;
  }
  
  public float GetX(){
    if(this.vecPathListMap.size() == 0)
    {
      return -1;
    }
      Iterator itr = this.vecPathListMap.entrySet().iterator();     
      while(itr.hasNext())
      {
        Map.Entry mapEntry = (Map.Entry)itr.next(); 
        int iHandId =  (Integer) mapEntry.getKey();
        ArrayList<PVector> vecPosList = (ArrayList<PVector>)mapEntry.getValue();
        PVector vecRealWorldPos;
        PVector vecProjectivePos = new PVector();
        
        Iterator itrVecPos = vecPosList.iterator();
        while(itrVecPos.hasNext())
        {
          vecRealWorldPos = (PVector) itrVecPos.next(); 
          g_kinect.convertRealWorldToProjective(vecRealWorldPos,vecProjectivePos);
          
          return vecProjectivePos.x;
        }
        
        //only return the first hand
        break;
      }
      return -1;
  }
  public float GetY(){
    if(this.vecPathListMap.size() == 0)
    {
      return -1;
    }
      Iterator itr = this.vecPathListMap.entrySet().iterator();     
      while(itr.hasNext())
      {
        Map.Entry mapEntry = (Map.Entry)itr.next(); 
        int iHandId =  (Integer)mapEntry.getKey();
        ArrayList<PVector> vecPosList = (ArrayList<PVector>)mapEntry.getValue();
        PVector vecRealWorldPos;
        PVector vecProjectivePos = new PVector();
        
        
        Iterator itrVecPos = vecPosList.iterator();
        while(itrVecPos.hasNext())
        {
          vecRealWorldPos = (PVector) itrVecPos.next(); 
          g_kinect.convertRealWorldToProjective(vecRealWorldPos,vecProjectivePos);
          
          return vecProjectivePos.y;
        }
        
        //only return the first hand
        break;
      }
      
      return -1;
  }
  
  public float GetLastX(){
    if(this.vecPathListMap.size() == 0)
    {
      return -1;
    }
      Iterator itr = this.vecPathListMap.entrySet().iterator();     
      while(itr.hasNext())
      {
        Map.Entry mapEntry = (Map.Entry)itr.next(); 
        int iHandId =  (Integer)mapEntry.getKey();
        ArrayList<PVector> vecPosList = (ArrayList<PVector>)mapEntry.getValue();
        PVector vecRealWorldPos;
        PVector vecProjectivePos = new PVector();
        
        
        Iterator itrVecPos = vecPosList.iterator();
        int iIdx = 0;
        while(itrVecPos.hasNext())
        {
          //return the 2nd value (Last X)
          if(iIdx == 0){
            continue; 
          }
          vecRealWorldPos = (PVector) itrVecPos.next(); 
          g_kinect.convertRealWorldToProjective(vecRealWorldPos,vecProjectivePos);
          
          return vecProjectivePos.x;
        }
        
        //only return the first hand
        break;
      }
      
      
      return -1;
  }
  public float GetLastY(){
        if(this.vecPathListMap.size() == 0)
    {
      return -1;
    }
      Iterator itr = this.vecPathListMap.entrySet().iterator();     
      while(itr.hasNext())
      {
        Map.Entry mapEntry = (Map.Entry)itr.next(); 
        int iHandId =  (Integer)mapEntry.getKey();
        ArrayList<PVector> vecPosList = (ArrayList<PVector>)mapEntry.getValue();
        PVector vecRealWorldPos;
        PVector vecProjectivePos = new PVector();
        
        
        Iterator itrVecPos = vecPosList.iterator();
        int iIdx = 0;
        while(itrVecPos.hasNext())
        {
          //return the 2nd value (Last X)
          if(iIdx == 0){
            continue; 
          }
          vecRealWorldPos = (PVector) itrVecPos.next(); 
          g_kinect.convertRealWorldToProjective(vecRealWorldPos,vecProjectivePos);
          
          return vecProjectivePos.y;
        }
        
        //only return the first hand
        break;
      }
      
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
    CLogger.Info("[Kinect]onNewHand - handId: " + iHandId + ", pos: " + vecPos);
   
    ArrayList<PVector> vecPosList = new ArrayList<PVector>();
    vecPosList.add(vecPos);
 
    this.vecPathListMap.put(iHandId, vecPosList);
  }
  
  void OnTrackedHand(SimpleOpenNI curContext,int handId,PVector pos)
  {
//    CLogger.Info("onTrackedHand - handId: " + handId + ", pos: " + pos );
    
    ArrayList<PVector> vecPosList = this.vecPathListMap.get(handId);
    if(vecPosList == null){
      return;
    }
    
    vecPosList.add(0, pos);
    //TODO: also keep another vecPathListMap of proj space
    
    if(vecPosList.size() >= this.iPathListSize){
      //remove the last point
      vecPosList.remove(vecPosList.size()-1); 
    }
  }
  
  void OnLostHand(SimpleOpenNI curContext,int handId)
  {
    CLogger.Info("[InputKinect.onLostHand] - handId: " + handId);
    this.vecPathListMap.remove(handId);
  }
  
  // -----------------------------------------------------------------
  // gesture events
  
  void OnCompletedGesture(SimpleOpenNI curContext,int gestureType, PVector pos)
  {
    CLogger.Info("[InputKinect.OnCompletedGesture] - gestureType: " + gestureType + ", pos: " + pos);
    
    int handId = g_kinect.startTrackingHand(pos);
    CLogger.Info("[InputKinect.OnCompletedGesture]hand stracked: " + handId);
  }
  
  
}
