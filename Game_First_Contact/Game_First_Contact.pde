public static SceneStart start;
public static Scene activeScene;
public static SceneBasement_1 basement_1;
public static SceneBasement_2 basement_2;
public static Bookshelf_Top bookshelfTop;
public static Bookshelf_Bot bookshelfBot;
public static Chest chest;
public static Portrait portrait;
public static Album album;
boolean inventoryDis = false;

public static ArrayList <InteractiveObject> inventory = new ArrayList<InteractiveObject>();

//Is a dialogue box active?
public static boolean dialogueActive = false;
//Dialogue to play.
public static Dialogue activeDialogue;

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

  //If there is an active dialogue box
  if (dialogueActive) {
    //Draw the dialogue
    activeDialogue.Draw();

    //Check for mouse hover in the dialogue
    activeDialogue.MouseHover();
  } else {
    //Check for mouse hover in the scene
    activeScene.MouseHover();
  }

  //display the inventory

  if (inventoryDis) {
    inventoryDisplay();
  }
}

void mouseClicked() {
  if (dialogueActive) {
    //Click in the dialogue box
    activeDialogue.MouseClicked();
  } //If there is no dialogue box active
  else {
    //Click inside the scene
    activeScene.MouseClicked();
  }
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

void mousePressed() {
  if (inventory != null) {
    for (int i = 0; i<inventory.size(); i++) {
      //mouse hovers over?
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, 
        90+(150*i), 
        700, 
        inventory.get(i).areaWidth, 
        inventory.get(i).areaHeight)) {
        // if yes, change cursor and stop checking
        cursor(inventory.get(i).objectImage);
        return;
      }
    }
  }
}

void mouseReleased() {
}

void keyPressed() {
  if (key == 'b') {
    if (inventoryDis == false) {
      inventoryDis = true;
    } else if (inventoryDis == true) {
      inventoryDis = false;
    }
  }
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

void inventoryDisplay() {
  fill(255, 255, 0);
  rect(0, 600, width, 200);
  //show items
  for (int i = 0; i<inventory.size(); i++) {
    image(inventory.get(i).objectImage, 90+(150*i), 700);
  }
  if (inventory != null) {
    for (int i = 0; i<inventory.size(); i++) {
      //mouse hovers over?
      if (CheckPointOnBoxCollision(mouseX, mouseY, 
        90+(150*i), 700, 
        inventory.get(i).areaWidth, 
        inventory.get(i).areaHeight)) {
        // if yes, change cursor and stop checking
        cursor(HAND);
        return;
      }
    }
  }
}
