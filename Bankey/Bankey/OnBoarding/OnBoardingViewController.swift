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
    
    
    
    init(heroImageName: String, title: String) {
        self.imageView.image = UIImage(named: heroImageName)
        self.label.text = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}


extension OnBoardingViewController {
    
    func style() {
        
        view.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.axis = .vertical;
        stackView.spacing = 20;
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.contentMode = .scaleAspectFit
        
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        
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
