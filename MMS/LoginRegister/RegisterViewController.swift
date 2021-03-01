//
//  RegisterViewController.swift
//  MMS
//
//  Created by AJ on 01/03/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var goBackImageView: UIImageView!
    @IBOutlet weak var goBackLabel: UILabel!
    @IBOutlet weak var registerFormView: UIView!
    @IBOutlet weak var bottomDisclamier: UILabel!
    @IBOutlet weak var registrationHeaderLabel: UILabel!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordImageView: UIImageView!
    @IBOutlet weak var showPasswordLabel: UILabel!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    
    private func setUpView() {
        goBackLabel.isUserInteractionEnabled = true
        goBackImageView.isUserInteractionEnabled = true
        goBackImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popBack)))
        goBackLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popBack)))
        registerFormView.layer.cornerRadius = 10
        userNameView.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: AppConstants.textFieldBorderWidth)
        passwordView.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: AppConstants.textFieldBorderWidth)
        registerView.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: AppConstants.textFieldBorderWidth)
        goBackLabel.text = AppConstants.goBack
        registrationHeaderLabel.text = AppConstants.registrationHeader
        userNameTextField.setAttributedPlaceHolder(string: AppConstants.userName, color: UIColor.white)
        passwordTextField.setAttributedPlaceHolder(string: AppConstants.password, color: UIColor.white)
        showPasswordLabel.text = AppConstants.showPassword
        registerButton.setTitle(AppConstants.registerButton, for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        bottomDisclamier.isHidden = true
    }
    
    @objc private func popBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func registerButtonClicked() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

