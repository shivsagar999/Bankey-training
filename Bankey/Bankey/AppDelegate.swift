//
//  AppDelegate.swift
//  Bankey
//
//  Created by MEP LAB 01 on 12/09/22.
//

import UIKit

let appColor: UIColor = UIColor.systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    let loginViewController = LoginViewController()
    let onboadindContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        
        
        onboadindContainerViewController.delegate = self
        loginViewController.delegate = self
        
        window?.rootViewController = mainViewController
        return true
    }

   

}

extension AppDelegate {
    
    func setRootViewController(_ vc: UIViewController, animated: Bool){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        setRootViewController(onboadindContainerViewController, animated: true)
    }
 
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnBoarding() {
        print("foo did finish onboarding")
    }
    
    
 
}
