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
                                      text: "The Coffee House Rewards") { [weak self] in
                                        self?.didTapRewards() })
        models.append(AccountViewType(nameimage: "people",
                                      text: "Thông tin tài khoản") { [weak self] in
                                        self?.didTapInfomation() })
        models.append(AccountViewType(nameimage: "music",
                                      text: "Nhạc đang phát")  { [weak self] in
                                        self?.didTapMusic() })
        models.append(AccountViewType(nameimage: "history",
                                      text: "Lịch sử")  { [weak self] in
                                        self?.didTapHistory() })
        models.append(AccountViewType(nameimage: "help",
                                      text: "Giúp đỡ"){ [weak self] in
                                        self?.didTapHelp() })
        models.append(AccountViewType(nameimage: "setting",
                                      text: "Cài đặt") { [weak self] in
                                        self?.didTapSetting() })
        models.append(AccountViewType(nameimage: "",
                                      text: "Đăng xuất") { [weak self] in
                                        self?.didTapLogOut() })
    }
    
    private func didTapRewards(){ }
    private func didTapInfomation(){ }
    private func didTapMusic(){ }
    private func didTapHistory(){ }
    private func didTapHelp(){ }
    private func didTapSetting(){ }
    
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Log Out",
                                      message: "Are you sure you want to log out",
                                      preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out",
                                            style: .destructive,
                                            handler: { _ in
                AuthManager.shared.logOut(completion: { success in
                    DispatchQueue.main.async {
                        if success {
                            // persent log in
                            let loginVC = LoginViewController()
                            let vc = UINavigationController(rootViewController: loginVC)
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc,animated: false)
                        }
                        else {
                            // error
                            fatalError("Could not log out user")
                        }
                    }
                })
            }))
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true)
    }

}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section].handel()
    }
    
}
