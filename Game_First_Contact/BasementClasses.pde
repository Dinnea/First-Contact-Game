//basement 1
class SceneBasement_1 extends Scene {
  public SceneBasement_1() {
    super("Basement1.png", "Basement");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80), 
      new SceneTransitionArea("Portrait", 570, 35, 190, 300), 
      new SceneTransitionArea("Chest", 867, 290, 133, 350)
    };
    interactiveObjects.add(new InteractiveObject(200, 200, 50, 50, "placeholder.png", true));
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
    super ("chest closed.png", "Chest");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
    };

    InteractiveDialogue chestDialogue = new InteractiveDialogue(41, 167, 946, 532, 
      new Dialogue(new String[]{
      "The chest is locked", 
      "I need a key"
      }));

    dialogueObjects = new InteractiveDialogue[]{chestDialogue};

    // to add key interactivity
    // super ("chest_open.png, "Chest");
  }
}

class Portrait extends Scene {
  public Portrait() {
    super ("portrait.png", "Portrait");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
    };

    InteractiveDialogue portraitDialogue = new InteractiveDialogue(299, 67, 420, 655, 
      new Dialogue(new String[]{
      "This is a painting", 
      "It shows a man"
      }));

    dialogueObjects = new InteractiveDialogue[]{portraitDialogue};
  }
}
//basement 2

class SceneBasement_2 extends Scene {
  public SceneBasement_2() {
    super("Basement2.png", "Basement");
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
    super ("bookshelf zoom1.png", "Bookshelf Top");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80), 
      new SceneTransitionArea("Bookshelf Bottom", width -130, height - 200, 80, 80)
    };
  }
}

class Bookshelf_Bot extends Scene {
  public Bookshelf_Bot() {
    super ("booshelf zoom 2.png", "Bookshelf Bottom");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80), 
      new SceneTransitionArea("Bookshelf Top", 20, 100, 80, 80)
    };
  }
}

class Album extends Scene {
  public Album() {
    super ("picture book.png", "Photo Album");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80)
    };
  }
}
