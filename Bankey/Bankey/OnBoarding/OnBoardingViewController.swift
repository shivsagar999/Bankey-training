//
//  OnBoardingViewController.swift
//  Bankey
//
//  Created by MEP LAB 01 on 30/09/22.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}


extension OnBoardingViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical;
        stackView.spacing = 20;
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "delorean")
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.text = "Welcome"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
    }
}
