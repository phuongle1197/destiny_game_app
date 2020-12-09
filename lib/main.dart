import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Create a new storyBrain object from the StoryBrain class.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              storyBrain.getImage(),
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Text(
                  storyBrain.getStory(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(
                height: 250.0,
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      //Choice 1 made by user.
                      //Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                      storyBrain.nextStory(1);
                    });
                  },
                  color: Colors.pink[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    //side: BorderSide(color: Colors.blueAccent[700]),
                  ),
                  child: Text(
                    //Use the storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                // Use a Flutter Visibility Widget to wrap this FlatButton.
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),

                  //Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                      //Choice 2 made by user.
                      //Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      //side: BorderSide(color: Colors.blueAccent[700]),
                    ),
                    color: Colors.blue[300],
                    child: Text(
                      // Use the storyBrain to get the text for choice 2.
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SourceSansPro',
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
