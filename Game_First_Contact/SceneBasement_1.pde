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
