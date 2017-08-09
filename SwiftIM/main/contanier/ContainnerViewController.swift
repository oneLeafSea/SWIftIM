//
//  ContainnerViewController.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/26.
//  Copyright © 2017年 rooten. All rights reserved.
//

import UIKit

class ContainnerViewController: UITableViewController , UISearchBarDelegate {

    @IBOutlet weak var serchBar: UISearchBar!
    
    var containerDic : [String : [Any]] = [String : [Any]].init()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        serchBar.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //scrollViewDelegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let off_Y = scrollView.contentOffset.y
        DEBUG_LogInfo(off_Y)
    }
    
    //tabelViewdelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //searchbarDelegate
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
