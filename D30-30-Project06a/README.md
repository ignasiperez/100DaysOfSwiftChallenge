# Project 6a - Guess the Flag with Landscape View App

Extension of the Guess the Flag  App.

This App lets users play across both orientations, portrait and landscape.

## INSTRUCTIONS [Hacking with Swift Day 30](https://www.hackingwithswift.com/100/30)

1. Setting up.
   - _`Xcode`_
     - Take a copy of _project2_, call it _project6a_.
2. Add extra rules to _Auto Layout_ so it can make the layout work great in landscape mode.
   - _`IB Main.Storyboard`_
     - Select the third button,
       - Ctrl-drag from the flag to the white space below the flag
         - _Bottom Space to Safe Area_
       - See its list of constraints drawn in blue, then select the bottom constraint we just added.
         - In the utilities view on the right, choose the attributes inspector (⌥⌘4)
           - Relation: _Greater Than or Equal_
           - Constant: _20_
     - Select the second button,
       - Ctrl-drag to the first button
         - _Equal Heights_
     - Select the third button,
       - Ctrl-drag to the second button
         - _Equal Heights_
     - Select the three buttons one at a time,
        - Ctrl-drag a little bit upwards staying within the button
          - _Aspect Ratio_
  
## KEY CONCEPTS

- _Auto Layout_
  - _Aspect ratio constraints_
