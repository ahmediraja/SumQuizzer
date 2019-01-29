

Button[] answerButtons = new Button[11];
Button next;

PVector question;

int answer;

boolean nextQ = false;
boolean answered = false;
boolean correct = false;

void settings() {
  size(1100, 800);
  //frameRate(60);
}

void setup() {
  rectMode(CENTER);

  question = new PVector((int)random(0, 6), (int)random(0, 6));

  //for (int i = 0; i < questions.length; i++) {
  //  questions[i] = new PVector((int)random(0, 6), (int)random(0, 6));
  //}

  for (int i = 0; i < answerButtons.length; i++) {
    answerButtons[i] = new Button(new PVector((i*(width/11))+width/22, 600), width/11, 100, str(i));
  }
  
  next = new Button(new PVector(width*0.75, height/3), 150, 100, "NEXT");
}

void drawUI() {
  textAlign(CENTER, CENTER);
  textSize(70);
  fill(255, 0, 0);
  text("WELCOME To SumQuizzer!", width/2, height*0.12);
}

void drawQuestions() {
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(255);

  if (nextQ) {
    question = new PVector((int)random(0, 6), (int)random(0, 6));
  }
  nextQ = false;

  text((int)question.x + " + " + (int)question.y + " = ?", width/4, height/3);
}

//void doneQuiz() {
//  for (int i = 0; i < questions.length; i++) {
//    text((int)questions[index].x + " + " + (int)questions[index].y + " = ", width/4, height/3);
//  }
//}


void mouseReleased() {
  if (next.overRect()) {
    nextQ = true;
    answered = false;
  }

  if (!answered) {
    for (int i = 0; i < answerButtons.length; i++) {
      if (answerButtons[i].overRect()) {
        answer = (int)question.x + (int)question.y;
        if (answer == i) {
          correct = true;
        } else {
          correct = false;
        }
        answered = true;
        break;
      }
    }
  } else {
  }
}

void draw() {
  background(0);
  drawUI();
  drawQuestions();

  for (int i = 0; i < answerButtons.length; i++) {
    answerButtons[i].update();
  }

  next.update();

  if (answered) {
    fill(255);
    textSize(70);
    if (correct) {
      fill(0, 255, 0);
      text("CORRECT!", width*0.5, height*0.52);
      textSize(50);
      fill(0, 255, 155);
      text("Press the NEXT button to continue!", width/2, height*0.9);
    } else {
      fill(255, 0, 0);
      text("INCORRECT!", width*0.5, height*0.52);
      textSize(50);
      fill(0, 255, 155);
      text("Press the NEXT button to continue!", width/2, height*0.9);
    }
  }

  println(correct);
  //println(mouseX + "............" + mouseY);
}
