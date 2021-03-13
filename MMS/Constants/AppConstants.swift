//
//  AppConstants.swift
//  MMS
//
//  Created by AJ on 28/02/21.
//

import Foundation
import UIKit

open class AppConstants {
    // Login Page Constants
    public static let textFieldBorderWidth : CGFloat = 1
    public static let userNamePlcaeHolder = "Enter Username"
    public static let passwordPlaceHolder = "Enter Password"
    public static let loginHeader = "MMS"
    public static let showPassword = "Show Password"
    public static let forgetPassword = "ForgetPassword?"
    public static let loginButton = "Login"
    public static let notRegisteredButton = "Not Yet Registered? Click Here"
    public static let loginBottomDisclamair = "2021 @ Idea Infinity IT Solutions (P)Ltd."
    // Register page Constants
    public static let registerVCIdentifier = "registerViewController"
    public static let goBack = "Go Back"
    public static let registrationHeader = "Registration Form"
    public static let userName = "Username"
    public static let password = "Password"
    public static let registerButton = "Register"
    //DashBoard page Constants
    public static let dashBoardVCIdentifier = "dashBoardViewController"
    public static let dashBoardCollectionViewCell = "DashBoardCollectionViewCell"
    public static let dashBoardCVCIdentifier = "dashBoardCollectionCell"
    public static let dashBoardHeaderCollectionViewCell = "DashBoardHeaderCollectionViewCell"
    public static let dashBoardHCVCIdentifier = "dashBoardHeaderCell"
    public static let firstIndexPath = 0
    public static let collectionViewCellHeight: CGFloat = 100
    public static let fractionOfTwo: CGFloat = 2
    public static let dashBoardSectionsHeightPadding: CGFloat = 3
    public static let dashBoardSectionWidthPaddingFraction: CGFloat = 30//30
    public static let dashBoardCVCFullWithConstraint: CGFloat = 25
    public static let dashBoardCVCHalfWidthConstraint: CGFloat = 40
}
