/* --------------------------------------------------------------------------
 * CPoint (cpt) is a point coordinate in either 2-D, 3-D space
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */
 
class CPoint {
  protected float fX = -1;
  protected float fY = -1;
  protected float fZ = -1;

//  static CPoint Create(float fX, float fY){
//     return new CPoint(fX, fY, this.fZ); 
//  }
  
//  static CPoint Create(float fX, float fY, float fZ){
//     return new CPoint(fX, fY, fZ); 
//  }

  CPoint(float fX, float fY){
    this.SetXYZ(fX, fY, this.fZ);
  }
  
  CPoint(float fX, float fY, float fZ){
    this.SetXYZ(fX, fY, fZ);
  }
  
  void SetXYZ(float fX, float fY, float fZ){
    this.SetXY(fX, fY);
    this.fZ = fZ;
  }
  
  void SetXY(float fX, float fY){
    this.fX = fX;
    this.fY = fY;
  }
  
  float GetX(){
    return this.fX;
  }
  
  float GetY(){
    return this.fY;
  }
  
  float GetZ(){
    return this.fZ;
  }
   
}
