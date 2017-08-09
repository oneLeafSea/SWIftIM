//
//  MineViewController.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/24.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {
    var navigationView : UIView?
    var headView       : UIView?
    var mineData       : [String : String] = [String : String].init()
    var mineDic        : [String : [String]] = [String : [String]].init()
    var mineDetailDic  : [String : String] = [String : String].init()
    var preparDic      : NSDictionary = NSDictionary.init()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {get {return UIStatusBarStyle.lightContent}}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.view.backgroundColor = UIColor.white
        self.tableView.frame = self.view.frame
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        self.tableView.tableFooterView = UIView()
        setHeadView()
        
        getData()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar .setBackgroundImage(nil, for: UIBarMetrics.default)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getData() {
    
        mineDic = MineSysData.shareInstance.getTestDictionary()
        preparDic = NSDictionary.init(dictionary: mineDic)
        mineDetailDic = MineSysData.shareInstance.setMineDictionary()
    }
    
    ///设置tableView头部视图
    func setHeadView() {
        let head = UIView.init(frame: CGRect.init(x: 0, y: -20, width: SystemDefault.F_ScreenFrame.width, height: 240))
        let imgView = UIImageView.init(frame: head.frame)
        imgView.image = UIImage.init(named: "h4")
        head.addSubview(imgView)
        self.headView = head
        self.tableView.tableHeaderView = self.headView
        DEBUG_LogInfo(self.tableView.frame)
    }
    
  //#pragma mark scrollviewDelegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let  off_Y = scrollView.contentOffset.y
        
        //偏移量小于－64
        if (off_Y <= -20) {
            self.tableView.tableHeaderView?.alpha = 1
            self.navigationController?.navigationBar.alpha = 0
        }
        //2.当偏移量小于0且大于－64
        if (off_Y < 176 && off_Y > -20) {
            var division = (off_Y + 20)/176
            if division > 1 {division = 1 }
            self.tableView.tableHeaderView?.alpha = 1 - division
            self.navigationController?.navigationBar.alpha = division
        }
        if (off_Y >= 176) {
            self.tableView.tableHeaderView?.alpha = 0
            self.navigationController?.navigationBar.alpha = 1
        }
       
    }
    
    //#tableViewDelegate
   override func numberOfSections(in tableView: UITableView) -> Int {
        return preparDic.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr :NSArray = preparDic.allKeys as NSArray
        let str = arr.object(at: section)
        let arr_row : NSArray = preparDic.object(forKey: str) as! NSArray
        return arr_row.count
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if (indexPath == [0,0] || indexPath == [0,1]) {
            let mineSysVC = MineSystemController()
            let navC = UINavigationController.init(rootViewController: mineSysVC)
                mineSysVC.receive = indexPath 
            self.navigationController?.present(navC, animated: true, completion: nil)
        } else {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let identifier = "MineCell"
        var mineCell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (mineCell == nil) {
            mineCell = UITableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        let array: NSArray = preparDic.allKeys as NSArray
        let  mainKey = array.object(at: section) as! String
        if mainKey == "sys" {
            mineCell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
        }
        let datas : NSArray = preparDic.object(forKey: mainKey) as! NSArray
        let keyValue : String = (datas.object(at: indexPath.row) as? String)!

        mineCell?.textLabel?.text = keyValue
        mineCell?.detailTextLabel?.text = mineDetailDic[keyValue]
        return mineCell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let array: NSArray = preparDic.allKeys as NSArray
        let key : String = array.object(at: section) as! String
        return key
    }

   

}
