class Bookshelf_Bot extends Scene{
   public Bookshelf_Bot(){
    super ("booshelf zoom 2.png", "Bookshelf Bottom");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80),
      new SceneTransitionArea("Bookshelf Top", 20, 100, 80, 80)
    };
  }
}
