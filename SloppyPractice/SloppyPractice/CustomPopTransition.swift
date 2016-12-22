//
//  CustomPopTransition.swift
//  SloppyPractice
//
//  Created by MAPSSI on 2016. 12. 13..
//  Copyright © 2016년 MAPSSI. All rights reserved.
//

import UIKit

class CustomPopTransition : NSObject {
    
}

extension CustomPopTransition : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        
        let containerView = transitionContext.containerView
        containerView.addSubview((toVC?.view)!)
        containerView.bringSubview(toFront: (fromVC?.view)!)
        
        toVC?.view.frame = transitionContext.finalFrame(for: toVC!)
        
        let dimmingView = UIView(frame: CGRect(x:0,y:0,width: toVC!.view.frame.width, height: toVC!.view.frame.height))
            dimmingView.backgroundColor = UIColor.clear
            dimmingView.alpha = 0.5
        
        toVC?.view.addSubview(dimmingView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveLinear, animations: {
            dimmingView.alpha = 0.0
            fromVC?.view.frame = CGRect(x: (toVC?.view.frame.size.width)!, y: (fromVC?.view.frame.origin.y)!, width: (fromVC?.view.frame.size.width)!, height: (fromVC?.view.frame.size.height)!)
            }, completion: { finished in
                dimmingView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        
        
    }
}
