public class CInputKinect extends CInputControllerBase {
  float fCursorSize = 30;


  CInputKinect() {
    super();
  }

  public boolean Init() {
    if (!super.Init()) {
      return false;
    }

    return true;
  }

  public void Update() {
  }


  //always return the first hand
  public float GetX() {
    if (this.tvecPathList.size() > 0) {
      return this.tvecPathList.get(0).x;
    }

    CLogger.Error("[CInputKinect.GetX()] No position value is recorded in the list.");
    return -1;
  }
  public float GetY() {
    if (this.tvecPathList.size() > 0) {
      return this.tvecPathList.get(0).y;
    }

    CLogger.Error("[CInputKinect.GetX()] No position value is recorded in the list.");
    return -1;
  }

  public float GetLastX() {
    if (this.tvecPathList.size() > 1) {
      return this.tvecPathList.get(1).x;
    }

    CLogger.Error("[CInputKinect.GetX()] No position value is recorded in the list.");
    return -1;
  }

  public float GetLastY() {
    if (this.tvecPathList.size() > 1) {
      return this.tvecPathList.get(1).y;
    }

    CLogger.Error("[CInputKinect.GetY()] No position value is recorded in the list.");
    return -1;
  }

  public void DrawCursor() {
    //visualise the cursor


      if (this.tvecPathList.size() == 0)
    {
      return;
    }

    //    Iterator itr = this.tvecPathListMap.entrySet().iterator();     
    //    while(itr.hasNext())
    //    {
    //      Map.Entry mapEntry = (Map.Entry)itr.next(); 
    //      int iHandId =  (Integer) mapEntry.getKey();
    //      ArrayList<CTimePVector> tvecPosList = (ArrayList<CTimePVector>)mapEntry.getValue();
    //      
    //      if(tvecPosList.size() > 0){
    //        fill(color(255,255,255, 200));
    //        noStroke();
    //        ellipse(tvecPosList.get(0).x, tvecPosList.get(0).y, fCursorSize, fCursorSize);
    //      }
    //    }
  }
}

