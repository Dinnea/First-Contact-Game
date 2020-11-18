class SceneBasement_2 extends Scene {
  public SceneBasement_2() {
    super("Basement2.png", "Basement");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", 0, height - 30, width, 30)
    };
  }
}
