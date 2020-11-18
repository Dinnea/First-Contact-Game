class Bookshelf_Top extends Scene{
   public Bookshelf_Top(){
    super ("bookshelf zoom1.png", "Bookshelf Top");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80),
      new SceneTransitionArea("Bookshelf Bottom", width -130, height - 200, 80, 80)
    };
  }
}
