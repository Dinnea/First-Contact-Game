class SceneStart extends Scene {
  public SceneStart() {
    super ("Start Screen.jpg", "", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 253, 565, 183, 71), 
    };
  }
}
