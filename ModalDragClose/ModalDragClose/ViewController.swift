//
//  ViewController.swift
//  ModalDragClose
//
//  Created by MAPSSI on 2016. 11. 28..
//  Copyright © 2016년 MAPSSI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let interactor = Interactor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func modalActioin(_ sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ModalVC = storyboard.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
            ModalVC.transitioningDelegate = self
            ModalVC.interactor = interactor
        
        self.present(ModalVC, animated: true, completion: nil)
    }

}


extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    
    // determines whether the animation goes into interactive mode. When the user is panning, the interactor is returned. But if the user taps the close button, the normal animation is played out
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
