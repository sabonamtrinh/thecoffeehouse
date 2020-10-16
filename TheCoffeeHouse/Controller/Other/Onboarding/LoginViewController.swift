//
//  LoginViewController.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/14/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "pattern"))
        backgroundImageView.contentMode = .scaleAspectFill
        header.addSubview(backgroundImageView)
        return header
    }()

    private let welcome1Label: UILabel = {
        let label = UILabel()
        label.isHighlighted = true
        label.font = UIFont(name: "Helvetica Neue", size: 30.0)
        label.numberOfLines = 1
        label.text = "Chào bạn,"
        return label
    }()
    
    
    private let welcome2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 15.0)
        label.numberOfLines = 1
        label.text = "Nhập số điện thoại để tiếp tục"
        return label
    }()
    
    private let suggestionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 15.0)
        label.numberOfLines = 1
        label.contentMode = .center
        label.text = "Hoặc đăng nhập bằng"
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Số điện thoại"
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let countryButton: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.setImage(UIImage(named: "vietnam"), for: .normal)
        return btn
    }()
    
    private let facebookButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Facebook", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private let emailButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Email", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private let appleButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Đăng nhập bằng Apple", for: .normal)
        btn.backgroundColor = .secondarySystemBackground
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.layer.masksToBounds = true
        btn.layer.borderWidth = 1.0
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private let otherButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Bỏ qua", for: .normal)
        btn.setTitleColor(.secondaryLabel, for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.isNavigationBarHidden = false
        addSubViews()
        phoneNumberTextField.addTarget(self,
                                       action: #selector(clicktextfield),
                                       for: .touchDown)
        countryButton.addTarget(self,
                                action: #selector(handelCountryButton),
                                for: .touchUpInside)
        facebookButton.addTarget(self,
                                action: #selector(handelFaceBookButton),
                                for: .touchUpInside)
        emailButton.addTarget(self,
                                action: #selector(handelEmailButton),
                                for: .touchUpInside)
        appleButton.addTarget(self,
                                action: #selector(handelAppleButton),
                                for: .touchUpInside)
        otherButton.addTarget(self,
                              action: #selector(handelOtherButton), for: .touchUpInside)
        phoneNumberTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x: 0,
                                  y: view.top + 50,
                                  width: view.width,
                                  height: view.height/4.0)
        welcome1Label.frame = CGRect(x: 25,
                                     y: headerView.bottom+20,
                                     width: view.width,
                                     height: 40)
        welcome2Label.frame = CGRect(x: 25,
                                     y: welcome1Label.bottom+5,
                                     width: view.width,
                                     height: 20)
        countryButton.frame = CGRect(x: 25,
                                     y: welcome2Label.bottom+20,
                                     width: 70,
                                     height: 52)
        phoneNumberTextField.frame = CGRect(x: countryButton.right + 20,
                                     y: welcome2Label.bottom+20,
                                     width: view.width - countryButton.width - 60,
                                     height: 52)
        suggestionsLabel.frame = CGRect(x: 140,
                                        y: phoneNumberTextField.bottom + 180 ,
                                        width: 170,
                                        height: 50)
        facebookButton.frame = CGRect(x: 25,
                                      y: suggestionsLabel.bottom + 10 ,
                                      width: view.width/2 - 50,
                                      height: 52)
        emailButton.frame = CGRect(x: facebookButton.right + 50,
                                   y: suggestionsLabel.bottom + 10 ,
                                   width: view.width/2 - 50,
                                   height: 52)
        appleButton.frame = CGRect(x: 25,
                                   y: facebookButton.bottom + 10 ,
                                   width: view.width - 50,
                                   height: 52)
        otherButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 50,
                                   width: view.width - 20,
                                   height: 50)
        
    }
    
    private func addSubViews(){
        view.addSubview(headerView)
        view.addSubview(welcome1Label)
        view.addSubview(welcome2Label)
        view.addSubview(phoneNumberTextField)
        view.addSubview(countryButton)
        view.addSubview(suggestionsLabel)
        view.addSubview(facebookButton)
        view.addSubview(emailButton)
        view.addSubview(appleButton)
        view.addSubview(otherButton)
    }
    
    @objc private func handelCountryButton(){
        
    }
    @objc private func handelFaceBookButton(){

    }

    @objc private func handelEmailButton(){
        let vc = LoginEmailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func handelAppleButton(){
        
    }
    
    @objc private func handelNextButton(){
        
    }
    
    @objc private func handelOtherButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func clicktextfield(){
        let vc = SecondLoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}

