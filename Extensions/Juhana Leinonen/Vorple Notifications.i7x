Version 3 of Vorple Notifications (for Glulx only) by Juhana Leinonen begins here.

"Notifications that display a short message on the screen and disappear after a few seconds."

Include version 3 of Vorple by Juhana Leinonen.

Use authorial modesty.


Chapter 1 - Notifications

To display a/-- notification reading (msg - text) for (sec - number) second/seconds:
	execute JavaScript command "Materialize.toast('[escaped msg]', [sec]000)";
	add msg to the displayed notifications.

To display a/-- notification reading (msg - text):
	display a notification reading msg for 7 seconds.


Chapter 2 - Fallback

Displayed notifications is a list of text that varies.

Before reading a command (this is the print notifications fallback rule):
	if Vorple is not supported:
		repeat with note running through displayed notifications:
			say "[italic type][bracket][note][close bracket][roman type][paragraph break]" (A).

Before reading a command (this is the empty displayed notifications list rule):
	truncate displayed notifications to 0 entries.


Vorple Notifications ends here.


---- DOCUMENTATION ----

Chapter: Notifications

Notifications are messages that show briefly on the screen and then fade away. A notification can be displayed simply with:

	display a notification reading "Hello World!";
	
The notification is shown for seven seconds before it disappears. The duration can be changed:

	display a notification reading "Hello World!" for 10 seconds;

Notifications are shown in the top right corner of the page, except in mobile views (600 pixels and narrower) the notifications are shown on the top of the page in a bar that spans the entire page width.


Chapter: Fallback

If Vorple isn't available, the fallback is to display the notifications at the end of turn as plain text. The feature can be overridden by checking Vorple's availability:

	if Vorple is available:
		display a notification reading "Click on your inventory items to examine them more closely";
	otherwise:
		say "Type EXAMINE followed by an inventory item's name to examine them more closely.";
		
	if Vorple is available:
		display a notification reading "Welcome to Vorple-enhanced [story title]!";

The default fallback can also be turned off completely:

	*: The print notifications fallback rule is not listed in any rulebook.


Example: * How To I - Showing small tips to new players who might not be familiar with the standard IF conventions.

	*: "How To I"
	
	Include Vorple Notifications by Juhana Leinonen.  
	Release along with the "Vorple" interpreter.

	Lab is a room. "You're in a fancy laboratory."
	Corridor is north of lab.

	A test tube is in the lab.
	A trolley is in the lab. It is pushable between rooms.

	When play begins:
		display a notification reading "Type LOOK (or just L) to see the room description again".

	After taking something for the first time:
		display a notification reading "Type INVENTORY (or just I) to see a list of what you're carrying";
		continue the action.

	After examining the trolley for the first time:
		display a notification reading "You can push the trolley between rooms by commanding PUSH TROLLEY followed by a compass direction".

	After reading a command when the player's command includes "examine":
		display a notification reading "Tip: You can abbreviate EXAMINE to just X".
			
	Test me with "take test tube / examine test tube / x trolley".


Example: ** Score Notifications - A visual notification when the player is awarded points.

We'll create a rule that will show the score change as a Vorple notification, or use the original score notification rule if the game is being played in a non-Vorple interpreter.
	
	*: "Score Notifications"
	
	Include Vorple Notifications by Juhana Leinonen.
	Release along with the "Vorple" interpreter.
	
	Use scoring. The maximum score is 5.
	
	
	Chapter 1 - New score notifications
	
	To say score notification message:
		(- NotifyTheScore(); -).
	
	This is the enhanced notify score changes rule:
		if Vorple is supported:
			if the last notified score is not the score:
				show a notification reading "[score notification message]";
				now the last notified score is the score;
		otherwise:
			follow the notify score changes rule.
	
	The enhanced notify score changes rule is listed instead of the notify score changes rule in the turn sequence rulebook.
	
	
	Chapter 2 - Treasure chamber
	
	Treasure Chamber is a room. "Wealth beyond your dreams is piled all over this room."
	
	A valuable is a kind of thing. The pearls, gold coins, diamonds, rubies and emeralds are plural-named valuables in the Treasure Chamber. 
	
	Carry out taking a valuable when the noun is not handled (this is the award points for finding valuables rule):
		increase the score by one.
	
	Test me with "take coins / take diamonds and rubies / take all".
