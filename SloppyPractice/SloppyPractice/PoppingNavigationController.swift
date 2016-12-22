//
//  PoppingNavigationController.swift
//  SloppyPractice
//
//  Created by MAPSSI on 2016. 12. 13..
//  Copyright © 2016년 MAPSSI. All rights reserved.
//

import UIKit

class PoppingNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    var interactivePopTransition: UIPercentDrivenInteractiveTransition!
    
    override func viewDidLoad() {
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        addPanGesture(viewController: viewController)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return CustomPopTransition()
        }else{
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController.isKind(of: CustomPopTransition.self) {
            return interactivePopTransition
        }else{
            return nil
        }
    }
    
    func addPanGesture(viewController: UIViewController){
        let popRecognizer = UIPanGestureRecognizer(target: self, action: #selector(PoppingNavigationController.handlePanRecognizer(recognizer:)))
        viewController.view.addGestureRecognizer(popRecognizer)
    }
    
    func handlePanRecognizer(recognizer: UIPanGestureRecognizer) {
        var progress = recognizer.translation(in: self.view).x / self.view.bounds.size.width
        progress = min(1, max(0,progress))
        if recognizer.state == .began {
            self.interactivePopTransition = UIPercentDrivenInteractiveTransition()
            self.popViewController(animated: true)
        }else if recognizer.state == .changed {
            interactivePopTransition.update(progress)
        }else if recognizer.state == .ended || recognizer.state == .cancelled {
            
            if progress > 0.5 {
                interactivePopTransition.finish()
            }else{
                interactivePopTransition.cancel()
            }
            interactivePopTransition = nil
            
        }
    }
    
}
