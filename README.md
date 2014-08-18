DynamicComponentsKit
====================

DynamicComponentsKit is a project to present possibilities of iOS 7 UIDynamics, Transitions and Interactive Transitions.

Project contains several examples of modal presentation of view controllers, interactive pop transition in navigation controller and transition between tabs in tab bar controller.

# Usage

Components are done as modules so they can be reused in different projects, however there are some requirements that have to be fulfilled. Project heavily uses storyboard to make implementation simpler and clearer but everything can be done in conventional way. Each component can be copied right from the sample project to your own project. The only thing you would like to adjust are transition animations.

Take a look at the controllers in the project. They should considered more like a hint for your own implementation, rather than ready-to-use objects.

# Components

Following components are covered by the project:
* Animators
  * Present Animator
  * Dismiss Animator
  * Push Animator
  * Pop Animator
  * Tab change Animator
* UIViewController Categories
  * Navigation transition
  * Navigation interactive pop transition
  * Modal transitioning
* Basic controllers
  * BaseViewController
  * ModalViewController
  * ModalSnappedViewController
  * NavigationBaseViewController
 
## Animators 

Animators are implementing `UIViewControllerAnimatedTransitioning` protocol. The base class is `NavigationAnimator` which has a designated initializer to pass animation duration (if not, default is 0.25s) and it implements `-transitionDuration:`. Each animator subclasses `NavigationAnimator` and implements `-animateTransition:`, which is a requirement if you want to subclass `NavigationAnimator`.

Every animator provides a custom animation for the transition in `-animateTransition:` method, so it should be implemented accordingly to your needs.

Present and Dismiss animators refers to modal transitioning. This project assumes that user will use `ModalViewController` for modal transitioning, so the dimming view and main container view are animated appropriately.

Push and Pop Animators provide animations for navigation controller transitions.

`TabChangeAnimator` provides simple cross disolve for switching between tabs (yes, it can be done natively, but the point was to show how the implementation can be done).

## Categories

Those components are categories to `UIViewController` class, so they can be used for any controller. They implements few methods what helps keeping code cleaner and allows to reuse it wherever you want.

* `UIViewController+ModalTransitioningDelegate` implements `UIViewControllerTransitioningDelegate`
* `UIViewController+NavigationTransitionDelegate` implements `UINavigationControllerDelegate`
* `UIViewController+NavigationInteractivePopGesture` provides support for interactive pop transition by handling pop gesture using `UIScreenEdgePanGestureRecognizer` and `-handlePopGesture:` action.
 
## Basic controllers

`BaseViewController` provides simple implementation of setting `UINavigationControllerDelegate` to `self` when `viewDidAppear` and `nil` on `viewDidDisappear`. 

`ModalViewController` is used for modal presentation. It keeps information about how to be presented and dismissed (PresentationMode, DismissMode). There are also outlets for `blurView` and `mainView`. The `blurView` is a dimming view (or `UIVisualEffectView` - as you wish) and is used as a background. The `mainView` is a container for your views. We've provided also `ModalSnappedViewController` which uses `UISnapBehavior` to snap `mainView` to the screen center.

`NavigationBaseViewController` provides support for interactive pop transition.


# Summary

This project presents how to implement custom transitions in iOS application. It can be considered as a demo project or base for your own application.
