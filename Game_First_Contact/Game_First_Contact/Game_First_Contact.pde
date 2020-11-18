public static SceneStart start;
public static Scene activeScene;

void setup(){
  size(1000, 800);
  start = new SceneStart();
  activeScene = start;
  
}

void draw(){
  //draw the actice scene
  activeScene.Draw();
  activeScene.MouseHover();
}

//Check for collision between a single point and a rectangle/box
public static boolean CheckPointOnBoxCollision(float pointX, float pointY, 
                                               float targetX, float targetY, 
                                               float targetWidth, float targetHeight) {
  if (pointX >= targetX
    && pointX <= targetX + targetWidth
    && pointY >= targetY
    && pointY <= targetY + targetHeight) {
    return true;
  }

  return false;
}

public static void ChangeScene(String newScene) {
  switch(newScene) {
  }
}
