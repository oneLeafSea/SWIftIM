//
//  LoginViewController.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/20.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var uLoginField: UITextField!
    
    @IBOutlet weak var pLoginField: UITextField!
    
    @IBOutlet weak var curVersion: UILabel!
    
    @IBOutlet weak var enterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resignKeyBoard()
        
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        curVersion.text = "版本号：\(version)"
        
        uLoginField.returnKeyType   = UIReturnKeyType.next
        uLoginField.clearButtonMode = UITextFieldViewMode.whileEditing
        pLoginField.returnKeyType   = UIReturnKeyType.done
        pLoginField.clearButtonMode = UITextFieldViewMode.whileEditing
        uLoginField.delegate = self
        pLoginField.delegate = self
        
        enterBtn.isEnabled = false
        enterBtn.addTarget(self, action: #selector(enterBtnTapped(sender:)), for: UIControlEvents.touchUpInside)
    }
    @IBAction private func TextField_DidEndOnExit(_ sender: AnyObject) {
        uLoginField.resignFirstResponder()
        pLoginField.becomeFirstResponder()
        
    }
    @IBAction func PTextField_DidEndOnExit(_ sender: AnyObject) {
        pLoginField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {enterBtn.isEnabled = false}
        else
        {
            if (CheckItem.enterFormatCheck(name: textField.text!) == true)
            {
                enterBtn.isEnabled = true
                
            }
            else
            {
                textField.text = ""
            }
        }
    }
    
    func resignKeyBoard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShowHandle(noti:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHidehandle(noti:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func keyBoardWillShowHandle(noti:Notification)
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.view.frame.origin.y = -150
        })
 
    }
    
    
    func keyBoardWillHidehandle(noti:Notification)
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.view.frame.origin.y = 0
        })

    }
    
    func enterBtnTapped(sender:UIButton)
    {
        
        UserDefaults.standard.set(uLoginField.text, forKey:UserDefault.login_name)
        UserDefaults.standard.set(pLoginField.text, forKey: UserDefault.login_pwd)
        
        let mainVc = MainViewController()
        
        DEBUG_LogInfo(mainVc)
        
        self.present(mainVc, animated: true, completion: {
            
        });
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event:      UIEvent?) {
        
            uLoginField.resignFirstResponder()
            pLoginField.resignFirstResponder()
          
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    
    
       
    
    
    
    
}
