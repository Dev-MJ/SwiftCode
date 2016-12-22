//
//  DismissAnimator.swift
//  ModalDragClose
//
//  Created by MAPSSI on 2016. 11. 28..
//  Copyright © 2016년 MAPSSI. All rights reserved.
//

import UIKit

class DismissAnimator : NSObject {
    
    
    
}


extension DismissAnimator : UIViewControllerAnimatedTransitioning {
    
    //how long animation is
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    //actual animation.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //fromVC : represent ModelVC. main actor of this show
        //toVC : parent VC. sits behind the modal.
        //containerView : the device window or stage on which the animation plays
        if let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) , let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) {
            
            toVC.view.backgroundColor = UIColor.red
            fromVC.view.backgroundColor = UIColor.green
            let containerView = transitionContext.containerView
                containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
                containerView.backgroundColor = UIColor.yellow
            
            
            
            /* fromVC downward by one screen length */
            let screenBounds = UIScreen.main.bounds
            let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)    // first, create on the bottom left corner of the screen.
            let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)  // testination frame of the modal. one screen length below the viewable area.
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {fromVC.view.frame = finalFrame}, completion: { _ in transitionContext.completeTransition(!transitionContext.transitionWasCancelled)})
            
        }
        
    }
}
