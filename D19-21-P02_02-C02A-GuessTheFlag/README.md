# Guess the flag App

A game that shows some random flags to users and ask them to choose which one belongs to a particular country.

## INSTRUCTIONS

Insert the image flags in the app bundle.

- Asset catalogs
- @2x and @3x images

Show users three flags on three buttons that should be 200 wide by 100 high.

- Interface Builder | Size Inspector | button
- images

At the top of the screen show the name of the country to guess in uppercased letters.

- navigation bar
- strings

Center the buttons on the screen and adjust the vertical spacing between them.

- auto layout

As some flags have white stripes, to avoid confusion with the white background of the screen we should draw a one point gray line around the buttons. 

- color
- core animation

Show the flags on the screen randomly.

- arrays
- random numbers

when the user taps one of the buttons we have to do three thigs. Check whether the answer is correct. Adjust the player's score up or down. Show a message telling them what their new score is.

- actions
- alert controllers

## CHALLENGES 2A

Show the player’s score in the navigation bar, alongside the flag to guess and a question. Example:  “Which flag corresponds to US? | Score: 3”

- strings

Keep track of how many questions have been asked and show one final message after they have answered 5. This should show their final score.

- alert controllers

When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Incorrect! That’s the flag of France”

- alert controllers