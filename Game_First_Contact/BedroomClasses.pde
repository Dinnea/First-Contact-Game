//closet
class Closet extends Scene {
  public Closet() {
    super("Inside_closet.png", "Closet?", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Bedroom 1",0,0, 1000, 800),
      new SceneTransitionArea("Bedroom 1",0,0, 1000, 800),
    };
    
  }
}

//bedroom1
class Bedroom1 extends Scene {
  public Bedroom1() {
    super("bedroom1.png", "Beedroom 1", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Bedroom 2", width - 100, height - 100, 80, 80),
      new SceneTransitionArea("Door Lock", 380, 420, 50, 50)
    };  
  }
}

//bedroom2
class Bedroom2 extends Scene {
  public Bedroom2() {
    super("bedroom2.png", "Beedroom 2", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Bedroom 1", 20, height - 100, 80, 80),
      new SceneTransitionArea("Diary", width/2, height/2, 80, 80),
    };
  }
}

//door lock zoom
class DoorLock extends Scene {
  public DoorLock() {
    super("Door_lock.png", "Door Lock", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Bedroom 1", width - 100, height - 100, 80, 80),
    };
  }
}

//diary
class Diary extends Scene {
  public Diary() {
    super("Diary.png", "Diary", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Bedroom 2", width - 100, height - 100, 80, 80),
      new SceneTransitionArea("Diary page", width/2, 450, 300, 250)
    };
  }
}

//diary page
class DiaryPage extends Scene {
  public DiaryPage() {
    super("Diary_reading.png", "Diary page", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Diary", width - 100, height - 100, 80, 80),
    };
  }
}
