//
//  SecondLoginViewController.swift
//  TheCoffeeHouse
//
//  Created by namtrinh on 9/15/20.
//  Copyright © 2020 namtrinh. All rights reserved.
//

import UIKit

class SecondLoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
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
    
    private let continueButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Tiếp tục", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.layer.masksToBounds = true
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    private let skipButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Bỏ qua", for: .normal)
        btn.backgroundColor = .systemGray5
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.layer.masksToBounds = true
        btn.setTitleColor(.systemBlue, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = .systemBackground
        countryButton.addTarget(self,
                                action: #selector(handelcountryButton),
                                for: .touchUpInside)
        continueButton.addTarget(self,
                                 action: #selector(handelcontinueButton),
                                 for: .touchUpInside)
        skipButton.addTarget(self,
                             action: #selector(handelskipButton),
                             for: .touchUpInside)
     //   self.navigationController.navigationBarHidden = false
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
        countryButton.frame = CGRect(x: 25,
                                     y: welcome2Label.bottom + 20,
                                     width: 70,
                                     height: 52)
        phoneNumberTextField.frame = CGRect(x: countryButton.right + 20,
                                     y: welcome2Label.bottom + 20,
                                     width: view.width - countryButton.width - 60,
                                     height: 52)
        continueButton.frame = CGRect(x: 25,
                                   y: phoneNumberTextField.bottom + 50 ,
                                   width: view.width - 50,
                                   height: 52)
        skipButton.frame = CGRect(x: 25,
                                   y: continueButton.bottom + 30 ,
                                   width: view.width - 50,
                                   height: 52)
    }
    
    private func addSubViews(){
        view.addSubview(welcome1Label)
        view.addSubview(welcome2Label)
        view.addSubview(countryButton)
        view.addSubview(phoneNumberTextField)
        view.addSubview(continueButton)
        view.addSubview(skipButton)
    }

    @objc private func handelcountryButton(){
        
    }
    @objc private func handelcontinueButton(){
        
    }
    
    @objc private func handelskipButton(){
        self.dismiss(animated: true, completion: nil)
    }
}
