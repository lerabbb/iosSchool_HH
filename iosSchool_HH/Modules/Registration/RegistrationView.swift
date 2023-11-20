//
//  RegistrationView.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    func setView()
}

class RegistrationViewImp: UIView, RegistrationView {
    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPswdTextField: UITextField!
    @IBOutlet private var registrationButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    func setView() {
        backgroundImageView.image = UIImage(named: "registration-background")
        styleUserAvatar(userImg: userImageView)

        styleTextField(textField: loginTextField)
        styleTextField(textField: passwordTextField)
        styleTextField(textField: repeatPswdTextField)

        styleButton(button: registrationButton)
        styleButton(button: backButton)
    }

    private func styleTextField(textField: UITextField) {
        textField.clipsToBounds = true
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        textField.textColor = UIColor(red: 0.318, green: 0.306, blue: 0.306, alpha: 1)

        textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    private func styleButton(button: UIButton) {
        button.layer.backgroundColor = UIColor(red: 0.329, green: 0.506, blue: 0.706, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    private func styleUserAvatar(userImg: UIImageView) {
        userImageView.image = UIImage(named: "user-profile")
        userImageView.clipsToBounds = true

        userImg.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        userImg.layer.shadowOpacity = 1
        userImg.layer.shadowRadius = 8
        userImg.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
