//basement 1
class SceneBasement_1 extends Scene {
  public SceneBasement_1() {
    super("Basement1.png", "Basement");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80),
      new SceneTransitionArea("Portrait", 570, 35, 190, 300),
      new SceneTransitionArea("Chest", 867, 290, 133, 350)
    };
  }
}

class Chest extends Scene{
   public Chest(){
    super ("chest closed.png", "Chest");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
     };
    
    // to add key interactivity
    // super ("chest_open.png, "Chest");
  }
}

class Portrait extends Scene{
   public Portrait(){
    super ("portrait.png", "Portrait");
     transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
     };
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

class Bookshelf_Top extends Scene{
   public Bookshelf_Top(){
    super ("bookshelf zoom1.png", "Bookshelf Top");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80),
      new SceneTransitionArea("Bookshelf Bottom", width -130, height - 200, 80, 80)
    };
  }
}

class Bookshelf_Bot extends Scene{
   public Bookshelf_Bot(){
    super ("booshelf zoom 2.png", "Bookshelf Bottom");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80),
      new SceneTransitionArea("Bookshelf Top", 20, 100, 80, 80)
    };
  }
}

class Album extends Scene {
   public Album(){
    super ("picture book.png", "Photo Album");
     transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80)
     };
  }
}
