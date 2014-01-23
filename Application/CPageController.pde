public class CPageController {
  CScene curPage = null;

  void GotoPageIdle() {
    CLogger.Info("CPageController.GotoPageIdle");

    curPage = new CPageIdle();
    curPage.Init();
  }

  void GotoPageCapture() {
    CLogger.Info("CPageController.CPageCapture");

    curPage = new CPageCapture();
    curPage.Init();
  }

  void GotoPageDisplay() {
    CLogger.Info("CPageController.CPageDisplay");
    
    curPage = new CPageDisplay();
    curPage.Init();
  }

  void GotoPageInitialize() {
    CLogger.Info("CPageController.CPageInitialize");
    
    curPage = new CPageInitialize();
    curPage.Init();
  }
  
//  void GotoPageFinalize() {
//    CLogger.Info("CPageController.CPageFinalize");
//    ResetCP5Controller();
//    curPage = new CPageFinalize();
//    curPage.Init();
//  }

}

