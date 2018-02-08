//
//  SZMainListViewController.swift
//  SZ_RxSwift_SimpleDemo
//
//  Created by yanl on 2018/2/8.
//  Copyright © 2018年 yanl. All rights reserved.
//

import UIKit

// 定义全局常量，尽量使用private修饰，否则到处都可以访问
private let cellId = "cellId"

class SZMainListViewController: UITableViewController {

    /// 数据数组
    private lazy var dataList = ["简单测试", "初步应用"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "RxSwift DEMO"
        
        // 注册原型 cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView.init()
    }
}

/// MARK: - 表格数据源方法，具体的数据源方法
extension SZMainListViewController {
    
    // 重写父类方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1.取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        // 2.设置cell
        cell.textLabel?.text = dataList[indexPath.row]
        
        // 3.返回cell
        return cell
    }
}

/// MARK: - 表格代理方法
extension SZMainListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        forward(index: indexPath.row)
    }
}

/// MARK: - 私有方法
extension SZMainListViewController {
    
    private func forward(index: NSInteger) {
        
        switch index {
            
        case 0:
            
            navigationController?.pushViewController(SZSimpleTestViewController(), animated: true)
            
            break
            
        default:
            
            break
        }
    }
}















