//
//  ViewController.swift
//  ICResourceKit
//
//  Created by IvanChan on 01/25/2018.
//  Copyright (c) 2018 IvanChan. All rights reserved.
//

import UIKit
import ICFoundation

extension String {
    public func isValidUrl() -> Bool {
        return true
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "asd"
        print("ret = \(url.isValidUrl())")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

