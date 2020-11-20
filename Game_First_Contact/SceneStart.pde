class SceneStart extends Scene {
  public SceneStart() {
    super ("Start Screen.jpg", "");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 252, 563, 182, 72),
    };
  }
}
