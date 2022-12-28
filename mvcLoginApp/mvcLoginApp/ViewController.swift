//
//  ViewController.swift
//  mvcLoginApp
//
//  Created by ibaikaa on 11/11/22.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
//    Создать окно заполнения. Полей username и возраст достаточно. По кнопке войти переходить на следующее окно, если данные имеются. В новом окне отобразить эти данные в виде профиля. Если данных нет, то отобразить в label сообщение о неудачной попытке войти в первом окне. Реализовать с помощью архитектуры MVC.
    

    //задать градиентный фоновый цвет
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    //Создание поля ввода для имени пользователя
    private lazy var userNameTextField: UITextField = {
        let userNameTextField = UITextField()
        userNameTextField.placeholder = "Имя пользователя"
        userNameTextField.backgroundColor = .white
        userNameTextField.textColor = .systemBlue
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.setLeftPaddingPoints(50)
        userNameTextField.setRightPaddingPoints(10)
        userNameTextField.addTarget(self, action: #selector(fillIcon), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(unfillIcon), for: .editingDidEnd)
        return userNameTextField
    }()
    
    //Создание иконки пользователя для userNameTextField
    let userIcon: UIImageView = {
        let userIcon = UIImageView(image:  UIImage(systemName: "person.fill"))
        userIcon.tintColor = .lightGray
        return userIcon
    }()
    
    //Функция для закраски иконки, если в поле ввода для пользователя начался ввод данных
    @objc func fillIcon(){
        userIcon.tintColor = .systemBlue
    }
    
    //Функция для закраски иконки, если в поле ввода для пользователя прекратился ввод данных
    @objc func unfillIcon(){
        userIcon.tintColor = .lightGray
    }
    

    //Создание поля ввода для пароля
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .lightGray
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.setLeftPaddingPoints(50)
        passwordTextField.setRightPaddingPoints(50)
        passwordTextField.addTarget(self, action: #selector(unlockTextFieldIconShow), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(lockTextFieldIconShow), for: .editingDidEnd)
        return passwordTextField
    }()
    
    //Создание иконки "закрытый замок"
    let passwordBlockedIcon: UIImageView = {
        let passwordBlockedIcon = UIImageView(image:  UIImage(systemName: "lock.fill"))
        passwordBlockedIcon.tintColor = .lightGray
        return passwordBlockedIcon
    }()

    //Создание иконки "открытый замок"
    let passwordCorrectIcon: UIImageView = {
        let passwordCorrectIcon = UIImageView(image:  UIImage(systemName: "lock.open.fill"))
        passwordCorrectIcon.tintColor = .lightGray
        return passwordCorrectIcon
    }()
    
    //Функция смены иконки на открытый замок, если в поле для ввода данных пароля начался ввод данных
    @objc func unlockTextFieldIconShow(){
        passwordBlockedIcon.isHidden = true
        passwordCorrectIcon.isHidden = false
    }
    
    //Функция смены иконки на закрытый замок, если в поле для ввода данных пароля прекратился ввод данных
    @objc func lockTextFieldIconShow(){
        passwordBlockedIcon.isHidden = false
        passwordCorrectIcon.isHidden = true
        passwordTextField.textColor = .lightGray
        showOrHidePasswordButton.tintColor = .lightGray
    }
    
 
 
    

    //Создание кнопки для показа/скрытия пароля
    private lazy var showOrHidePasswordButton: UIButton = {
        let showOrHidePasswordButton = UIButton()
        showOrHidePasswordButton.setImage(showPasswordIcon, for: .normal)
        showOrHidePasswordButton.tintColor = .lightGray
        showOrHidePasswordButton.addTarget(self, action: #selector(switchButtonSecureState), for: .touchUpInside)
        return showOrHidePasswordButton
    }()
    
    //Создание иконки для показа пароля
    let showPasswordIcon = UIImage(systemName: "eye.fill")
    
    //Создание иконки для скрытия пароля
    let hidePasswordIcon = UIImage(systemName: "eye.slash.fill")
    
    //Переменная, отвечающая за состояние "глазка" для пароля
    var showPasswordIconClicked = true
    
    //Функция для смены иконки относительно текущего состояния кнопки и показа/скрытия пароля в поле для ввода пароля
    @objc func switchButtonSecureState() {
        if showPasswordIconClicked {
            passwordTextField.isSecureTextEntry = false
            showOrHidePasswordButton.setImage(hidePasswordIcon, for: .normal)
            showOrHidePasswordButton.tintColor = .systemBlue
            passwordTextField.textColor = .systemBlue
            passwordCorrectIcon.tintColor = .systemBlue
        } else {
            passwordTextField.isSecureTextEntry = true
            showOrHidePasswordButton.setImage(showPasswordIcon, for: .normal)
            showOrHidePasswordButton.tintColor = .lightGray
            passwordTextField.textColor = .lightGray
            passwordCorrectIcon.tintColor = .lightGray
        }
        showPasswordIconClicked = !showPasswordIconClicked
    }
    
    //Создание кнопки входа
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .systemBlue
        signInButton.setTitle("Войти", for: .normal)
        signInButton.layer.cornerRadius = 15
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return signInButton
    }()
    
    private var controller: UserController?
    
    //Функция для анализа введенных данных и выдачи результата в signingStateLabel
    @objc func signInButtonTapped(){
        signingStateLabel.text = controller!.sendInfo(username: userNameTextField.text!, password: passwordTextField.text!)
        

        
        print(signingStateLabel.text!)

        if signingStateLabel.text! == "Успешный вход! ✅"{
            
            let userController = UserProfileViewController()
            userController.getUsernameLabel().text = userNameTextField.text!
            userController.getPasswordLabel().text = passwordTextField.text!
            navigationController?.pushViewController(userController, animated: true)
          
        }
    
    }
    
    //Создание UILabel'а, сообщающего об успешности входа
    private lazy var signingStateLabel: UILabel = {
        let signingStateLabel = UILabel()
        signingStateLabel.text = ""
        signingStateLabel.textColor = .black
        signingStateLabel.textAlignment = .center
        signingStateLabel.font = UIFont(name: "Avenir Next Bold", size: 25)
        return signingStateLabel
    }()
    
    //setup сабвьюшек
    func setupSubviews(){
        setGradientBackground()
        
        view.addSubview(userNameTextField)
        view.addSubview(userIcon)
        view.addSubview(passwordTextField)
        view.addSubview(passwordBlockedIcon)
        view.addSubview(passwordCorrectIcon)
        view.addSubview(showOrHidePasswordButton)
        view.addSubview(signInButton)
        view.addSubview(signingStateLabel)
        
        passwordCorrectIcon.isHidden = true

        
        userNameTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        userIcon.snp.makeConstraints{ make in
            make.top.equalTo(userNameTextField.snp.top).offset(12)
            make.left.equalTo(userNameTextField.snp.left).offset(10)
            make.height.width.equalTo(25)
        }
        
        
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        passwordBlockedIcon.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextField.snp.top).offset(12)
            make.left.equalTo(passwordTextField.snp.left).offset(10)
            make.height.width.equalTo(25)
        }
        
        passwordCorrectIcon.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextField.snp.top).offset(12)
            make.left.equalTo(passwordTextField.snp.left).offset(10)
            make.height.width.equalTo(25)
        }
        
        showOrHidePasswordButton.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextField.snp.top).offset(12)
            make.right.equalTo(passwordTextField.snp.right).offset(-15)
            make.height.equalTo(25)
        }
        
        signInButton.snp.makeConstraints{ make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        signingStateLabel.snp.makeConstraints{ make in
            make.top.equalTo(signInButton.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        controller = UserController(view: self)
        setupSubviews()
        signingStateLabel.text = ""
    }


}


//Расширение для textfield, чтоб добавить свой отступ для текста (понадобилось для корректного отображения и иконок, и текста в textfield)
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
