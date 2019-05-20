# Project 6b - Auto Layout App

This app shows how to distribute five labels programtically for portrait and landscape mode.

## INSTRUCTIONS [Hacking with Swift Day 30](https://www.hackingwithswift.com/read/6/3/auto-layout-in-code-addconstraints-with-visual-format-language)

1. Setting up.
   - _`Xcode`_
     - Create a new _Single View App_ project.
       - Product Name: _Project6b_
2. Labels setup with unique text and a unique background color.
   _`ViewController.swift`_ _`labelsSetup()`_
    - (Code D30-02-Labels_setup)
3. Add labels to the current _view_
   _`ViewController.swift`_ _`addLabelsToCurrentView()`_
     - (Code D30-03-Add_labels_to-the_current_view)
4. creates an empty dictionary of _views_ with strings for its _keys_ and labels as its _values_.
   _`ViewController.swift`_
     - (Code D30-04-Create_an_empty_dictionaty_of_views)
5. Initialize the dictionary of views with our lables.
   - _`ViewController.swift`_
       - (Code D30-05-Initialize_dictionary_with_lables)
6. Add Auto Layout constrains programmatically indicating that each label should start at the left edge of its superview, and end at the right edge through **_Auto Layout Visual Format Language_** (**_VFL_**), .
   - _`ViewController.swift`_ _`addConstrainsToCurrentView()`_
       - Add horizontal constraints
         - (Code D30-06-Add_horizontal_constraints)
       - Add vertical constraints
         - (Code D30-06-Add_vertical_constraints)
7. Add constraints with Auto Layout metrics and priorities
   - _`ViewController.swift`_ `viewDidLoad()`
     - (Code D30-07-Add_vertical_constraints_without_metrics)
     - (Code D30-07-Add_vertical_constraints_with_metrics)
     - (Code D30-07-Add_vertical_constraints_with_metrics_and_constraint_priority)