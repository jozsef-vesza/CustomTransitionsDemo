//
//  BounceAnimationController.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 04/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class BounceAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // 1. Obtain the state from the context
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrame = transitionContext.finalFrameForViewController(toViewController)
        
        // 2. Obtain the container view
        let containerView = transitionContext.containerView()
        
        // 3. Set the initial state
        let screenBounts = UIScreen.mainScreen().bounds
        toViewController.view.frame = CGRectOffset(finalFrame, 0, screenBounts.size.height)
        
        // 4. Add the view
        containerView.addSubview(toViewController.view)
        
        // 5. Animate
        let duration = transitionDuration(transitionContext)
        
        UIView.animateWithDuration(
            duration,
            delay: 0.0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.0,
            options: .CurveLinear,
            animations: {
                fromViewController.view.alpha = 0.5
                toViewController.view.frame = finalFrame
                
            }, completion: { _ in
                fromViewController.view.alpha = 1.0
                transitionContext.completeTransition(true)
        })
    }
}
