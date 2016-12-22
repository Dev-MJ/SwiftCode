//
//  Interactor.swift
//  ModalDragClose
//
//  Created by MAPSSI on 2016. 11. 28..
//  Copyright © 2016년 MAPSSI. All rights reserved.
//

import UIKit


class Interactor : UIPercentDrivenInteractiveTransition {
//UIPercentDrivenInteractiveTransition : as like scrub bar of the video player. it can track the animationprogress to a certain position.
    
    var hasStarted = false  // this tracks whether user interaction is in progress
    var shouldFinish = false    // this determines whether the transition should finish what it's doing or roll back
}
