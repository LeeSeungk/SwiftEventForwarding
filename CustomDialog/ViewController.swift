//
//  ViewController.swift
//  CustomDialog
//
//  Created by Jeff Jeong on 2020/06/07.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit
import WebKit


let notificationName = "btnClickNotification"

class ViewController: UIViewController,PopUpDelegate {
    
    

    @IBOutlet weak var showPopUpBtn: UIButton!
    
    @IBOutlet weak var myWebView: WKWebView!
   
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPopUpBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        
        // 노티피케이션 이라는 방송 수신기를 장착한다
        NotificationCenter.default.addObserver(self, selector: #selector(loadnotion), name: NSNotification.Name(notificationName), object: nil)
    }
    
    @objc fileprivate func loadnotion(){
        print("ViewController - loadnotion()")
        let notionUrl = URL(string: "https://www.notion.so/product?utm_source=google&utm_campaign=10805039169&utm_medium=104440699817&utm_content=455555244419&utm_term=%EB%85%B8%EC%85%98&targetid=aud-840164194020:kwd-827502875973&gclid=Cj0KCQjwjvaYBhDlARIsAO8PkE2cvvPCa0SyqpyF2pFtbGHiSmr6Vbb_4jblYaXqgAmbr5luQn2G-jEaAhK3EALw_wcB")
        self.myWebView.load(URLRequest(url: notionUrl!))
        showPopUpBtn.isHidden = true
    }
    
    
    //MARK: - IBActions
    @IBAction func showCustomPopUp(_ sender: UIButton) {
            let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
            let alertPopUpVC = storyboard.instantiateViewController(identifier: "AlertPopUpVC") as AlertPopUpViewController
            alertPopUpVC.modalPresentationStyle = .overCurrentContext
            alertPopUpVC.modalTransitionStyle = .crossDissolve
        
            alertPopUpVC.jeongdaeriBtnClickedCompletionClosure = {
                print("컴플레션 블럭이 호출 되었다.")
                
                let scannedUrl = URL(string: "https://www.youtube.com/@dev_jeongdaeri")
                self.myWebView.load(URLRequest(url: scannedUrl!))
                self.showPopUpBtn.isHidden = true
            }
        
        alertPopUpVC.githubBtnClickedCompletionClosure  = {
            print("컴플레션 블럭이 호출되었다.")
            
            let scannedUrl = URL(string: "https://github.com/")
            self.myWebView.load(URLRequest(url: scannedUrl!))
            self.showPopUpBtn.isHidden = true
        }
        
        alertPopUpVC.myPopUpDelegate = self
        
            self.present(alertPopUpVC, animated: true, completion: nil)
       }
    
    //MARK: PopUpDelegate
    func onOpenNomad() {
        print("ViewController - nomadBtnClicked() called")
        let channelUrl = URL(string: "https://nomadcoders.co/?gad=1&gclid=CjwKCAjwjYKjBhB5EiwAiFdSfu5eh6zx7WHzW_1durlQtq13HYWFrwgQbFEWE-o44FRI24IxsrYHWRoCUMAQAvD_BwE")
        self.myWebView.load(URLRequest(url: channelUrl!))
        self.showPopUpBtn.isHidden = true
    }
    
    

}

