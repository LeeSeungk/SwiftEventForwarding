//
//  ViewController.swift
//  CustomDialog
//
//  Created by Jeff Jeong on 2020/06/07.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var showPopUpBtn: UIButton!
    
    @IBOutlet weak var myWebView: WKWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - IBActions
    @IBAction func showCustomPopUp(_ sender: UIButton) {
            let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
            let alertPopUpVC = storyboard.instantiateViewController(identifier: "AlertPopUpVC") as AlertPopUpViewController
            alertPopUpVC.modalPresentationStyle = .overCurrentContext
            alertPopUpVC.modalTransitionStyle = .crossDissolve
        
            alertPopUpVC.subscribeBtnClickedCompletionClosure = {
                print("컴플레션 블럭이 호출 되었다.")
                
                let scannedUrl = URL(string: "https://www.youtube.com/channel/UCutO2H_AVmWHbzvE92rpxjA?view_as=subscriber")
                self.myWebView.load(URLRequest(url: scannedUrl!))
                
            }
        
            self.present(alertPopUpVC, animated: true, completion: nil)
       }
    


}

