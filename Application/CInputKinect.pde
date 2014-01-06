public class CInputKinect extends CInputControllerBase {


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
}

