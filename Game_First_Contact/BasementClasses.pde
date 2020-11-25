//basement 1
class SceneBasement_1 extends Scene {

  public SceneBasement_1() {
    super("Basement1.png", "Basement", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80), 
      new SceneTransitionArea("Portrait", 490, 70, 235, 310), 
      new SceneTransitionArea("Chest", 820, 380, 140, 350)
    };
    //interactiveObjects = new InteractiveObject[]{
    //  new InteractiveObject(200, 200, 50, 50, "placeholder.png", true)
    //};

    InteractiveDialogue candleDialogue1 = new InteractiveDialogue(429, 260, 60, 350, 
      new Dialogue(new String[]{
      "- The soft light from the candle illuminates the room -"
      }));

    InteractiveDialogue candleDialogue2 = new InteractiveDialogue(730, 260, 60, 350, 
      new Dialogue(new String[]{
      "- The soft light from the candle illuminates the room -"
      }));

    dialogueObjects = new InteractiveDialogue[]{candleDialogue1, candleDialogue2};
  }
}

class Chest extends Scene {

  private boolean sheetPresent = true;
  private boolean chestLocked = true;

  InteractiveDialogue ChestSheetDialogue = new InteractiveDialogue(75, 167, 920, 532, 
    new Dialogue(new String[]{
    "- I took off the white sheet, It's a chest -"
    }));

  InteractiveDialogue chestClosedDialogue = new InteractiveDialogue(75, 167, 920, 532, 
    new Dialogue(new String[]{
    "- It seems to be locked -"
    }));

  Dialogue unlockChestDialogue = new Dialogue(new String[]{
    "- The chest opened and I looked inside, it was totally black -", 
    "- I reached my arm in and tried to fill around -", 
    "- Nothing.. -", 
    "- I took the sheet from besides me and dropped it in -", 
    "- I watched it slowly drift to the bottom until it hit the ground, my eyes widened in shock -", 
    "- It must be atleast 6 feet deep.. -", 
    "- I considered going inside -"
    });

  SceneTransitionArea transitionToCloset = new SceneTransitionArea("Closet?", 100, 350, 800, 300);

  public Chest() {
    super ("chest closed sheet.png", "Chest", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
    };

    // to add key interactivity
    // super ("chest_open.png, "Chest");
  }

  public void MouseHover() {
    boolean hover = false;
    if (sheetPresent) {
      //If clicked on the sheet
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, ChestSheetDialogue.x, ChestSheetDialogue.y, ChestSheetDialogue.areaWidth, ChestSheetDialogue.areaHeight)) {
        hover = true;
      }
    } //Else if the sheet is gone and the chest is locked
    else if (chestLocked) {
      //If clicked on the locked chest
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, chestClosedDialogue.x, chestClosedDialogue.y, chestClosedDialogue.areaWidth, chestClosedDialogue.areaHeight)) {
        hover = true;
      }
    } //Else if the chest is open
    else if (!chestLocked) {
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, transitionToCloset.x, transitionToCloset.y, transitionToCloset.areaWidth, transitionToCloset.areaHeight)) {
        hover = true;
      }
    }
    
    if(hover){
      cursor(HAND);
    }
    else{
      super.MouseHover();
    }
  }

  public void MouseClicked() {
    //If the sheet is present
    if (sheetPresent) {
      //If clicked on the sheet
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, ChestSheetDialogue.x, ChestSheetDialogue.y, ChestSheetDialogue.areaWidth, ChestSheetDialogue.areaHeight)) {
        //Play the dialogue
        ChestSheetDialogue.dialogueToDisplay.Play();

        //Remove the sheet
        sheetPresent = false;
        background_Image = loadImage("chest closed.png");
        Game_First_Contact.basement_1.background_Image = loadImage("Basement1 no sheet.png");
      }
    } //Else if the sheet is gone and the chest is locked
    else if (chestLocked) {
      //If clicked on the locked chest
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, chestClosedDialogue.x, chestClosedDialogue.y, chestClosedDialogue.areaWidth, chestClosedDialogue.areaHeight)) {
        //If the key is selected
        if (Game_First_Contact.selectedItem != null && Game_First_Contact.selectedItem.itemName == "Chest Key") {
          //Play the "unlock" dialogue
          unlockChestDialogue.Play();

          //Unlock the chest
          chestLocked = false;
          background_Image = loadImage("Chest open.png");

          //Remove the key from the inventory
          Game_First_Contact.UseItem();
        } //If the key wasn't selected
        else {
          //Play the flavour text
          chestClosedDialogue.dialogueToDisplay.Play();
        }
      }
    } //Else if the chest is open
    else if (!chestLocked) {
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, transitionToCloset.x, transitionToCloset.y, transitionToCloset.areaWidth, transitionToCloset.areaHeight)) {
        ChangeScene(transitionToCloset.destinationScene);
      }
    }

    super.MouseClicked();
  }
}

class Portrait extends Scene {
  boolean puzzleSolved = false;
  boolean keyPickedUp = false;
  boolean firstEntrance = true;

  private InteractiveObject itemKey = new InteractiveObject(432, 338, 100, 100, "placeholder.png", true, "Chest Key");

  private InventoryItem[] placedPictures = new InventoryItem[4];
  private InteractiveDialogue[] pictureFrames;

  private Dialogue sceneEnterConversation = new Dialogue(new String[]{
    "- It's a portrait of a young girl with a key necklace -", 
    "T: \"Do you recognize the painting?\"", 
    "P: \"Yes it's a portrait of my sister..\"", 
    "T: \"You sound surprised\"", 
    "P: \"She's been dead for years\""
    });

  private Dialogue picturesWrongOrderDialogue = new Dialogue(new String[]{
    "- Nothing happened -"
    });

  private Dialogue picturesCorrectOrderDialogue = new Dialogue(new String[]{
    "- As I put the last piece in place the world warped before me, the portrait seemed to melt as the world spun. -", 
    "- I looked back at the picture only to see my own reflection, and the key still floating in the middle of the painting. - ", 
    "- I felt the urge to grab it. -"
    });

  InteractiveDialogue portraitDialogue = new InteractiveDialogue(284, 59, 433, 608, 
    new Dialogue(new String[]{
    "- It's a portrait of a young girl with a key necklace -"
    }));

  public Portrait() {
    super ("portrait.png", "Portrait", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
    };

    InteractiveDialogue pictureFrame1 = new InteractiveDialogue(171, 678, 150, 115, 
      new Dialogue(new String[]{
      "- It's a picture frame -"
      }));
    InteractiveDialogue pictureFrame2 = new InteractiveDialogue(323, 680, 150, 115, 
      new Dialogue(new String[]{
      "- It's a picture frame -"
      }));
    InteractiveDialogue pictureFrame3 = new InteractiveDialogue(486, 678, 150, 115, 
      new Dialogue(new String[]{
      "- It's a picture frame -"
      }));
    InteractiveDialogue pictureFrame4 = new InteractiveDialogue(643, 678, 150, 115, 
      new Dialogue(new String[]{
      "- It's a picture frame -"
      }));

    pictureFrames = new InteractiveDialogue[]{pictureFrame1, pictureFrame2, pictureFrame3, pictureFrame4};
  }

  public void Draw() {
    super.Draw();

    //Play the conversation if it's the first time you enter this scene
    if (firstEntrance) {
      sceneEnterConversation.Play();
      firstEntrance = false;
    }

    //For each placed picture
    for (int i = 0; i < placedPictures.length; i++) {
      if (placedPictures[i] != null) {
        //Draw the picture in the scene
        image(placedPictures[i].objectImage, pictureFrames[i].x, pictureFrames[i].y, pictureFrames[i].areaWidth, pictureFrames[i].areaHeight);
      }
    }

    //If the puzzle is solved and the key hasn't been picked up yet
    if (puzzleSolved && !keyPickedUp) {
      //Draw the key in the scene
      image(itemKey.item.objectImage, itemKey.x, itemKey.y, itemKey.areaWidth, itemKey.areaHeight);
    }
  }

  public void MouseHover() {
    boolean hovered = false;

    if (!puzzleSolved) {
      //Check if the portrait was hovered over
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, portraitDialogue.x, portraitDialogue.y, portraitDialogue.areaWidth, portraitDialogue.areaHeight)) {
        hovered = true;
      }

      //For each picture frame
      for (int i = 0; i < pictureFrames.length; i++) {
        //If the user hovered over the picture frame
        if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, pictureFrames[i].x, pictureFrames[i].y, pictureFrames[i].areaWidth, pictureFrames[i].areaHeight)) {
          hovered = true;
        }
      }
    } else if (puzzleSolved && !keyPickedUp) {
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, itemKey.x, itemKey.y, itemKey.areaWidth, itemKey.areaHeight)) {
        hovered = true;
      }
    }

    if (hovered) {
      cursor(HAND);
    } else {
      super.MouseHover();
    }
  }

  public void MouseClicked() {
    //If the puzzles hasn't been solved
    if (!puzzleSolved) {
      //Check if the portrait was clicked
      if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, portraitDialogue.x, portraitDialogue.y, portraitDialogue.areaWidth, portraitDialogue.areaHeight)) {
        portraitDialogue.dialogueToDisplay.Play();
      }

      //For each picture frame
      for (int i = 0; i < pictureFrames.length; i++) {
        //If the user clicked on the picture frame
        if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, pictureFrames[i].x, pictureFrames[i].y, pictureFrames[i].areaWidth, pictureFrames[i].areaHeight)) {
          //If an inventory item was selected and the clicked frame is empty
          if (Game_First_Contact.selectedItem != null && placedPictures[i] == null) {

            //If one of the pictures was selected
            switch(Game_First_Contact.selectedItem.itemName) {
            case "Picture 1":
            case "Picture 2":
            case "Picture 3":
            case "Picture 4":
              //Add the picture to the list of placed pictures, depending on which frame you clicked
              placedPictures[i] = Game_First_Contact.selectedItem;
              //Remove the placed picture from the player's inventory
              for (int p = 0; p < Game_First_Contact.inventory.size(); p++) {
                if (Game_First_Contact.inventory.get(p) == Game_First_Contact.selectedItem) {
                  Game_First_Contact.UseItem();
                }
              }
              ;
              break;
            }
          } //Else if the picture frame was not empty
          else if (placedPictures[i] != null) {
            //Pick the picture back up
            Game_First_Contact.inventory.add(placedPictures[i]);
            placedPictures[i] = null;
          } //Else if the picture frame is empty, but no picture was selected
          else if (placedPictures[i] == null && Game_First_Contact.selectedItem == null) {
            pictureFrames[i].dialogueToDisplay.Play();
          }


          boolean isFull = true;
          //Check if all 4 pictures are in place
          for (int c = 0; c < placedPictures.length; c++) {
            //If the pictureFrame is empty, set isFull to false
            if (placedPictures[c] == null) {
              isFull = false;
            }
          }

          //If all pictures are placed
          if (isFull) {

            boolean isCorrect = true;

            //check if the pictures are in the correct spot
            for (int c = 0; c < placedPictures.length; c++) {
              //If the picture is in the wrong spot
              if (!placedPictures[c].itemName.equals("Picture " + (c + 1))) {
                //Show the "nothing happened" dialogue
                picturesWrongOrderDialogue.Play();

                isCorrect = false;

                //Place all pictures back in the inventory
                for (int b = 0; b < placedPictures.length; b++) {
                  Game_First_Contact.inventory.add(placedPictures[b]);
                  placedPictures[b] = null;
                }
                break;
              }
            }

            //If the pictures are in the correct order
            if (isCorrect) {
              //Play the "correct order" dialogue
              picturesCorrectOrderDialogue.Play();

              //Set the puzzle to solved
              puzzleSolved = true;

              //Change the background
              background_Image = loadImage("portrait faded.png");
            }
          }
        }
      }
    } else if (puzzleSolved)
    {
      if (!keyPickedUp) {
        if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, itemKey.x, itemKey.y, itemKey.areaWidth, itemKey.areaHeight)) {
          keyPickedUp = true;
          Game_First_Contact.inventory.add(itemKey.item);
        }
      }
    }

    super.MouseClicked();
  }
}
//basement 2

class SceneBasement_2 extends Scene {

  private boolean firstEntrance = true;

  private Dialogue sceneEnterConversation = new Dialogue(new String[]{
    "P: \"The bookshelf itself isn't always here, but the books are, they are usually filled with pictures of me, my sister, my mom and I think my father.\"", 
    "T: \"You think?\"", 
    "P: \"I don't remember much about him\""
    });

  public SceneBasement_2() {
    super("Basement2.png", "Basement", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", width - 100, height - 100, 80, 80), 
      new SceneTransitionArea("Bookshelf Top", 490, 55, 370, 320), 
      new SceneTransitionArea("Bookshelf Bottom", 490, 380, 370, 240), 
      new SceneTransitionArea("Photo Album", 510, 630, 120, 83), 
    };
  }

  public void Draw() {
    super.Draw();

    //Play the conversation if it's the first time you enter this scene
    if (firstEntrance) {
      sceneEnterConversation.Play();
      firstEntrance = false;
    }
  }
}

class Bookshelf_Top extends Scene {
  public Bookshelf_Top() {
    super ("bookshelf zoom1.png", "Bookshelf Top", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80), 
      new SceneTransitionArea("Bookshelf Bottom", width -130, height - 200, 80, 80)
    };
  }
}

class Bookshelf_Bot extends Scene {
  public Bookshelf_Bot() {
    super ("booshelf zoom 2.png", "Bookshelf Bottom", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80), 
      new SceneTransitionArea("Bookshelf Top", 20, 100, 80, 80)
    };
  }
}

class Album extends Scene {
  private boolean firstEntrance = true;

  private Dialogue sceneEnterConversation = new Dialogue(new String[]{
    "- There's a book laying on the ground -", 
    "- It's a picture book of me and my family -"
    });

  public Album() {
    super ("picture book.png", "Photo Album", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80)
    };

    interactiveObjects.add(new InteractiveObject(127, 391, 325, 230, "picture 1.png", true, "Picture 1"));
    interactiveObjects.add(new InteractiveObject(127, 147, 325, 230, "picture 2.png", true, "Picture 2"));
    interactiveObjects.add(new InteractiveObject(503, 386, 325, 230, "picture 3.png", true, "Picture 3"));
    interactiveObjects.add(new InteractiveObject(495, 135, 325, 230, "picture 4.png", true, "Picture 4"));
  }

  public void Draw() {
    super.Draw();

    //Play the conversation if it's the first time you enter this scene
    if (firstEntrance) {
      sceneEnterConversation.Play();
      firstEntrance = false;
    }
  }
}
