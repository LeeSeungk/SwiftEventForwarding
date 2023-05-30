//
//  AlertPopUpViewController.swift
//  CustomDialog
//
//  Created by Jeff Jeong on 2020/06/07.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit

class AlertPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    
    @IBOutlet weak var githubBtn: UIButton!
    @IBOutlet weak var notionBtn: UIButton!
    @IBOutlet weak var jeongdaeriBtn: UIButton!
    @IBOutlet weak var nomadCoderBtn: UIButton!
    
    
    
    
    var jeongdaeriBtnClickedCompletionClosure: (() -> Void)?
    var githubBtnClickedCompletionClosure: (() -> Void)?
    var myPopUpDelegate: PopUpDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("AlertPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        jeongdaeriBtn.layer.cornerRadius = 10
        nomadCoderBtn.layer.cornerRadius = 10
        
    }
    

    
    
    //MARK: - IBActions
    
    @IBAction func onBgViewClicked(_ sender: UIView){
        print("AlertPopUpViewController - onBgViewClicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func jeongdaeriBtnClicked(_ sender: UIButton) {
        print("AlertPopUpViewController - jeongdaeriBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let jeongdaeriBtnClickedCompletionClosure =
            jeongdaeriBtnClickedCompletionClosure {
            jeongdaeriBtnClickedCompletionClosure()
        }
    }
    
    
    @IBAction func nomadBtnClicked(_ sender: UIButton) {
        print("AlertPopUpViewController - nomadBtnClicked() called")
        self.dismiss(animated: true,completion: nil)
        //델리게이트 패턴
        myPopUpDelegate?.onOpenNomad()
    }
    
    
    @IBAction func notionBtnClicked(_ sender: UIButton) {
        print("AlertPopUpViewController - notionBtnClicked() called")
        NotificationCenter.default.post(name: Notification.Name(notificationName), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func githubBtnClicked(_ sender: UIButton) {
        print("AlertPopUpViewController - githubBtnClicked() called")
        self.dismiss(animated: true)
        
        if let githubBtnClickedCompletionClosure =
            githubBtnClickedCompletionClosure {
            githubBtnClickedCompletionClosure()
        }
    }
    
    
    
    
    
}
