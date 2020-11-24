class Office1 extends Scene {
  private boolean firstEntrance = true;
  
  Dialogue sceneEnterConversation = new Dialogue(new String[]{
    "- I felt nervous, like I was about to tell my biggest secret, and who knows maybe deep down this was my deepest secret, so secret that even I did not know it -",
    "T: \"please start at the very beginning\"",
    "P: \"The beginning is a bit odd to explain, most of the time I'll be having a different dream, when suddenly, in that dream I fall to the ground\"",
    "T: \"go on\"",
    "- I close my eyes as  I try to remember everything in detail -",
    "P: \"In my dream I always wake up in the same basement\""
    });

  public Office1() {
    super("office.png", "Office", false);
  }
  
  public void Draw(){
    super.Draw();
    if(!firstEntrance && !Game_First_Contact.dialogueActive){
      ChangeScene("Basement 1");
    }
    
    if(firstEntrance){
      sceneEnterConversation.Play();
      firstEntrance = false;
    }
  }
}
