public static SceneStart start;
public static Scene activeScene;
public static SceneBasement_1 basement_1;
public static SceneBasement_2 basement_2;
public static Bookshelf_Top bookshelfTop;
public static Bookshelf_Bot bookshelfBot;
public static Chest chest;
public static Portrait portrait;
public static Album album;

public static InteractiveObject[] inventory;

void setup() {
  size(1000, 800);
  start = new SceneStart();
  basement_1 = new SceneBasement_1();
  basement_2 = new SceneBasement_2();
  bookshelfTop = new Bookshelf_Top();
  bookshelfBot = new Bookshelf_Bot();
  chest = new Chest();
  portrait = new Portrait();
  album = new Album();
  activeScene = start;
}

void draw() {
  //draw the actice scene
  activeScene.Draw();
  activeScene.MouseHover();
}

void mouseClicked() {
  activeScene.MouseClicked();
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
  case "Basement 1":
    activeScene = basement_1;
    break;
  case "Basement 2":
    activeScene = basement_2;
    break;
  case "Bookshelf Top":
    activeScene = bookshelfTop;
    break;
  case "Bookshelf Bottom":
    activeScene = bookshelfBot;
    break;
  case "Chest":
    activeScene = chest;
    break;
  case "Portrait":
    activeScene = portrait;
    break;
  case "Photo Album":
    activeScene = album;
    break;
  }
}
