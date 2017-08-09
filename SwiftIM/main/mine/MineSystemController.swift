//
//  MineSystemController.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/26.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class MineSystemController: UIViewController {
    
    
    var receive : IndexPath?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
        addView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "return", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pushLastView(sender:)))
    }
    
    func pushLastView(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func addView() {
        let allViews = Bundle.main.loadNibNamed("SetView", owner: nil, options: nil)
        let setView : UIView = allViews?.last as! UIView
        self.view.addSubview(setView)
        setSubViews(view: setView)
    }
    
    func setSubViews(view: UIView) {
        let view_1 : UITextField = view.viewWithTag(10001)! as! UITextField
        let view_2 : UITextField = view.viewWithTag(10002)! as! UITextField
        let view_3 : UIButton = view.viewWithTag(10003)! as! UIButton
        
        view_1.returnKeyType = UIReturnKeyType.next
        view_2.returnKeyType = UIReturnKeyType.done
        view_3.addTarget(self, action: #selector(btnTapped(sender:)), for: UIControlEvents.touchUpInside)
    }
    
    func btnTapped(sender:UIButton) {
        
    }
    

}
