//hallway start
class Hallway1 extends Scene {
  public Hallway1() {
    super("Darkless_hallway.png", "Hallway", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Hallway 2", width/2, height/2, 80, 80),
    };
  }
}

//hallway cont
class Hallway2 extends Scene {
  public Hallway2() {
    super("Dark_hallway.png", "Hallway 2", false);
    //transitionAreas = new SceneTransitionArea[]{
    //  new SceneTransitionArea("Hallway 2", width - 20, height - 100, 80, 80),
    //};
  }
}
