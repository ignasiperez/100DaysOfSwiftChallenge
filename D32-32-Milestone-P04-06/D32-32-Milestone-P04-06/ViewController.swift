//
//  ViewController.swift
//  D32-32-Milestone-P04-06 - Shopping List
//
//  Created by Ignasi Perez-Valls on 22/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //  ************************************************************
    //  MARK: - Instance properties
    //
    
    var products = [String]()

    
    //  ************************************************************
    //  MARK: - Override UIViewController methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Shopping List"
        
        
        // enum UIBarButtonItem.SystemItem: Int
        // Constants
        //  .action, .add,  .refresh, .search, .camera, .play...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(addProductTapped)
        )
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(clearShoppingListTapped)
        )
        
        
        // Extra: Help button in the bottom right of the screen
        setupToolBar()
    }
    
    
    //  ************************************************************
    //  MARK: - TABLE Protocols
    //
    
    //  ViewController inherits UITableViewController which conforms
    //  the protocols UITableViewDataSource and UITableViewDelegate.
    //
    //
    //  Protocol UITableViewDataSource
    //
    /// Tells the data source to return the number of rows in a given section of a table view. Required.
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    
    //  Protocol UITableViewDataSource
    //
    /// Asks the data source for a cell to insert in a particular location of the table view. Requiered.
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product",
                                                 for: indexPath)
        
        cell.textLabel?.text = products[indexPath.row]
        
        return cell
    }
    
    
    //  ************************************************************
    //  MARK: - Instance methods
    //
    
    @objc private func addProductTapped() {
        let ac = UIAlertController(title: "Enter product",
                                   message: nil,
                                   preferredStyle: .alert
        )
        
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit",style: .default)
        { [weak self, weak ac] action in
            guard let product = ac?.textFields?[0].text else { return }
            self?.submit(product)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    
    func submit(_ product: String) {
        products.insert(product, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    @objc private func clearShoppingListTapped() {
        products.removeAll()
        tableView.reloadData()
    }
    
    
    
    // Extra: Help button in the bottom right of the screen
    private func setupToolBar() {
        let help = UIBarButtonItem(title: "Help",
                                   style: .plain,
                                   target: self,
                                   action: #selector(helpTapped)
        )
        
        let spacer = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        toolbarItems = [spacer, help]
        
        navigationController?.isToolbarHidden = false
    }
    
    
    // Extra: Help button in the bottom right of the screen
    @objc func helpTapped() {
        let ac = UIAlertController(
            title: "APP HINTS",
            message: """
                     \"+\" to add new products.\n
                     \"↻\" to clear the shopping list.
                     """,
            preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(title: "Ok",
                                   style: .default)
        )
        
        present(ac, animated: true)
    }
    
}

