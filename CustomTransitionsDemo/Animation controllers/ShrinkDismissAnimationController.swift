//
//  ShrinkDismissAnimationController.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 08/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class ShrinkDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrame = transitionContext.finalFrameForViewController(toViewController)
        
        let containerView = transitionContext.containerView()
        
        // toVC will not move during the transition
        toViewController.view.frame = finalFrame
        toViewController.view.alpha = 0.5
        
        // Move toVC back in the hierarchy
        containerView.addSubview(toViewController.view)
        containerView.sendSubviewToBack(toViewController.view)
        
        // 1. Determine the intermediate and final frame for the from view
        let screenBounds = UIScreen.mainScreen().bounds
        let shrunkenFrame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.width / 4, fromViewController.view.frame.height / 4)
        let fromFinalFrame = CGRectOffset(shrunkenFrame, 0, screenBounds.size.height)
        
        let duration = transitionDuration(transitionContext)
        
        // 2/a. Create a snapshot
        let intermediateView = fromViewController.view.snapshotViewAfterScreenUpdates(false)
        intermediateView.frame = fromViewController.view.frame
        containerView.addSubview(intermediateView)
        
        // 2/b. Remove the real view
        fromViewController.view.removeFromSuperview()
        
        // 3. Animate with keyframes
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModeCubic,
            animations: {
                // 3/a. Keyframe 1:
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                    intermediateView.frame = shrunkenFrame
                    toViewController.view.alpha = 0.5
                })
                
                // 3/b. Keyframe 2:
                UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5, animations: {
                    intermediateView.frame = fromFinalFrame
                    toViewController.view.alpha = 1.0
                })
            },
            completion: { _ in
                intermediateView.removeFromSuperview()
                transitionContext.completeTransition(true)
        })
    }
}
