//
//  ViewController.swift
//  SloppyPractice
//
//  Created by MAPSSI on 2016. 12. 13..
//  Copyright © 2016년 MAPSSI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segueAction(_ sender: UIButton) {
        performSegue(withIdentifier: "segueSloppy", sender: self)
    }

}

