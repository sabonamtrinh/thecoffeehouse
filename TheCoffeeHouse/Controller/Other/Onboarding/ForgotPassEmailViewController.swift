//
//  ForgotPassEmailViewController.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 10/16/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class ForgotPassEmailViewController: UIViewController {

    private let welcome2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 15.0)
        label.numberOfLines = 1
        label.text = "Nhập email mà bạn muốn đặt lại mật khẩu"
        return label
    }()
    
    private let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email của bạn"
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
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
        title = "Quên mật khẩu"
        view.addSubview(welcome2Label)
        view.addSubview(emailTextField)
        view.addSubview(continueButton)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        welcome2Label.frame = CGRect(x: 25,
                                     y: 100,
                                     width: view.width,
                                     height: 40)
        emailTextField.frame = CGRect(x: 25,
                                      y: welcome2Label.bottom + 50,
                                      width: view.width - 60,
                                      height: 52)
        continueButton.frame = CGRect(x: 25,
                                      y: view.height - view.safeAreaInsets.bottom - 80 ,
                                      width: view.width - 50,
                                      height: 50)
    }

  

}
