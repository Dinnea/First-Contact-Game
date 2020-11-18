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
