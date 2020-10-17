//
//  LoginEmailViewController.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 10/16/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class LoginEmailViewController: UIViewController {
    
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
        label.text = "Nhập email để đăng nhập."
        return label
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 10.0)
        label.textColor = .systemRed
        label.numberOfLines = 1
        label.text = " "
        return label
    }()
    
    private let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email..."
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password..."
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let otherButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Quên mật khẩu?", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        return btn
    }()
    
    private let continueButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Tiếp tục", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(welcome1Label)
        view.addSubview(welcome2Label)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(otherButton)
        view.addSubview(continueButton)
        view.addSubview(errorLabel)
        otherButton.addTarget(self,
                              action: #selector(handelForgotPassButton),
                              for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(handelContinueButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(handelExitButton))
        
    }
    @objc private func handelExitButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handelContinueButton(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        guard let usernameEmail = emailTextField.text, !usernameEmail.isEmpty,
            let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else {
                return
        }
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        }
        else {
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    print("Logged")
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    self.errorLabel.text = "Vui lòng nhập đúng địa chỉ Email."
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        welcome1Label.frame = CGRect(x: 25,
                                     y: 100,
                                     width: 250,
                                     height: 40)
        welcome2Label.frame = CGRect(x: 25,
                                     y: welcome1Label.bottom + 10,
                                     width: 250,
                                     height: 20)
        emailTextField.frame = CGRect(x: 25,
                                     y: welcome2Label.bottom + 20,
                                     width: view.width - 60,
                                     height: 52)
        errorLabel.frame = CGRect(x: 25,
                                  y: emailTextField.bottom + 5,
                                  width: view.width - 40, height: 20)
        passwordTextField.frame = CGRect(x: 25,
                                     y: errorLabel.bottom + 5,
                                     width: view.width - 60,
                                     height: 52)
        otherButton.frame = CGRect(x: 25,
                                   y: passwordTextField.bottom + 20 ,
                                   width: view.width - 50,
                                   height: 50)
        continueButton.frame = CGRect(x: 25,
                                   y: view.height - view.safeAreaInsets.bottom - 80 ,
                                   width: view.width - 50,
                                   height: 50)
    }
    
    @objc private func handelForgotPassButton(){
        let vc = ForgotPassEmailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
