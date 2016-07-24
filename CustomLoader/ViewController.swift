//
//  ViewController.swift
//  CustomLoader
//
//  Created by CompuCharm Studios on 24/07/16.
//  Copyright © 2016 CompuCharm Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var customProgressView = CustomProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addProgress()
    }
    
    
    func addProgress() {
        customProgressView = CustomProgressView(frame: CGRect(x: 0, y:100, width: UIScreen.mainScreen().bounds.size.width, height:  250))
        view.addSubview(customProgressView)
    }
}

