//import the story.dart file into this file.
import 'story.dart';

// Create a new class called StoryBrain.
class StoryBrain {
  List<Story> _storyData = [
    Story(
        storyImage: 'images/photo1b.jpg',
        storyTitle:
            'Once upon a time, there was a princess. Her name is Annalise. She lived in the castle with King Edward and Queen Elizabeth. One day, King Edward said:"Annalise, you are 16 now. I will find a good husband for you."',
        choice1: 'Yes, father',
        choice2: 'No way, I won\'t ever get married'),
    Story(
        storyImage: 'images/photo1b.jpg',
        storyTitle:
            '"Sweetheart"- Queen Elizabeth appeased. "Your father and I will choose a perfect man for you"',
        choice1: 'Ok, but I can say NO if I don\'t like that man.',
        choice2: 'Never, I will live as a happy rich queen.'),
    Story(
        storyImage: 'images/photo2.jpg',
        storyTitle:
            'King Edward decided to make a proclamation that he was seeking a husband for his daughter and invited princes from anywhere to come. One day, Prince Charming, a quiet and gentle man arrived.',
        choice1: 'Choose Prince Charming and marry him',
        choice2: '"I don\'t like him. I will go find a prince on my own."'),
    Story(
        storyImage: 'images/photo4.jpg',
        storyTitle:
            'And the princess lived happily ever after in her own big castle with all of her own money and she took care of herself. The end.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyImage: 'images/photo9b.jpg',
        storyTitle:
            'The princess started her journey to find her real love. Hope there was a happy ending ^^.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyImage: 'images/photo7.jpg',
        storyTitle:
            'And then, the beautiful princess and the handsome prince lived happy ever after. ',
        choice1: 'Restart',
        choice2: '')
  ];

//TODO: Step 23 - Use the storyNumber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.

//Create a method called getImage()
  String getImage() {
    return _storyData[_storyNumber].storyImage;
  }

//Create a method called getStory()
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

//Create a method called getChoice1()

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

//Create a method called getChoice2()

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

//Create a property called storyNumber which starts with a value of 0. This will be used to track which story the user is currently viewing.
  //Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across all the places where it's used.

  int _storyNumber = 0;

//Create a method called nextStory()
  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

//Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
  bool buttonShouldBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
