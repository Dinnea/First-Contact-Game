import processing.sound.*;
public static SoundFile mainTheme;
public static SoundFile denied;
public static SoundFile keypadPress;
public static SoundFile accepted;
public static SoundFile yeet;

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

//create inventory
public static boolean displayInventory;
public static InventoryItem selectedItem;



public static ArrayList <InventoryItem> inventory = new ArrayList<InventoryItem>();

//Is a dialogue box active?
public static boolean dialogueActive = false;
//Dialogue to play
public static Dialogue activeDialogue;



void setup() {
  size(1000, 800);
  mainTheme = new SoundFile(this, "main_theme.mp3");
  denied = new SoundFile(this, "keypad_denied.mp3");
  keypadPress = new SoundFile(this, "keypad_press.mp3");
  accepted = new SoundFile(this, "keypad_granted.mp3");
  yeet = new SoundFile(this, "yeet.mp3");
  
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
  ChangeScene("Start");  
  
  mainTheme.amp(0.3);
  mainTheme.loop();
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

  if (displayInventory) {
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
   if (activeScene.scene_Name == "Door Lock"){
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


public static void ChangeScene(String newScene) {
  //Switch to the requested scene
  switch(newScene) {
  case "Start":
    activeScene = start;
    break;
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
    //case "Chest Open":
    //  activeScene = chestOpen;
    //  break;
  case "Portrait":
    activeScene = portrait;
    break;
  case "Photo Album":
    activeScene = album;
    break;
  case "Closet?":
    activeScene = closet;
    break;
  case "Bedroom 1":
    activeScene = bedroom1;
    break;
  case "Bedroom 2":
    activeScene = bedroom2;
    break;
  case "Diary":
    activeScene = diary;
    break;
  case "Diary page":
    activeScene = diaryPage;
    break;
  case "Door Lock":
    activeScene = doorLock;
    break;
  case "Hallway":
    activeScene = hallway1;
    break;
  case "Hallway 2":
    activeScene = hallway2;
    break;
  case "Office 1":
    activeScene = office1;
    break;
  }

  displayInventory = activeScene.allowInventory;
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
