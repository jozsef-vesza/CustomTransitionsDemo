//
//  FlipAnimationController.swift
//  CustomTransitionsDemo
//
//  Created by Vesza Jozsef on 08/06/15.
//  Copyright (c) 2015 József Vesza. All rights reserved.
//

import UIKit

class FlipAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var reverse = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // 1. Setup
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let containerView = transitionContext.containerView()
        containerView.addSubview(toView)
        
        // 2. Add a perspective transform
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        containerView.layer.sublayerTransform = transform
        
        // 3. Both views start from the same frame
        let initialFrame = transitionContext.initialFrameForViewController(fromVC)
        fromView.frame = initialFrame
        toView.frame = initialFrame
        
        // 4. Reverse?
        let factor = reverse ? 1.0 : -1.0
        
        // 5. Hide `toView` by flipping it halfway round
        toView.layer.transform = yRotation(factor * -M_PI_2)
        
        // 6. Animate
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModeCubic,
            animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: {
                    // 7. Rotate `fromView`
                    fromView.layer.transform = self.yRotation(factor * M_PI_2)
                })
                
                UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5, animations: {
                    // 8. Rotate `toView`
                    toView.layer.transform = self.yRotation(0.0)
                })
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
    
    private func yRotation(angle: Double) -> CATransform3D {
        return CATransform3DMakeRotation(CGFloat(angle), 0.0, 1.0, 0.0)
    }
}
