/* --------------------------------------------------------------------------
 * This is CSprite class, a sprite is an ui object appear on screen with a image / label
 * @author:  irene
 * date:  2/1/2014 (m/d/y)
 * ----------------------------------------------------------------------------
 */
 
 
public class CSprite extends CNode implements IDrawable{
  PImage imgImage = null;
  float fImgSize = 20; //what does this size stands for? or use width / height instead? -gigi
  
  CSprite(String strImagePath, float fPosX, float fPosY){
    imgImage = loadImage(strImagePath);
    this.SetPosition(fPosX,fPosY);
    
  }
  
  void Draw(){
    this.Update();
    
    image(imgImage, this.GetPositionX(), this.GetPositionY());

  }
 
  
  
}