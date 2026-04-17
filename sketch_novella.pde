PImage currentScreen,menu,cont;
PImage scene1;
PImage settings;
boolean thirdchoice=true;
boolean begining = false, choiceObedat = false, choicePlacat = false, menuopen= true, settingsopen= false, choosing=false;
boolean flag1=false,flag2=false;
PImage bg1,character,prewchar,dial,janin,paula,natan,klif;
PFont replika;
PFont name;
boolean choice1=false;
boolean choice2=false;
import processing.sound.*;
SoundFile file,badend,chooseend,hallway,button,prom,ring,stadion;
boolean musicon = true;
boolean soundson = true;
String repl1;
String nme;
String[] lines;
String keyword = "0000000000000000000000000000000000",allzero="0000000000000000000000000000000000";
int backup,choice=0,path=1;


void setup() {
  fullScreen();
  janin = loadImage("scene/dzhinsi.png");
  cont = loadImage("cont.jpg");
  menu = loadImage("main.jpg");
  currentScreen = loadImage("main.jpg");
  scene1 = loadImage("scene1.jpg");
  settings = loadImage("settings.png");
  bg1 = loadImage("scene/bg1.png");
  character = loadImage("scene/paula.png");
  paula = loadImage("scene/paula.png");
  natan = loadImage("scene/natan.png");
  //dial = loadImage("scene/choice.png");
  dial = loadImage("scene/dial.png");
  replika = createFont("Montserrat-Regular.ttf", 16);
  name = createFont("Montserrat-SemiBold.ttf", 16);
  repl1 = "Очередной день. Скучный и ничем непримечательный";
  nme = "Паула";
  klif = loadImage("клифхенгер.jpg");
  //badend = new SoundFile(this, "sounds/badend.wav");
  //chooseend = new SoundFile(this, "sounds/chooseend.wav");
  //hallway = new SoundFile(this, "sounds/hallway.wav");
  button = new SoundFile(this, "sounds/knopka.wav");
  //prom = new SoundFile(this, "sounds/prom.wav");
  //ring = new SoundFile(this, "sounds/ringschool.mp3");
  //stadion = new SoundFile(this, "sounds/stadion.wav");
  //file = new SoundFile(this, "основная1.mp3");
  //file.loop();
  //file.amp(0.2);
  
  prewchar=character;
  
  String[] fileContent = loadStrings("Реплики.txt"); // Загрузка содержимого файла в массив строк
  lines = new String[fileContent.length];
  for (int i = 0; i < fileContent.length; i++) {
    lines[i] = fileContent[i];
  }
}
  
  int findWordInFile(String keyword) {
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].contains(keyword)) {
        return i;
      }
  }
  return -1; // Возвращает -1, если ключевое слово не найдено
  }

  
void draw() {
  background(255);
  if (begining == false) {
    image(currentScreen,0,0);
  
  //Проверки курсора для меню
  if (menuopen== true){
    currentScreen=menu;
    if ((mouseX > 293 && mouseX < 893 && mouseY > 572 && mouseY < 672) || (mouseX > 293 && mouseX < 893 && mouseY > 710 && mouseY < 810)) {
      cursor(HAND); 
    }
    else{
      cursor(ARROW);
    }
  }
  //Проверки курсора для настроек
  if (menuopen == false){
    if ((mouseX > 660 && mouseX < 1260 && mouseY > 667 && mouseY < 767) || (mouseX > 660 && mouseX < 1260 && mouseY > 534 && mouseY < 634) || (mouseX > 660 && mouseX < 1260 && mouseY > 401 && mouseY < 501)){
      cursor(HAND);
    }
    else{
      cursor(ARROW);
    }
}

    //Нажатие на кнопку "Отправиться в школу"
   if (mouseX > 293 && mouseX < 893 && mouseY > 572 && mouseY < 672) {
     if ((mousePressed == true) && (menuopen== true)){
       button.play();
       begining = true;
       cursor(ARROW);
     }
   }

   //Нажатие на кнопку "Настройки"
   if ((mouseX > 293 && mouseX < 893 && mouseY > 710 && mouseY < 810)){
     if ((mousePressed == true) && (menuopen==true)){
       button.play();
       settingsopen= true;
       menuopen=false;
     }
   }
  
  //Кнопки в настройках      
  if ((settingsopen==true)) {
    currentScreen=settings;
      //Продолжить
      if ((mouseX > 660 && mouseX < 1260 && mouseY > 667 && mouseY < 767)){
        if ((mousePressed == true)&& (menuopen== false)){
          button.play();
          menuopen= true;
          currentScreen=menu;
          settingsopen=false;
        }
      }
      
      //Вкл/Выкл Музыку       
      if ((mouseX > 660 && mouseX < 1260 && mouseY > 534 && mouseY < 634)){
        if ((mousePressed == true)&& (menuopen== false)){
          if  (musicon==true){
            button.play();
             // file.pause();
             // musicon = false;
           }
           else{
             button.play();
               // file.play();
               // musicon = true;
           }
         }
       }
       
       //Вкл/Выкл Звуки       
      if ((mouseX > 660 && mouseX < 1260 && mouseY > 401 && mouseY < 501)){
        if ((mousePressed == true)&& (menuopen== false)){
          if  (soundson==true){
            button.play();
            soundmute();
            soundson = false;
           }
           else{
             button.play();
             soundunmute();
             soundson = true;
           }
         }
       }
    }         
  }
  //Проверка нажатия на кнопку начала игры
  if (begining == true){
    
    
    currentScene(bg1,character,dial,repl1,nme,path);
    
    if(backup==3){
      dial=loadImage("choosings/1 выбор.png");
    }
    if(backup==103){
      dial=loadImage("choosings/2 выбор.png");
      thirdchoice=true;
    }
    if(backup==203){
      dial=loadImage("choosings/3 выбор.png");
    }
    if(backup==1103){
      dial=loadImage("choosings/4 выбор.png");
    }
    if(backup==2103){
      dial=loadImage("choosings/5 выбор.png");
      thirdchoice=true;
    }
    if(backup==3103){
      dial=loadImage("choosings/6 выбор.png");
    }
    if(backup==23103){
      dial=loadImage("choosings/9 выбор.png");
    }
    if((backup==123103)||(backup==12103)){
      dial=loadImage("choosings/7 выбор.png");
    }    
    if((backup==223103)||(backup==32103)){
      dial=loadImage("choosings/8 выбор.png");
      thirdchoice=true;
    }
    if(backup==232103){
      dial=loadImage("choosings/10 выбор.png");
      thirdchoice=true;
    }  
    if(backup==2232103){
      dial=loadImage("choosings/11 выбор.png");
    }
    if(backup==3232103){
      dial=loadImage("choosings/12 выбор.png");
    }      
    if(backup==12232103){
      dial=loadImage("choosings/13 выбор.png");
      thirdchoice=true;
    }        
    if(backup==112232103){
      dial=loadImage("choosings/14 выбор.png");
      thirdchoice=true;
    }       
    
    if((backup==1)||(backup==23100)||(backup==12102)){
    character=janin;
    }
    
    if ((backup==1112232105)||(backup==1112232107)||(backup==1112232109)||(backup==1112232111)){
    character=natan;
    }
    
    if((backup==0)||(backup==11101)||(backup==1112232103)||(backup==12101)||(backup==1112232103)||(backup==1112232106)||(backup==1112232108)||(backup==1112232110)){
    character=paula;
    } 
    
    if (backup==1112232103){
      bg1=loadImage("scene/bg2.png");
    }
    
    if (backup==1112232112){
      image(klif,0,0);
    }
    
    if(choosing==true){
      character=paula;
    }

    if ((backup%10==3)&&(backup!=1112232103)){
      choosing=true;
    }
    if (backup%10==0){
      dial = loadImage("scene/dial.png");
      choosing=false;
      character=prewchar;
    }
    if(backup%100==12){
      dial = loadImage("scene/choice.png");
      choosing=true;
   }
    }
}

void currentScene(PImage background, PImage character, PImage dialog, String repl, String nme, int choice){
  image(background,0,0);
  image(character,0,0);
  image(dialog,0,0);
  textFont(replika);
  textSize(35.33);
  fill(000000);
  text(repl, 167, 960);
  textFont(name);
  textSize(35.33);
  fill(#FFFFFF);
  text(nme, 160, 800);
 // choice=path;
}


void soundmute() {
  button.amp(0.0);
  //badend.amp(0.0);
  //chooseend.amp(0.0);
  //hallway.amp(0.0);
  //prom.amp(0.0);
  //ring.amp(0.0);
  //stadion.amp(0.0);
}
void soundunmute(){
  button.amp(1.0);
  //badend.amp(1.0);
  //chooseend.amp(1.0);
  //hallway.amp(1.0);
  //prom.amp(1.0);
  //ring.amp(1.0);
  //stadion.amp(1.0);
}


void mousePressed(){
  String keywordtemp=keyword;
  String current = "";
  int nomer = Integer.parseInt(keyword);
  int checking=nomer;
  println(nomer);
  
    if (menuopen== true){
     if (mouseX > 293 && mouseX < 893 && mouseY > 572 && mouseY < 672) {
      begining = true;
      cursor(ARROW);
    }
  }
  
  
  
  if (begining==true){
          
   if ((mouseX>1820 && mouseY<100)||(choosing==true)&&((mouseX > 710 && mouseX < 1210 && mouseY > 599 && mouseY < 679) || (mouseX > 710 && mouseX < 1210 && mouseY > 705 && mouseY < 785)||(thirdchoice==true)&&(mouseX > 610 && mouseX < 1310 && mouseY > 419 && mouseY < 519))){
        cursor(HAND);
     if (mouseX>1820 && mouseY<100){
        menuopen= true;
        currentScreen=cont;
          begining=false;
    }
  }
  else{
    cursor(ARROW);
  }
  
    
   if (choosing==false){
    if ((mouseX > 960 && mouseY > 100)){
      keyword = "0000000000000000000000000000000000";
      nomer+=1;
      current = String.valueOf(nomer);
      int dlina = current.length();
      keyword=keywordtemp.substring(0,34-dlina)+current;
      if (checking==11101){
        nomer=12102;
        keyword="0000000000000000000000000000012102";
      }
        if ((checking==12232100)||(checking==22232100)||(checking==23232100)||(checking==1232100)){
        nomer=12232101;
        keyword="0000000000000000000000000012232101";
      }
        if ((checking==1112232100)||(checking==2112232100)){
        nomer=1112232101;
        keyword="0000000000000000000000001112232101";
      }
    }
    if ((mouseX < 960 && mouseY > 100)&&(nomer%10 != 0)){
      keyword = "0000000000000000000000000000000000";
      nomer-=1;

      current = String.valueOf(nomer);
      int dlina = current.length();
      keyword=keywordtemp.substring(0,34-dlina)+current;
    }
   int lineNumber = findWordInFile(keyword); // Поиск ключевого слова в файле
   repl1=lines[lineNumber].substring(40);
   nme=lines[lineNumber].substring(34,40);
   backup=nomer;
   println(nme);
   prewchar=character;
  }
  

  
  
  
  
  if (choosing==true){
    if ((thirdchoice==true)&&(mouseX > 610 && mouseX < 1310 && mouseY > 419 && mouseY < 519)){
        keywordtemp = keyword.substring(32-choice,32);
        keyword=allzero.substring(0,32-choice-1)+'3'+keywordtemp+"00";
        nomer = Integer.parseInt(keyword);
                if (checking==2103){
                  nomer=32100;
                  keyword="0000000000000000000000000000032100";
                }
        if (checking==232103){
          nomer=3232100;
          keyword="0000000000000000000000000003232100";
        }
        if (checking==2232103){
        nomer=32232100;
        keyword="0000000000000000000000000032232100";
        }
        if (checking==3232103){
        nomer=22232101;
        keyword="0000000000000000000000000022232101";
        }
    }

    if (mouseX > 610 && mouseX < 1310 && mouseY > 557 && mouseY < 657) {
        keywordtemp = keyword.substring(32-choice,32);
        keyword=allzero.substring(0,32-choice-1)+'1'+keywordtemp+"00";
        nomer = Integer.parseInt(keyword);
               if (checking==2103){
                  nomer=12100;
                  keyword="0000000000000000000000000000012100";
                }
                if (checking==3103){
                  nomer=32100;
                  keyword="0000000000000000000000000000032100";
                }
                if (checking==232103){
                  nomer=1232100;
                  keyword="0000000000000000000000000001232100";
                }
        if (checking==2232103){
        nomer=12232100;
        keyword="0000000000000000000000000012232100";
        }
        if (checking==3232103){
        nomer=22232100;
        keyword="0000000000000000000000000022232100";
        }
    }
    if (mouseX > 610 && mouseX < 1310 && mouseY > 695 && mouseY < 795) {
        keywordtemp = keyword.substring(32-choice,32);
        keyword=allzero.substring(0,32-choice-1)+'2'+keywordtemp+"00";
        nomer = Integer.parseInt(keyword);
        if ((checking==1103) || (checking==2103)){
        nomer=12100;
        keyword="0000000000000000000000000000012100";
        }
        if (checking==232103){
        nomer=2232100;
        keyword="0000000000000000000000000002232100";
        }
        if (checking==2232103){
        nomer=22232100;
        keyword="0000000000000000000000000022232100";
        }
        if (checking==3232103){
        nomer=22232101;
        keyword="0000000000000000000000000022232101";
        }
    }
    
      if ((checking==12103)||(checking==32103)||(checking==123103)||(checking==203)){
          nomer=232100;
          keyword="0000000000000000000000000000232100";
        }
        if (checking==12232103){
        nomer=112232100;
        keyword="0000000000000000000000000112232100";
        }
        if (checking==112232103){
        nomer=1112232100;
        keyword="0000000000000000000000001112232100";
        }
        int lineNumber = findWordInFile(keyword); // Поиск ключевого слова в файле
        repl1=lines[lineNumber].substring(40);
        nme=lines[lineNumber].substring(34,40);
        backup=nomer;
        choice+=1;
        character=prewchar;

      
    }
  }
}
