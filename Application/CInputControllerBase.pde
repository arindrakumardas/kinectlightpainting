/* --------------------------------------------------------------------------
 * CInputControllerBase is an abstract class to be extended by any input controllers. Each input controller stands for 1 input, i.e. one hand detected by Kinect, or a mouse cursor.
 * author:  Gigi Ho
 * date:  5/1/2014
 * ----------------------------------------------------------------------------
 */

public abstract class CInputControllerBase{
  public int iInputId = -1;
  public int iPathListSize = 20; //this determine how long the path will be 
  
//  Map<Integer,ArrayList<CTimePVector>> tvecPathListMap = new HashMap<Integer,ArrayList<CTimePVector>>(); //key: Input id (id of hands / mouse cursor); value: path list 
  public ArrayList<CTimePVector> tvecPathList = null; //key: Input id (id of hands / mouse cursor); value: path list 
  
  public boolean bIsOn = true;
  
  CInputControllerBase(){
  }

  public boolean Init(){
    this.tvecPathList = new ArrayList<CTimePVector>();
  
    return true;
  }
  
  public abstract void Update();
  
  public ArrayList<CTimePVector> GetPath(){
    return this.tvecPathList; 
  }

  public void AddToList(CTimePVector tvecPos){
    this.tvecPathList.add(tvecPos); //defatul is add to back
    
    if (this.tvecPathList.size() >= this.iPathListSize) {
      //remove the last point
      this.tvecPathList.remove(this.tvecPathList.size()-1);
    }
  }
  
  public void AddToList(int iListIdx, CTimePVector tvecPos){
    this.tvecPathList.add(iListIdx, tvecPos); //add to front
    
    //keep the list within defined size
    if (this.tvecPathList.size() >= this.iPathListSize) {
      //remove the last point
      this.tvecPathList.remove(this.tvecPathList.size()-1);
    }
  }
  
  
  
  public abstract float GetX();
  public abstract float GetY();
  
  public abstract float GetLastX();
  public abstract float GetLastY();
  
  public abstract void DrawCursor(); //this will draw a cursor on the input
  
  
}
