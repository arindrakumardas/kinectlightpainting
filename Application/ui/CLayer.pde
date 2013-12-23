/* --------------------------------------------------------------------------
 * CLayer 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CLayer extends CNode implements IDrawable{
  ArrayList <IDrawable> arrChildren = null;
  //Background image // color
  
  CLayer(){
    super();
    //Init member vars
  }
  
  boolean Init(){
    if(!super.Init()){
      return false;
    }
    
    CLogger.Debug("[CLayer.Init]");

    //Init member vars (new object)
    this.arrChildren = new ArrayList();
    //    this.SetPosition(0,0); //default to be in the middle of the sketch
    
    return true;
  }
  
  void AddChild(IDrawable child){
    this.arrChildren.add(child);
    
  }
  
  void Draw(){
    Iterator<IDrawable> it = this.arrChildren.iterator();
      while(it.hasNext()){
        it.next().Draw();
        
      }
  }
  
  
  
}
