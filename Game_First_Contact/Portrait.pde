class Portrait extends Scene{
   public Portrait(){
    super ("portrait.png", "Portrait");
     transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 20, height - 100, 80, 80)
     };
  }
}
