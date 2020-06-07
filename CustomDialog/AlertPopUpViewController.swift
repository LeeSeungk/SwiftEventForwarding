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
    @IBOutlet weak var subscribeBtn: UIButton!
    
    
    var subscribeBtnClickedCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("AlertPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10

    }
    

    
    
    //MARK: - IBActions
    
    @IBAction func onBgViewClicked(_ sender: UIView){
        print("AlertPopUpViewController - onBgViewClicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        
        print("AlertPopUpViewController - onSubscribeBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출 
        if let subscribeBtnClickedCompletionClosure = subscribeBtnClickedCompletionClosure {
            subscribeBtnClickedCompletionClosure()
        }
        
    }
    
    
}
