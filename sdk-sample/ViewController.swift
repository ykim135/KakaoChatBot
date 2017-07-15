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
   
    @IBAction func actKakaoLink(sender: AnyObject) {
        let label = KakaoTalkLinkObject.createLabel("Test Label")
        let image = KakaoTalkLinkObject.createImage(
            "https://developers.kakao.com/assets/img/link_sample.jpg",
            width : 130,
            height : 80
        )
        let webLink = KakaoTalkLinkObject.createWebLink("Test Link", url: "http://www.kakao.com")
        let androidAppAction = KakaoTalkLinkAction.createAppAction(
            KakaoTalkLinkActionOSPlatform.android,
            devicetype: KakaoTalkLinkActionDeviceType.phone,
            execparam: ["test1":"test1", "test2":"test2"]
        )
        let iphoneAppAction = KakaoTalkLinkAction.createAppAction(
            KakaoTalkLinkActionOSPlatform.IOS,
            devicetype: KakaoTalkLinkActionDeviceType.phone,
            execparam: ["test1":"test1", "test2":"test2"]
        )
        let ipadAppAction = KakaoTalkLinkAction.createAppAction(
            KakaoTalkLinkActionOSPlatform.IOS,
            devicetype: KakaoTalkLinkActionDeviceType.pad,
            execparam: ["test1":"test1", "test2":"test2"]
        )
        let appLink = KakaoTalkLinkObject.createAppButton(
            "Test Button",
            actions: [androidAppAction!, iphoneAppAction!, ipadAppAction!]
        )
        
        if KOAppCall.canOpenKakaoTalkAppLink() {
            KOAppCall.openKakaoTalkAppLink([label!, image!, webLink!, appLink!])
        } else {
            print("cannot open kakaotalk.")
        }
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

