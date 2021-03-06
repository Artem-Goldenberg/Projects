//
//  ViewController.swift
//  ShoppingList
//
//  Created by Artem Goldenberg on 01.03.2021.
//

import UIKit

class ViewController: UITableViewController {
    var products = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeProducts))
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbarItems = [spacer, shareButton]
        navigationController?.isToolbarHidden = false
        
    }
    
    @objc func share() {
        let shareData = products.joined(separator: "\n")
        
        let vc = UIActivityViewController(activityItems: [shareData], applicationActivities: [])
        
        present(vc, animated: true)
    }
    
    @objc func removeProducts() {
        products.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
        cell.textLabel?.text = products[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    @objc func addProduct() {
        let ac = UIAlertController(title: "New product", message: "Enter the product name", preferredStyle: .alert)
        ac.addTextField()
        
        let alertAction = UIAlertAction(title: "OK", style: .default) { [weak ac, weak self] _ in
            guard let product = ac?.textFields?[0].text else { return }
            self?.products.insert(product, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        ac.addAction(alertAction)
        present(ac, animated: true)
    }


}

