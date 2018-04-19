//
//  ViewController.swift
//  CarCompany
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    fileprivate let viewModel = ManufacturersListViewModel()
    
    @IBOutlet weak var manufacturersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manufacturersTableView.delegate = self
        self.manufacturersTableView.dataSource = self
        viewModel.onListDidChange = { [weak self] in
            self?.manufacturersTableView.reloadData()
        }
        viewModel.page = 0
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.manufacturers ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.manufacturers?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= (viewModel.manufacturers?.count ?? 0) - 1 {
            viewModel.incrementPage()
        }
    }
}
