//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by MEP LAB 01 on 02/10/22.
//

import UIKit

class AccountSummaryViewController: UIViewController
{
    lazy var logOutButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = UIColor.label
        return barButtonItem
    }()
    let accountSummaryTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupHeaderTableView()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logOutButton
    }

    func style() {
        accountSummaryTableView.translatesAutoresizingMaskIntoConstraints = false
        accountSummaryTableView.delegate = self
        accountSummaryTableView.dataSource = self
        
        accountSummaryTableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        
        accountSummaryTableView.rowHeight = AccountSummaryCell.rowHeight
    }
 
    
    func layout() {
        view.addSubview(accountSummaryTableView)
        
        NSLayoutConstraint.activate([
            accountSummaryTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            accountSummaryTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            accountSummaryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountSummaryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    func logoutTapped() {
        NotificationCenter.default.post(name: .Logout, object: nil)
    }
    
    func setupHeaderTableView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        accountSummaryTableView.tableHeaderView = header
        }
            

}

extension AccountSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        cell.accountSummary = AccountSummary(accountType: .Creditcard, accountName: "ShivsagarShivsagarShivsagar", balance: 99999999999)
        return cell
    }
    
    
}


