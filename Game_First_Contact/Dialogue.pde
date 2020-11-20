class Dialogue {

  //Lines of dialogue
  String[] dialogueLines;

  //Which line of dialogue is currently shown
  int currentDialogueLine = 0;

  //Constructor
  public Dialogue(String[] newDialogue) {
    dialogueLines = newDialogue;
  }

  public void Draw() {
    //Draw the dialogue box
    fill(255, 0, 255, 200);
    rect(0, height - 150, width, 150);
    fill(255, 255, 255);
    textAlign(CENTER, TOP);
    text(dialogueLines[currentDialogueLine], width / 2, height - 145);
  }

  public void MouseClicked() {
    //If the mouse clicks on the "next dialogue" button
    if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, 0, height - 150, width, 150)) {

      //If this was the last line of dialogue...
      if (currentDialogueLine == dialogueLines.length - 1) {

        //Stop showing dialogue
        Game_First_Contact.dialogueActive = false;

        //Reset the dialogueLine
        currentDialogueLine = 0;
      } //Else go to the next line
      else {
        currentDialogueLine++;
      }
    }
  }

  public void MouseHover() {
    //Check if the mouse is on the text box
    if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, 0, height - 150, width, 150)) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
}
