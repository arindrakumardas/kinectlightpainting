/* --------------------------------------------------------------------------
 * This is Label class desc
 * author:  Gigi Ho
 * date:  15/12/2012
 * ----------------------------------------------------------------------------
 */
 
public class CLabel extends CNode implements IDrawable{
  /**
   * @note below member vars are all dirty now
   * @todo turn them to protected scope and use getter/setter
   */
  public PFont pfFont = null;
  public String strText = "";
  
  public String strFontName = "Arial";
  public float fFontSize = 12;
  public boolean bFontSmooth = true;
  public color cFontColor = color(255, 255, 255);
  
  public int iAlignX = CENTER;   //LEFT, CENTER, or RIGHT
  public int iAlignY = BOTTOM; //TOP, BOTTOM, CENTER, or BASELINE
  
  CLabel(){
  }
  
  CLabel(String strLabelText){
    //Init member vars
    this.strText = strLabelText;
  }
  
//  public static CLabel Create(String strLabelText){
//    return new CLabel(strLabelText);  
//  }
  
  boolean Init(){
    if(!super.Init()){
      return false;
    }
    
    return true;
  }
    
    
  void Update(){    
    this.pfFont = createFont(this.strFontName, this.fFontSize, this.bFontSmooth);
    textFont(pfFont);  
    textAlign(iAlignX, iAlignY);
    fill(this.cFontColor);
  }
  
  void Draw(){
    this.Update();

    text(this.strText, this.GetPositionX(), this.GetPositionY());

  }
  

  
  
}
