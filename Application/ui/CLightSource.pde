
/**
  @comment 
  i think all member vars below belong to CBrush more than CLightSource.
  think of something that only CLightSource has but CBrush doesnt have, then they belong to here.

  anyways, if you don't want to write another class CBrush (which may not be useful if we are not extending this project to a drawing canvas), 
  you may write only CLightSource and delete the CBrush. it's also okay for me.
*/
public class CLightSource extends CBrush{
  /**
    @question 
    is there any difference between CLightSource.fSizeLight and CBrush.fSize? if yes, then you can keep below var here; otherwise, move it to CBrush.
  */
  public float fSizeLight=11.5;
  
  /*
    @comment  
  1 - here you can use data type color instead. check http://processing.org/reference/color_datatype.html (use prefix 'c' for this datatype)
  2 - also, i think it will be good to have a yellow color light, so when someone start creating a CLightSource it wont end up by a black unnoticable light source.
    -gigi
  
    @question 
    is there any difference between CLightSource.cLightColor and CBrush.cColor? if yes, then you can keep below var here; otherwise, move it to CBrush.
  
  */
  public int iColorLightR=0;
  public int iColorLightG=0;
  public int iColorLightB=0;
  
  CLightSource() {
      Brightness(this.fSizeLight, this.iColorLightR, this.iColorLightG, this.iColorLightB);
  }
  
  CLightSource(float fSizeLight) {
    Brightness(fSizeLight, this.iColorLightR, this.iColorLightG, this.iColorLightB);
  }
  
  CLightSource(int iColorLightR, int iColorLightG, int iColorLightB) {
     Brightness(this.fSizeLight, iColorLightR, iColorLightG, iColorLightB);
  }
  
  /**
  @comment 
  1) if this is a Init(), name it Init()
  2) and Init() shouldn't be called inside constructor, the one who new an obj of this class will call Init().
  3) simple member vars initialization can be done within consturtor, some other more advanced actions, 
  e.g. calling another function, can be done inside Init(). (see CSystemInfoLabel for e.g.)
  */
  boolean Brightness(float fSizeLight, int iColorLightR, int iColorLightG, int iColorLightB){
    
    this.fSizeLight = fSizeLight;
    this.iColorLightR=iColorLightR;
    this.iColorLightG=iColorLightG;
    this.iColorLightB=iColorLightB;
    
    return true;
  }
    
    
  void Update(){    
//    this.pfFont = createFont(this.strFontName, this.fFontSize, this.bFontSmooth);
//    textFont(pfFont);  
//    textAlign(iAlignX, iAlignY);
  }
  
  void Draw(){
    this.Update();

//    text(this.strText, this.GetPositionX(), this.GetPositionY());

  }
  

  
  
}
