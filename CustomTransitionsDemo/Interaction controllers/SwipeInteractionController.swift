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
        
        // 0. Maintain the gesture progress.
        let translation = gestureRecognizer.translationInView(gestureRecognizer.view!.superview!)
        var progress = (translation.x / 200)
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))
        
        switch gestureRecognizer.state {
            
        case .Began:
            // 1. Start the interactive transition
            interactionInProgress = true
            navigationController.popViewControllerAnimated(true)
            
        case .Changed:
            // 2. Should we complete?
            shouldCompleteTransition = progress > 0.5
            
            // 3. Update the animation
            updateInteractiveTransition(progress)
            
        case .Cancelled:
            // 4. Handle possible cancellation
            interactionInProgress = false
            cancelInteractiveTransition()
            
        case .Ended:
            // 5. If we didn't drag far enough, we should cancel
            interactionInProgress = false
            
            if !shouldCompleteTransition  {
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
