class SceneBasement_1 extends Scene {
  public SceneBasement_1() {
    super("Basement1.png", "Basement");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 2", 0, height - 30, width, 30)
    };
  }
}
