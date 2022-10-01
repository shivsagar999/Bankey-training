//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by MEP LAB 01 on 13/09/22.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnBoarding()
}

class OnboardingContainerViewController: UIViewController {
    
    
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController
    var closeButton = UIButton(type: .system)
    var nextButton = UIButton(type: .system)
    var prevButton = UIButton(type: .system)
    var doneButton = UIButton(type: .system)
    
    weak var delegate: OnboardingContainerViewControllerDelegate?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnBoardingViewController(heroImageName: "delorean", title: "This is Delorean")
        let page2 = OnBoardingViewController(heroImageName: "thumbs", title: "This is Thumbs")
        let page3 = OnBoardingViewController(heroImageName: "world", title: "This is World")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        style()
        layout()
  
    }
    
    func setup() {
        
        view.backgroundColor = .secondarySystemBackground
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor)
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false)
        currentVC = pages.first!
    }
    
    
    func style() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Close", for: [])
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .primaryActionTriggered)
        
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Close", for: [])
        prevButton.addTarget(self, action: #selector(prevButtonTapped), for: .primaryActionTriggered)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: [])
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .primaryActionTriggered)
        
    }
    
    
    func layout() {
        
        view.addSubview(closeButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 2)
        ])
        
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

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: currentVC) ?? 0
    }
    
    func getPreviousViewController(from viewController: UIViewController) -> UIViewController?{
        guard let index = pages.firstIndex(of: viewController), (index - 1) >= 0 else {
            return nil
        }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), (index + 1) < pages.count else {
            return nil
        }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    
    
    
}




// MARK: - Actions

extension OnboardingContainerViewController {
    @objc
    func closeButtonTapped() {
        delegate?.didFinishOnBoarding()
    }
    
    @objc
    func nextButtonTapped() {
        
    }
    
    @objc
    func doneButtonTapped() {
        delegate?.didFinishOnBoarding()
    }
    
    @objc
    func prevButtonTapped() {
        
    }
}
