//
//  ViewController.swift
//  sdk-sample
//
//  Created by Yoon Ung Kim on 15/07/2017.
//  Copyright © 2017 Yoon Ung Kim. All rights reserved.
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
    
    @IBAction func loginKakao(_ sender: UIButton) {
        let session = KOSession.shared()
        
        if let s = session {
            if s.isOpen() {
                s.close()
            }
            
            s.open(completionHandler: { (error) in
                if error == nil {
                    print ("No error")
                    
                    if s.isOpen() {
                        print("Success")
                    }
                    else {
                        print("Fail")
                    }
                }
                else {
                    print("Error login: \(error!)")
                }
            })
        }
        else {
            print("Something wrong")
        }
    }
}

