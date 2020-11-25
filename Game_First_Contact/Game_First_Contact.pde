import processing.sound.*;

//create basement rooms
public static SceneStart start;
public static Scene activeScene;
public static SceneBasement_1 basement_1;
public static SceneBasement_2 basement_2;
public static Bookshelf_Top bookshelfTop;
public static Bookshelf_Bot bookshelfBot;
public static Chest chest;
public static Portrait portrait;
public static Album album;

//create bedroom rooms
public static Closet closet;
public static Bedroom1 bedroom1;
public static Bedroom2 bedroom2;
public static Diary diary;
public static DiaryPage diaryPage;
public static DoorLock doorLock;

//create hallways
public static Hallway1 hallway1;
public static Hallway2 hallway2;

//create offices
public static Office1 office1;

//Create sound files
public static SoundFile chestUnlockSound;
public static SoundFile paperRipSound;
public static SoundFile clothSound;

//create inventory
public static boolean displayInventory;
public static InventoryItem selectedItem;

//Scene transitions
private static Scene sceneToChangeTo;
private static boolean changingScene;
private static boolean fadingOut;
private static float sceneTransitionSpeed = 15;
private static int sceneDarkness = 0;

public static ArrayList <InventoryItem> inventory = new ArrayList<InventoryItem>();

//Is a dialogue box active?
public static boolean dialogueActive = false;
//Dialogue to play
public static Dialogue activeDialogue;



void setup() {
  size(1000, 800);
  
  chestUnlockSound = new SoundFile(this, "chest unlock.mp3");
  paperRipSound = new SoundFile(this, "paper rip.mp3");
  clothSound = new SoundFile(this, "cloth.mp3");
  
  start = new SceneStart();
  basement_1 = new SceneBasement_1();
  basement_2 = new SceneBasement_2();
  bookshelfTop = new Bookshelf_Top();
  bookshelfBot = new Bookshelf_Bot();
  chest = new Chest();
  portrait = new Portrait();
  album = new Album();
  closet = new Closet();
  bedroom1 = new Bedroom1();
  bedroom2 = new Bedroom2();
  diary = new Diary();
  diaryPage = new DiaryPage();
  doorLock = new DoorLock();
  hallway1 = new Hallway1();
  hallway2 = new Hallway2();
  office1 = new Office1();
  activeScene = start;
}

void draw() {  
  //draw the actice scene
  activeScene.Draw();

  //If changing the scene
  if (changingScene) {

    //Change the mouse cursor to an arrow
    cursor(ARROW);

    //If fading out
    if (fadingOut) {
      //raise the scene darkness
      sceneDarkness += sceneTransitionSpeed;
      //If the scene comepletely faded out
      if (sceneDarkness >= 255) {
        sceneDarkness = 255;

        //Stop fading out
        fadingOut = false;

        //Change the scene
        activeScene = sceneToChangeTo;
      }
    } //Else if not fading out
    else {
      //Lower the scene darkness
      sceneDarkness -= sceneTransitionSpeed;

      //If the sceneOpacity is full
      if (sceneDarkness <= 0) {
        sceneDarkness = 0;

        //Stop changing the scene
        changingScene = false;
      }
    }
  } //Else if not changing the scene
  else {
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

    if (displayInventory) {
      inventoryDisplay();
    }
  }

  //Draw a coloured rectangle based on scene Opacity
  fill(0, 0, 0, sceneDarkness);
  rect(0, 0, width, height);
}

void mouseClicked() {
  //Only run this code if we're not changing scene
  if (!changingScene) {

    if (dialogueActive) {
      //Click in the dialogue box
      activeDialogue.MouseClicked();
    } //If there is no dialogue box active
    else {
      //Click inside the scene
      activeScene.MouseClicked();
    }
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
  //Only run this code if we're not changing scene
  if (!changingScene) {
    if (activeScene.scene_Name == "Door Lock") {
      doorLock.lockPuzzle();
    }
    if (inventory != null && displayInventory) {
      for (int i = 0; i<inventory.size(); i++) {
        //mouse hovers over?
        if (CheckPointOnBoxCollision(mouseX, mouseY, 
          13, 
          230+(95*i), 
          50, 
          50)) {
          // if yes, change cursor
          selectedItem = inventory.get(i);


          return;
        }
      }
    }
  }
}


public static void ChangeScene(String newScene) {

  //Indicate that we're changing scenes
  changingScene = true;

  //Indicate that we're fading out
  fadingOut = true;

  //Switch to the requested scene
  switch(newScene) {
  case "Start":
    sceneToChangeTo = start;
    break;
  case "Basement 1":
    sceneToChangeTo = basement_1;
    break;
  case "Basement 2":
    sceneToChangeTo = basement_2;
    break;
  case "Bookshelf Top":
    sceneToChangeTo = bookshelfTop;
    break;
  case "Bookshelf Bottom":
    sceneToChangeTo = bookshelfBot;
    break;
  case "Chest":
    sceneToChangeTo = chest;
    break;
    //case "Chest Open":
    //  activeScene = chestOpen;
    //  break;
  case "Portrait":
    sceneToChangeTo = portrait;
    break;
  case "Photo Album":
    sceneToChangeTo = album;
    break;
  case "Closet?":
    sceneToChangeTo = closet;
    break;
  case "Bedroom 1":
    sceneToChangeTo = bedroom1;
    break;
  case "Bedroom 2":
    sceneToChangeTo = bedroom2;
    break;
  case "Diary":
    sceneToChangeTo = diary;
    break;
  case "Diary page":
    sceneToChangeTo = diaryPage;
    break;
  case "Door Lock":
    sceneToChangeTo = doorLock;
    break;
  case "Hallway":
    sceneToChangeTo = hallway1;
    break;
  case "Hallway 2":
    sceneToChangeTo = hallway2;
    break;
  case "Office 1":
    sceneToChangeTo = office1;
    break;
  }

  displayInventory = sceneToChangeTo.allowInventory;
}

void inventoryDisplay() {
  fill(255, 255, 0);
  rect(0, 200, 75, height - 400);

  //show items
  for (int i = 0; i<inventory.size(); i++) {
    if (selectedItem != null && inventory.get(i) == selectedItem) {
      fill(255, 0, 0);
      rect(10, 227+(95*i), 56, 56);
    }
    image(inventory.get(i).inventoryImage, 13, 230+(95*i), 50, 50);
  }

  if (inventory != null) {
    for (int i = 0; i<inventory.size(); i++) {
      //mouse hovers over && not dragging an item?
      if (CheckPointOnBoxCollision(mouseX, mouseY, 
        13, 
        230+(95*i), 
        50, 
        50)) {
        // if yes, change cursor and stop checking
        cursor(HAND);
        return;
      }
    }
  }
}

static void UseItem() {
  for (int i = 0; i < inventory.size(); i++) {
    if (selectedItem != null && inventory.get(i) == selectedItem) {
      inventory.remove(i);
      selectedItem = null;
    }
  }
}
