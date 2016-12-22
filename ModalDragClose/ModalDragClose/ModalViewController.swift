//
//  ModalViewController.swift
//  ModalDragClose
//
//  Created by MAPSSI on 2016. 11. 28..
//  Copyright © 2016년 MAPSSI. All rights reserved.
//

import UIKit

class ModalViewController : UIViewController {
    
    var interactor : Interactor? = nil  //parentVC will pass in this object
    
    @IBAction func closeAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        
        let percentThreshold : CGFloat = 0.3    //how far down the user has to drag in order to trigger the modal dismissal.
        
        //convert y-position to downward pull progress
        let translation = sender.translation(in: view)  //this converts the pan gesture coordinate to the modalVC's coordinate space
        let verticalMovement = translation.y / view.bounds.height   //this converts the vertical distance to percentage
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)  // this captures movement in the downward direction.
        let downwardMovementPercent = fminf(downwardMovement, 1.0)  //this caps the percentage to a maximum of 100%
        let progress = CGFloat(downwardMovementPercent)
        
        
        guard interactor != nil else { return }
        
        switch sender.state {
        case .began:    //user began dragging the modal.
            interactor?.hasStarted = true
            dismiss(animated: true, completion: nil)
        case .changed:      //animation progress is set to a percentage based on how far the user dragged.
            interactor?.shouldFinish = progress > percentThreshold
            interactor?.update(progress)
        case .cancelled:    //gesture is cancelled.
            interactor?.hasStarted = false
            interactor?.cancel()
        case .ended:    //shouldFinish is based on whether the user dragged far enough to cross the threshold.
            interactor?.hasStarted = false
            (interactor?.shouldFinish)! ? interactor?.finish() : interactor?.cancel()
        default:
            break
        }
    }
    
    
}
