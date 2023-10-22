// import the flutter/material.dart package 
import 'package:flutter/material.dart'; 

// Define the main function 
void main() => runApp(MyApp()); 

// Define a class called Story with 
// a constructor that takes in a title and content 
class Story { 
final String title; 
final String content; 

Story({required this.title, required this.content}); 
} 

// Define a class called MyApp that 
// extends StatelessWidget 
class MyApp extends StatelessWidget { 
// Create a list of Story objects 
final List<Story> _stories = [ 
	Story( 
	title: 'The Lion and the Mouse', 
	content: 
		'Once upon a time, a lion was sleeping in the forest when a mouse ran over his nose. The lion woke up and was about to eat the mouse when the mouse begged for mercy. The lion laughed at the tiny mouse, but decided to let him go. Later, the lion got caught in a hunter\'s trap, and the mouse came to his rescue by gnawing through the ropes.', 
	), 
	Story( 
	title: 'The Ant and the Grasshopper', 
	content: 
		'In a field one summer\'s day a Grasshopper was hopping about, chirping and singing to its heart\'s content. An Ant passed by, bearing along with great toil an ear of corn he was taking to the nest. "Why not come and chat with me," said the Grasshopper, "instead of toiling in that way?" "I am helping to lay up food for the winter," said the Ant, "and recommend you to do the same."', 
	), 
	Story( 
	title: 'The Tortoise and the Hare', 
	content: 
		'Once upon a time, a tortoise and a hare had a race. The hare was very confident that he would win, so he took a nap during the race. Meanwhile, the tortoise slowly but steadily made his way to the finish line, and won the race.', 
	), 
]; 

// Override the build method to return a MaterialApp widget 
@override 
Widget build(BuildContext context) { 
	// Return a MaterialApp widget with a title and a home 
	return MaterialApp( 
	title: 'Flutter Story App', 
	home: Scaffold( 
		appBar: AppBar( 
		title: Text('Stories'), 
		), 
		// Create a ListView widget with itemBuilder 
		// that returns a ListTile for each story 
		body: ListView.builder( 
		itemCount: _stories.length, 
		itemBuilder: (context, index) { 
			final story = _stories[index]; 
			// When the user taps on a ListTile, navigate 
			// to a new StoryScreen widget with the selected story 
			return ListTile( 
			title: Text(story.title), 
			onTap: () { 
				Navigator.push( 
				context, 
				MaterialPageRoute( 
					builder: (context) => StoryScreen(story: story), 
				), 
				); 
			}, 
			); 
		}, 
		), 
	), 
	); 
} 
} 

// Define a new class called StoryScreen 
// that extends StatelessWidget 
class StoryScreen extends StatelessWidget { 
// Define a final variable 
// to hold the selected story 
final Story story; 

// Create a constructor for the StoryScreen 
// class that takes in a Story object 
StoryScreen({required this.story}); 

// Override the build method 
// to return a Scaffold widget 
@override 
Widget build(BuildContext context) { 
	// Return a Scaffold widget with an 
	// AppBar and a Text widget 
	// containing the selected story 
	return Scaffold( 
	appBar: AppBar( 
		title: Text(story.title), 
	), 
	body: Padding( 
		padding: EdgeInsets.all(16.0), 
		child: Text(story.content), 
	), 
	); 
} 
} 
