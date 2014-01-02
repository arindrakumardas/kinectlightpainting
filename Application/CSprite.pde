/* --------------------------------------------------------------------------
 * This is CSprite class, a sprite is an ui object appear on screen with a image / label
 * @author:  irene
 * date:  2/1/2014 (m/d/y)
 * ----------------------------------------------------------------------------
 */
 
 
public class CSprite extends CNode implements IDrawable{
  PImage imgImage = null;
/*
  float fImgSize = 50; //what does this size stands for? or use width / height instead? -gigi
                        //size is for how big the image will be. 
                        //I commented it out to see if it affects the start/refresh button. If not, we can delete it
                        //in CButton it's important
*/  
  CSprite(String strImagePath, float fPosX, float fPosY){
    imgImage = loadImage(strImagePath);
    this.SetPosition(fPosX,fPosY);
    
  }
 
  void Draw(){
    this.Update();
    
    image(imgImage, this.GetPositionX(), this.GetPositionY());

  }
  
  
}
