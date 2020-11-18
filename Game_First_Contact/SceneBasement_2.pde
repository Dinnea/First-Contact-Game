class SceneBasement_2 extends Scene {
  public SceneBasement_2() {
    super("Basement2.png", "Basement");
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Basement 1", width - 100, height - 100, 80, 80),
      new SceneTransitionArea("Bookshelf Top", 490, 55, 370, 320),
      new SceneTransitionArea("Bookshelf Bottom", 490, 380, 370, 240),
      new SceneTransitionArea("Photo Album", 510, 630, 120, 83),
    };
  }
}
