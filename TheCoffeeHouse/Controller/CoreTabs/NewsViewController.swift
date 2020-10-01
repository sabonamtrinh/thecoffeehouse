//
//  DemoViewController.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/17/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit
import RealmSwift

enum Height {
    static let heightRow:CGFloat = 330
    static let heightHeaderNews:CGFloat = 140
    static let heightHeaderCell:CGFloat = 30
}

enum TitleName {
    static let update:String = "Cập nhật từ Nhà"
    static let sale:String = "Ưu đãi đặc biệt"
    static let story:String = "#CoffeeLover"
}

class NewsViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let titlename:[String] = [" ",TitleName.sale,TitleName.update,TitleName.story]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        setUp()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
    }
    private func setUp(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        //tableView.register(NewsHeaderTableViewCell.self, forCellReuseIdentifier: NewsHeaderTableViewCell.identifier)
        tableView.register(NewsHeaderTableViewCell.nib(), forCellReuseIdentifier: NewsHeaderTableViewCell.identifier)
        tableView.register(HeaderInfoTableViewCell.nib(),
                           forCellReuseIdentifier: HeaderInfoTableViewCell.identifier)
        tableView.register(NewsTableViewCell.nib(),
                           forCellReuseIdentifier: NewsTableViewCell.identifier)
       
    }
    

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.width/4
        }
        return Height.heightRow
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return Height.heightHeaderCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderInfoTableViewCell.identifier) as? HeaderInfoTableViewCell else {
            return UITableViewCell()
        }
        cell.setTitleHeader(title: titlename[section])
        return cell
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsHeaderTableViewCell.identifier,
                                                     for: indexPath) as! NewsHeaderTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        return cell
    }
    
    
}
