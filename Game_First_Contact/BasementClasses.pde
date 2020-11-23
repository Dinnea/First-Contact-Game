//basement 1
class SceneBasement_1 extends Scene {
  public SceneBasement_1() {
    super("Basement1.png", "Basement", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80), 
      new SceneTransitionArea("Portrait", 570, 35, 190, 300), 
      new SceneTransitionArea("Chest", 867, 290, 133, 350)
    };
    //interactiveObjects = new InteractiveObject[]{
    //  new InteractiveObject(200, 200, 50, 50, "placeholder.png", true)
    //};

    InteractiveDialogue candleDialogue1 = new InteractiveDialogue(469, 185, 80, 327, 
      new Dialogue(new String[]{
      "The candle flame is flickering"
      }));

    InteractiveDialogue candleDialogue2 = new InteractiveDialogue(764, 184, 85, 329, 
      new Dialogue(new String[]{
      "The candle flame is flickering"
      }));

    dialogueObjects = new InteractiveDialogue[]{candleDialogue1, candleDialogue2};
  }
}

class Chest extends Scene {

  public Chest() {
    super ("chest closed.png", "Chest", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
    };

    InteractiveDialogue chestClosedDialogue = new InteractiveDialogue(41, 167, 946, 532, 
      new Dialogue(new String[]{
      "The chest is locked", 
      "I need a key"
      }));

    dialogueObjects = new InteractiveDialogue[]{chestClosedDialogue};

    // to add key interactivity
    // super ("chest_open.png, "Chest");
  }
}

class Portrait extends Scene {
  boolean puzzleSolved = false;

  private InventoryItem[] placedPictures = new InventoryItem[4];
  private InteractiveDialogue[] pictureFrames;
  private Dialogue picturesWrongOrderDialogue = new Dialogue(new String[]{
    "Nothing happened"
    });

  private Dialogue picturesCorrectOrderDialogue = new Dialogue(new String[]{
    "The painting became distorted?"
    });

  InteractiveDialogue portraitDialogue = new InteractiveDialogue(284, 59, 433, 608, 
    new Dialogue(new String[]{
    "This is a painting", 
    "It shows a man"
    }));

  public Portrait() {
    super ("portrait.png", "Portrait", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
    };

    InteractiveDialogue pictureFrame1 = new InteractiveDialogue(171, 680, 135, 108, 
      new Dialogue(new String[]{
      "It's a picture frame"
      }));
    InteractiveDialogue pictureFrame2 = new InteractiveDialogue(321, 680, 157, 109, 
      new Dialogue(new String[]{
      "It's a picture frame"
      }));
    InteractiveDialogue pictureFrame3 = new InteractiveDialogue(486, 678, 149, 109, 
      new Dialogue(new String[]{
      "It's a picture frame"
      }));
    InteractiveDialogue pictureFrame4 = new InteractiveDialogue(643, 678, 135, 110, 
      new Dialogue(new String[]{
      "It's a picture frame"
      }));

    pictureFrames = new InteractiveDialogue[]{pictureFrame1, pictureFrame2, pictureFrame3, pictureFrame4};
  }

  public void Draw() {
    super.Draw();
    for (int i = 0; i < placedPictures.length; i++) {
      if (placedPictures[i] != null) {
        image(placedPictures[i].objectImage, pictureFrames[i].x, pictureFrames[i].y, pictureFrames[i].areaWidth, pictureFrames[i].areaHeight);
      }
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
    }

    super.MouseClicked();
  }
}
//basement 2

class SceneBasement_2 extends Scene {
  public SceneBasement_2() {
    super("Basement2.png", "Basement", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", width - 100, height - 100, 80, 80), 
      new SceneTransitionArea("Bookshelf Top", 490, 55, 370, 320), 
      new SceneTransitionArea("Bookshelf Bottom", 490, 380, 370, 240), 
      new SceneTransitionArea("Photo Album", 510, 630, 120, 83), 
    };
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
  public Album() {
    super ("picture book.png", "Photo Album", true);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80)
    };

    interactiveObjects.add(new InteractiveObject(189, 236, 323, 169, "picture 2.jpg", true, "Picture 2"));
    interactiveObjects.add(new InteractiveObject(188, 431, 323, 169, "picture 1.jpg", true, "Picture 1"));
    interactiveObjects.add(new InteractiveObject(525, 236, 323, 169, "picture 4.jpg", true, "Picture 4"));
    interactiveObjects.add(new InteractiveObject(525, 431, 323, 169, "picture 3.jpg", true, "Picture 3"));
  }
}
