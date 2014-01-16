/* ----------------------------------------------------------------------------
 * I THINK THIS PAGE CAN BE DELETED --ire
 * waiting for Gigi to confirm
 * ----------------------------------------------------------------------------
 * This is CSprite class, a sprite is an ui object appear on screen with a image / label
 * @author:  irene
 * date:  2/1/2014 (m/d/y)
 * ----------------------------------------------------------------------------
 
 */

final static int SHAPE_RECT = 1;
final static int SHAPE_ELLIPSE = 2;

public class CSprite extends CNode implements IDrawable {
  public int iAnchor = CENTER;
  
  // For image sprite
  PImage imgImage = null;
  
  // For Shape Sprite
  public int iShape = -1;
  public color colShapeColor = color(0);  //default black
  public int iWidth = 10;
  public int iHeight = 10;

  CSprite(String strImagePath, float fPosX, float fPosY) {
    this.imgImage = loadImage(strImagePath);
    this.SetPosition(fPosX, fPosY);
  }

  CSprite(int iSpriteShape, float fPosX, float fPosY) {
    this.iShape = iSpriteShape;
    this.SetPosition(fPosX, fPosY);
  }

  void Draw() {
    this.Update();

    if (this.imgImage != null) {

      imageMode(this.iAnchor);
      image(imgImage, this.GetPositionX(), this.GetPositionY());
    }

    if (this.iShape != -1) {
      switch(this.iShape) {
      case SHAPE_RECT:

        rectMode(this.iAnchor);
        fill(this.colShapeColor);
        strokeWeight(0);//To keep the canvas fixed, otherwise the border changers as per the weight of the trail (comment this line and see)
        rect(this.GetPositionX(), this.GetPositionY(), this.iWidth, this.iHeight);


        break;

      default:
        CLogger.Error("Unknown shape: " + this.iShape);
        break;
      }
    }
  }
}

