//
//  AuthView.swift
//  iosSchool_HH
//
//  Created by student on 06.11.2023.
//

import UIKit

protocol AuthView: UIView {
    var delegate: AuthViewDelegate? { get set }

    func setView()
}

protocol AuthViewDelegate: AnyObject {
    func loginButtonDidTap(login: String, password: String)
    func registrationButtonDidTap()
}

class AuthViewImp: UIView, AuthView {
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var labelView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subTitleLabel: UILabel!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var registrationButton: UIButton!

    weak var delegate: AuthViewDelegate?

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

        registrationButton.addTarget(
            self,
            action: #selector(registrationDidTap),
            for: .touchUpInside
        )

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

        imageView.image = UIImage(named: "auth-background")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.backgroundColor = UIColor(named: "grey-color")?.cgColor

        styleLabelView(view: labelView)
        styleTextField(textField: loginTextField, placeholderText: "Логин")
        styleTextField(textField: passwordTextField, placeholderText: "Пароль")
        styleButton(button: loginButton)
        styleButton(button: registrationButton)
    }

    // MARK: - Private

    @objc
    private func viewDidTap() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    @IBAction
    private func loginDidTap(sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        delegate?.loginButtonDidTap(
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }

    @objc
    private func registrationDidTap() {
        delegate?.registrationButtonDidTap()
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
        self.scrollView.contentInset = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }

    private func styleLabelView(view: UIView) {
        view.layer.backgroundColor = UIColor(named: "clear-grey-color")?.cgColor
        view.layer.cornerRadius = 10

        view.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 8)
    }

    private func styleTextField(textField: UITextField, placeholderText: String?) {
        textField.clipsToBounds = true
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor(red: 0.897, green: 0.897, blue: 0.897, alpha: 1).cgColor
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
