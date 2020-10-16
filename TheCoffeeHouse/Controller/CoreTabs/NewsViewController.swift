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

enum newsCell {
    static let header = 0
    static let special = 1
    static let update = 2
    static let coffeelove = 3
    static let introduce = 4
    static let music = 5
}

enum TitleName {
    static let update:String = "Cập nhật từ Nhà"
    static let sale:String = "Ưu đãi đặc biệt"
    static let story:String = "#CoffeeLover"
    static let introduce:String = ""
    static let music:String = "Nhạc đang phát tại nhà"
}

class NewsViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let titlename:[String] = [" ",TitleName.sale,TitleName.update,TitleName.story,TitleName.introduce,TitleName.music]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        setUp()
        handelNotAuthenticated()
    }
    
    private func handelNotAuthenticated() {
        if true {
            // Show login
            let loginVC = LoginViewController()
            let vc = UINavigationController(rootViewController: loginVC)
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: false)
        }
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
        tableView.register(NewsHeaderTableViewCell.nib(), forCellReuseIdentifier: NewsHeaderTableViewCell.identifier)
        tableView.register(HeaderInfoTableViewCell.nib(),
                           forCellReuseIdentifier: HeaderInfoTableViewCell.identifier)
        tableView.register(NewsTableViewCell.nib(),
                           forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.register(UpdateFormHomeTableViewCell.nib(),
        forCellReuseIdentifier: UpdateFormHomeTableViewCell.identifier)
        tableView.register(CoffeeLoveTableViewCell.nib(),
        forCellReuseIdentifier: CoffeeLoveTableViewCell.identifier)
        tableView.register(IntroduceTableViewCell.nib(),
        forCellReuseIdentifier: IntroduceTableViewCell.identifier)
        tableView.register(MusicTableViewCell.nib(),
        forCellReuseIdentifier: MusicTableViewCell.identifier)
       
    }
    

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titlename.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.width/4
        }
        if indexPath.section == newsCell.introduce {
            return Height.heightRow/2
        }
        if indexPath.section == newsCell.music {
            return Height.heightRow/2
        }
        return Height.heightRow
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == newsCell.header {
            return 0
        }
        if section == newsCell.introduce {
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
        if indexPath.section == newsCell.header {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsHeaderTableViewCell.identifier,
                                                     for: indexPath) as! NewsHeaderTableViewCell
            return cell
        }
        if indexPath.section == newsCell.special {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
            return cell
        }
        if indexPath.section == newsCell.update {
            let cell = tableView.dequeueReusableCell(withIdentifier: UpdateFormHomeTableViewCell.identifier, for: indexPath) as! UpdateFormHomeTableViewCell
            return cell
        }
        if indexPath.section == newsCell.coffeelove{
            let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeLoveTableViewCell.identifier, for: indexPath) as! CoffeeLoveTableViewCell
            return cell
        }
        if indexPath.section == newsCell.introduce {
            let cell = tableView.dequeueReusableCell(withIdentifier: IntroduceTableViewCell.identifier, for: indexPath) as! IntroduceTableViewCell
            cell.introduceImage.image = UIImage(named: "introduce")
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier, for: indexPath) as! MusicTableViewCell
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.isSelected = true
        return cell
    }
    
}
