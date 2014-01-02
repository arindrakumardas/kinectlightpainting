public class CPageController{
  CScene curPage = null;
  
  void GotoPageIdle(){
    CLogger.Info("CPageController.GotoPageIdle");
    ResetCP5Controller();
    curPage = new CPageIdle();
    curPage.Init();
  }
  
  void GotoPageCapture(){
    CLogger.Info("CPageController.CPageCapture");
    ResetCP5Controller();
    curPage = new CPageCapture();
    curPage.Init();
  }
  
  void GotoPageDisplay(){
    CLogger.Info("CPageController.CPageDisplay");
    ResetCP5Controller();
    curPage = new CPageDisplay();
    curPage.Init();
  }
  
  void ResetCP5Controller(){
        
    for(ControllerInterface controllerObj : g_cp5Controller.getAll()){
      g_cp5Controller.remove(controllerObj.getName());
    }
  }
  
  
}

