//closet
class Closet extends Scene {
  public Closet() {
    super("Inside_closet.png", "Closet?", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Bedroom 1",0,0, 1000, 800),
    };
     Dialogue inClosetDialogue = new Dialogue(new String[]{
    "- I didn't even feel like I was falling, I hardly even noticed i had hit the ground -",
    "- I felt around and pushed against the wall of the box, the 'wall' gave out and I stumbled into a bedroom -"
    });
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
    InteractiveDialogue closetClickDialogue = new InteractiveDialogue(75, 167, 920, 532, 
    new Dialogue(new String[]{
    "- It's the closet I fell out of -"
    }));
  }
}

//door lock zoom
class DoorLock extends Scene {
  public DoorLock() {
    super("Door_lock.png", "Door Lock", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Bedroom 1", width - 100, height - 100, 80, 80),
    };
    
    Dialogue nearLockDialogue = new Dialogue(new String[]{
    "- The door is locked, it seems i need a code...-"
    });
    
    
      
    

    buttons = new LockButton[]{
      new LockButton(480, 520, 50, 50, 1),
      new LockButton(530, 520, 50, 50, 2),
      new LockButton(580, 520, 50, 50, 3),
      new LockButton(480, 470, 50, 50, 4),
      new LockButton(530, 470, 50, 50, 5),
      new LockButton(580, 470, 50, 50, 6),
      new LockButton(480, 420, 50, 50, 7),
      new LockButton(530, 420, 50, 50, 8),
      new LockButton(580, 420, 50, 50, 9)
    };  
    }
    
    //buttons
      int correct1 = 3;
      int correct2 = 9;
      int correct3 = 7;
          
      int saved1 = 0;
      int saved2 = 0;
      int saved3 = 0;
      
      boolean isSaved1 = false;
      boolean isSaved2 = false;
      boolean isSaved3 = false;
      
  void lockPuzzle(){
    
      
       if (buttons!= null){
        for (int  i = 0; i<buttons.length; i++){
          //mouse hovers over
          if (CheckPointOnBoxCollision(mouseX, mouseY,
                                       buttons[i].x, buttons[i].y,
                                       buttons[i].w, buttons[i].h)){                                     
            if (isSaved1 != true){
              saved1 = buttons[i].n;
              isSaved1 = true;
            }
            else if (isSaved2 != true){
              saved2 = buttons[i].n;
              isSaved2 = true;
            }
            else if (isSaved3 != true){
              saved3 = buttons[i].n;
              isSaved3 = true;
              if ((saved1 == correct1) && (saved2 == correct2) && (saved3 == correct3)){
                transitionAreas = new SceneTransitionArea[]{
                   new SceneTransitionArea("Hallway", 500, 300, 80, 80),
                };
              }
                else{
                  isSaved1 = false;
                  isSaved2 = false;
                  isSaved3 = false;
                }
              }
            }
           
          }
        }
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
