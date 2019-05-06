# Storm Viewer Social App 

Extension of the Storm viewer App. Now users can share images with their friends and save images to their device’s Photo Library.


## INSTRUCTIONS

Use the iOS standard services to save to the photo library the image that is displaying on the image screen.

- activity view controller

Place de system action button on the right side of the top toolbar.

- navigation bar
- navigation item
- bar button item

Create the method shareTapped() that is called when the user presses the action button.

shareTapped(): This method will get called by the underlying Objective-C operating system.

- @objc

shareTapped(): convert the image from the image screen to JPEG format with a compression quality of 80%.

- image view
- image

shareTapped(): Create an activity view controller to share content with other apps and services and tell iOS that it should be anchored to the right bar button Item of our navigation item.

- activity view controller
- navigation item
- right bar button item

Show a message asking whether the user is OK with the app writing to their Photo Library.

- Info.plist file

## CHALLENGE 3A

Add the image name to the list of items that are shared. 

- activity view controller
- arrays