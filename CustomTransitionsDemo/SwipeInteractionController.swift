//
//  SwipeInteractionController.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 08/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class SwipeInteractionController: UIPercentDrivenInteractiveTransition {
    
    var interactionInProgress = false
    
    var speedOfCompletion: CGFloat {
        return 1 - percentComplete
    }
    
    private var shouldCompleteTransition = false
    private var navigationController: UINavigationController!
    
    
    func wireToViewController(viewController: UIViewController!) {
    
        navigationController = viewController.navigationController
        prepareGestureRecognizerInView(viewController.view)
    }
    
    func handleGesture(gestureRecognizer: UIPanGestureRecognizer) {
    
        let translation = gestureRecognizer.translationInView(gestureRecognizer.view!.superview!)
        
        switch gestureRecognizer.state {
        
        case .Began:
            // 1. Start the interactive transition
            interactionInProgress = true
            navigationController.popViewControllerAnimated(true)
            
        case .Changed:
            // 2. Compute the current position
            var fraction = (translation.x / 200)
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
            
            // 3. Should we complete?
            shouldCompleteTransition = fraction > 0.5
            
            // 4. Update the animation
            updateInteractiveTransition(fraction)
            
        case .Ended, .Cancelled where !shouldCompleteTransition || gestureRecognizer.state == .Cancelled:
            // 5. Finish or cancel
            interactionInProgress = false
            
            if !shouldCompleteTransition || gestureRecognizer.state == .Cancelled {
                cancelInteractiveTransition()
            } else {
                finishInteractiveTransition()
            }
            
        default:
            println("Unsupported")
        }
    }
    
    private func prepareGestureRecognizerInView(view: UIView) {
        
        let gesture = UIPanGestureRecognizer(target: self, action: "handleGesture:")
        view.addGestureRecognizer(gesture)
    }
}
