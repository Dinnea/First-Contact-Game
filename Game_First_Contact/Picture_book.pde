class Album extends Scene {
   public Album(){
    super ("picture book.png", "Photo Album");
     transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 20, height - 100, 80, 80)
     };
  }
}
