//
//  ViewController.swift
//  MMS
//
//  Created by AJ on 28/02/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var userNameViewLayer: UIView!
    @IBOutlet weak var passwordViewLayer: UIView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var showPasswordImageView: UIImageView!
    @IBOutlet weak var showPasswordLabel: UILabel!
    @IBOutlet weak var forgetPasswordImageView: UIImageView!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var loginButtonViewLayer: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerViewLayer: UIView!
    @IBOutlet weak var disclamairLabel: UILabel!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLoginViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setLoginViews() {
        userNameViewLayer.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: AppConstants.textFieldBorderWidth)
        userName.setAttributedPlaceHolder(string: AppConstants.userNamePlcaeHolder, color: UIColor.white)
        passwordViewLayer.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: AppConstants.textFieldBorderWidth)
        password.setAttributedPlaceHolder(string: AppConstants.passwordPlaceHolder, color: UIColor.white)
        loginButtonViewLayer.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: AppConstants.textFieldBorderWidth)
        registerViewLayer.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: AppConstants.textFieldBorderWidth)
        headerLabel.text = AppConstants.loginHeader
        showPasswordLabel.text = AppConstants.showPassword
        forgetPasswordLabel.text = AppConstants.forgetPassword
        loginButton.setTitle(AppConstants.loginButton.uppercased(), for: .normal)
        registerButton.setTitle(AppConstants.notRegisteredButton.uppercased(), for: .normal)
        disclamairLabel.text = AppConstants.loginBottomDisclamair
        errorMessageLabel.isHidden = true
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        forgetPasswordLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(forgetPasswordClicked)))
        showPasswordLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPassword)))
        
    }
    
    @objc private func registerButtonClicked() {
        guard let registerViewController = self.storyboard?.instantiateViewController(identifier: AppConstants.registerVCIdentifier) as? RegisterViewController else { return }
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @objc private func loginButtonClicked() {
        guard let dashBoardViewController = self.storyboard?.instantiateViewController(identifier: AppConstants.dashBoardVCIdentifier) as? DashBoardViewController else { return }
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController(dashBoardViewController, animated: true)
    }
    
    @objc private func forgetPasswordClicked() {
        
    }
    
    @objc private func showPassword() {
        
    }
}


