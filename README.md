Example code for view controller transition APIs, introduced in iOS 7.

Modal | Push
--- | ---
![modal]| ![flip] 

### Topics covered

* Present transitions: display and dismiss a simple About view modally, with a custom animation
 * Create animation controllers
 * Define key frame animations
 * Use view snapshotting for scaling views
* Navigation transitions: add custom push/pop transitions to the navigation controller
 * Create a 3D flip animation
 * Wire up animation controllers via `UINavigationControllerDelegate`
* Interactive transtitions:
 * Enable gesture-driven navigation using an interaction controller

### Resources

* [Introduction to Custom View Controller Transitions and Animations][appcoda]
* [iOS Animation Tutorial: Custom View Controller Presentation Transitions][rw]

[flip]: http://i.imgur.com/JYMJgxe.gif
[modal]: http://i.imgur.com/csajYzO.gif
[appcoda]: http://www.appcoda.com/custom-view-controller-transitions-tutorial/
[rw]: http://www.raywenderlich.com/96062/custom-view-controller-presentation-transitions-swift