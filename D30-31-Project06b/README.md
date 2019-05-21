# Project 6b - Auto Layout App

This app shows how to distribute five labels programtically for portrait and landscape mode.

## INSTRUCTIONS [Hacking with Swift Day 30](https://www.hackingwithswift.com/read/6/3/auto-layout-in-code-addconstraints-with-visual-format-language)

1. Setting up.
   - _`Xcode`_
     - Create a new _Single View App_ project.
       - Product Name: _Project6b_
2. Labels setup with unique text and a unique background color.
   - _`ViewController.swift`_ `viewDidLoad()` _`labelsSetup()`_
     - (Code D30-02-Labels_setup)
3. Add labels to the current _view_
   - _`ViewController.swift`_ `viewDidLoad()` _`addLabelsToCurrentView()`_
     - (Code D30-03-Add_labels_to-the_current_view)
4. creates an empty dictionary of _views_ with strings for its _keys_ and labels as its _values_.
   - _`ViewController.swift`_
     - (Code D30-04-Create_an_empty_dictionaty_of_views)
5. Initialize the dictionary of views with our lables.
   - _`ViewController.swift`_ `viewDidLoad()`_`initializeViewsDictionary()`_
       - (Code D30-05-Initialize_dictionary_with_lables)
6. Add _Auto Layout constrains_ programmatically to current _view_ indicating that each label should start at the left edge of its superview, and end at the right edge through **_Auto Layout Visual Format Language_** (**_VFL_**), .
   - _`ViewController.swift`_ `viewDidLoad()` _`addHorizontalConstarints()`_
       - Add horizontal constraints
         - (Code D30-06-Add_horizontal_constraints)
   - _`ViewController.swift`_ `viewDidLoad()` _`addVerticalConstarints()`_
       - Add vertical constraints
         - (Code D30-06-Add_vertical_constraints)

## INSTRUCTIONS [Hacking with Swift Day 31](https://www.hackingwithswift.com/100/31)

1. Add vertical contraints with height sizes.
   - _`ViewController.swift`_ `viewDidLoad()` _`addVerticalContraintsWithHeightSizes()`_
     - (Code D31-01-Add_vertical_constraints_with_height_sizes)
2. Add constraints with _Auto Layout metrics_
   - _`ViewController.swift`_ `viewDidLoad()` _`addVerticalConstrainsWithMetrics()`_
     - (Code D31-02-Add_vertical_constraints_with_metrics)
3. Add constraints with _Auto Layout metrics_ and _priorities_
   - _`ViewController.swift`_ `viewDidLoad()` _`addVerticalConstraintsWithMetricsAndPriority()`_
     - (Code D31-03-Add_vertical_constraints_with_metrics_and_constraint_priority)
4. Add constraints with _Auto Layout anchors_
   - _`ViewController.swift`_ `viewDidLoad()` _`addConstraintsWithAnchors()`_
     - (Code D31-04-Add_Horizontal_and_vertical_constraints_with_anchors)
5. Add constraints with _Auto Layout anchors_ using only _the safe area_
   - _`ViewController.swift`_ `viewDidLoad()` _`addConstraintsWithAnchorsWithinSafeArea()`_
     - (Code D31-05-Add_constraints_with_anchors_within_safe_area)

## INSTRUCTIONS [Hacking with Swift Day 31 Challenges](https://www.hackingwithswift.com/read/6/6/wrap-up)

1. Try replacing the `widthAnchor` of our labels with `leadingAnchor` and `trailingAnchor` constraints, which more explicitly pin the label to the edges of its parent.
2. Once you’ve completed the first challenge, try using the `safeAreaLayoutGuide` for those constraints.
3. Try making the height of your labels equal to 1/5th of the main view, minus 10 for the spacing.
   - _`ViewController.swift`_ `viewDidLoad()` _`addConstraintsWithLeadingAndTrailingAnchorsWithinSafeArea()`_
     - (Code D31-C1..3-Add_constraints_with_leading_and_trailing_anchors_within_safe_area)

## KEY CONCEPTS

- **Add constraints programmatically with Auto Layout**
  - **Visual Format Language (VFL) Technology** 
    - Horizontally, I want my label to go edge to edge in my view.
      - `view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|",...)`
        - _`H`_: Defining a horizontal layout.
        - `|`: The edge of the view controller.
        - `[]`: The edges of the view.
    - Vertically, I want my labels to be separated vertically with a 10 points distance.
      - `view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]",...)`
        - _`V`_: Defining a vertical layout.
        - _`-`_: "space". It's 10 points by default, but we can customize it.
        - `|`: This vertical VFL doesn't have a pipe at the end, so we're not forcing the last label to stretch all the way to the edge of our view. This will leave whitespace after the last label.
    - Vertically, I want my labels to be 88 points high and the last label must be at least 10 points away from the bottom of the view controller's view.
      - `view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(==88)]-[label2(==88)]-[label3(==88)]-[label4(==88)]-[label5(==88)]-(>=10)-|",...)``
        - `(==88)`: 88 points high.
        - `(>=10)`: At least 10 points away from the bottom of the view controller's view.
    - Vertically, I want my labels to be 88 points high, but I do not want to hard-code the numbers.
      - `let metrics = ["labelHeight": 88]`
      - `view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight)]-[label2(labelHeight)]-...->=10-|, options: [], metrics: metrics, views: viewsDictionary ..."`
        - `(labelHeight)`: Now the label height is not hard-coded on each label.
    - Vertically, I want my labels to be 88 points high, but can be smaller in case they do not fit.
      - `V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|`
        - `@999`: Assigation of priority 999 to a given constraint.
        - `(label1)`: Make all labels the same height than _`label1`_
  - **Anchor Technology**
    - Horizontally, I want the same width as the main view. Vertically, have a height of exactly 88 points.
      - `UIView var widthAnchor: NSLayoutDimension { get }`
        - `NSLayoutDimension func constraint(equalTo anchor: NSLayoutDimension) -> NSLayoutConstraint`
    - `UIView var heightAnchor: NSLayoutDimension { get }`
      - `NSLayoutDimension func constraint(equalToConstant c: CGFloat) -> NSLayoutConstraint`
    - `UIView var topAnchor: NSLayoutYAxisAnchor { get }`
      - `class NSLayoutYAxisAnchor : NSLayoutAnchor<NSLayoutYAxisAnchor>`
        - `NSLayoutAnchor func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint`
    - I want to show labels within the _safe area_
      - `UIView var safeAreaLayoutGuide: UILayoutGuide { get }`