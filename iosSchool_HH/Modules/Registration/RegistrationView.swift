//
//  RegistrationView.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    var delegate: RegistrationViewDelegate? { get set }

    func setView()
}

protocol RegistrationViewDelegate: AnyObject {
    func registrationButtonDidTap(login: String, password: String)
    func backButtonDidTap()
}

class RegistrationViewImp: UIView, RegistrationView {
    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPswdTextField: UITextField!
    @IBOutlet private var registrationButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    weak var delegate: RegistrationViewDelegate?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setView() {
        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(viewDidTap)
        )
        addGestureRecognizer(recognizer)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )

        backgroundImageView.image = UIImage(named: "registration-background")
        backgroundImageView.contentMode = .scaleAspectFill
        userImageView.image = UIImage(named: "user-profile")

        styleTextField(textField: loginTextField, placeholderText: "Введите логин")
        styleTextField(textField: passwordTextField, placeholderText: "Введите пароль")
        styleTextField(textField: repeatPswdTextField, placeholderText: "Повторите пароль")

        styleButton(button: registrationButton)
        styleButton(button: backButton)
    }

    // MARK: - Private

    @objc
    private func viewDidTap() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPswdTextField.resignFirstResponder()
    }

    @IBAction
    private func registrationDidTap() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPswdTextField.resignFirstResponder()

        delegate?.registrationButtonDidTap(
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }

    @IBAction
    private func backDidTap() {
        delegate?.backButtonDidTap()
    }

    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc
    private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    private func styleTextField(textField: UITextField, placeholderText: String?) {
        textField.clipsToBounds = true
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor(.white).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(.black).cgColor

        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 10))
        textField.leftViewMode = .always
        textField.leftView = spacerView

        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder-color") ?? UIColor(.black)]
        )

        textField.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    private func styleButton(button: UIButton) {
        button.layer.backgroundColor = UIColor(named: "button-color")?.cgColor
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = UIColor(.white)

        button.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
