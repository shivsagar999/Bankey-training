//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by MEP LAB 01 on 01/10/22.
//

import Foundation
import UIKit


extension UIViewController {
    
        func setStatusBar() {
            let statusBarSize = UIApplication.shared.statusBarFrame.size // deprecated but OK
            let frame = CGRect(origin: .zero, size: statusBarSize)
            let statusbarView = UIView(frame: frame)
     
            statusbarView.backgroundColor = appColor
            view.addSubview(statusbarView)
        }

    func setTabBarImage(imageName: String, title: String) {
        let imgConfig = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: imgConfig)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
