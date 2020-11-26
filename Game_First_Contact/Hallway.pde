//hallway start
class Hallway1 extends Scene {
  
   private boolean firstEntrance = true;
   
   Dialogue hallwayDialogue = new Dialogue(new String[]{
    "- I opened the hallway, another void, darkness as far as I could see, The Shadowed walls were alligned with pictures of myself, my mom and my sister -",
    "T: Continue..",
    "P: I walked further down the hall, hardly able to see anything, hoping that there was and end to the seemingly endless hallway.",
    "P: I don't know for how long i was in there walking forward, but eventually i could see a sliver of light peeking from under a door.",
    });
    
  public Hallway1() {
    super("Darkless_hallway.png", "Hallway", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Hallway 2", 0, 0, 1000, 800),
    };   
  }
  public void Draw() {
    //Check if it's the first time entering the room
    if (firstEntrance) {
      //Play the dialogue
      hallwayDialogue.Play();
      
      //Update the boolean
      firstEntrance = false;
    }

    //Draw the rest of the scene
    super.Draw();
  }
}

//hallway cont
class Hallway2 extends Scene {
  private boolean firstEntrance = true;
   Dialogue hallway2Dialogue = new Dialogue(new String[]{
    "- I fastened my pace, I would say i ran but i think i was too afraid of tripping, of stepping into a trap somewhere hiding in the darkness. My hand eventually reached out for the doornob and the door opened -"
    });
  public Hallway2() {
    super("Dark_hallway.png", "Hallway 2", false);
    transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Outside", 0, 0, 1000, 800),
    };
    
    
  }
  public void Draw() {
    //Check if it's the first time entering the room
    if (firstEntrance) {
      //Play the dialogue
      hallway2Dialogue.Play();
      
      //Update the boolean
      firstEntrance = false;
    }

    //Draw the rest of the scene
    super.Draw();
  }
}

class Outside extends Scene {
  private boolean firstEntrance = true;
  
  Dialogue outsideDialogue = new Dialogue(new String[]{
    "- I stepped outside, a rush of wind hitting my face as my eyes adjusted to the brightness of day -",
    "- I had made it outside, it hardly dawned on me that i had no clue where i was, let alone the grave i was sitting in front of -",
    "- my heart beat rapidly before i regained composure, breathing out a breath i did not know i was holding -",
    "T: Can you continue about the grave?",
    "P: yes, of course",
    "P: I stood in front of a grave, I seemed to be in the middle of a forest, the grave was surrounded by flowers.",
    "P: The headstone read...",
    "- Here lies, Olivia, twin sister and beloved daugther. May she Rest in Peace -",
    "P: The date was scratched out.",
    "P: I stared at it for a while, a numbing sadness washing over me, grounding my feet in place.",
    "T: Does anything happen afterwards?",
    "P: Sometimes... Sometimes I hear police sirens",
    "P: Other times, I just wake up",
    });
    
  public Outside(){
    super("outside.png", "Outside", false);
        transitionAreas = new SceneTransitionArea[]{
      new SceneTransitionArea("Office ", 0, 0, 1000, 800),
    };
  }
  public void Draw() {
    //Check if it's the first time entering the room
    if (firstEntrance) {
      //Play the dialogue
      outsideDialogue.Play();
      
      //Update the boolean
      firstEntrance = false;
    }

    //Draw the rest of the scene
    super.Draw();
  }
  
}

class Credits extends Scene{
  public Credits(){
    super("Credits.png", "   ", false);

  }
}
