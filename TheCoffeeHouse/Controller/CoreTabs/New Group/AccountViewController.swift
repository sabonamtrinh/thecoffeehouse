//
//  AccountViewController.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/14/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    private let tableView: UITableView = {
        let tb = UITableView()
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configureModels()
    }
    
    private var models = [AccountViewType]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: view.width,
                                 height: view.height)
    }
    private func setUp(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(AccountTableViewCell.nib(), forCellReuseIdentifier: AccountTableViewCell.identifer)
    }
    
    private func configureModels(){
        models.append(AccountViewType(nameimage: "star",
                                      text: "The Coffee House Rewards"))
        models.append(AccountViewType(nameimage: "people",
                                      text: "Thông tin tài khoản"))
        models.append(AccountViewType(nameimage: "music",
                                      text: "Nhạc đang phát"))
        models.append(AccountViewType(nameimage: "history",
                                      text: "Lịch sử"))
        models.append(AccountViewType(nameimage: "help",
                                      text: "Giúp đỡ"))
        models.append(AccountViewType(nameimage: "setting",
                                      text: "Cài đặt"))
        models.append(AccountViewType(nameimage: "",
        text: "Đăng xuất"))
    }
    
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifer, for: indexPath) as? AccountTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(image: models[indexPath.section].nameimage , label: models[indexPath.section].text)
        return cell
    }
    
    
}
