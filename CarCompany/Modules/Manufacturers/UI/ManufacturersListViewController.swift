//
//  ViewController.swift
//  CarCompany
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import UIKit

final class ManufacturersListViewController: UIViewController {
    fileprivate static let mainTypesSegue = "showMainTypes"
    fileprivate let viewModel = ManufacturersListViewModel()
    
    @IBOutlet weak var manufacturersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Manufacturers"
        
        self.manufacturersTableView.delegate = self
        self.manufacturersTableView.dataSource = self
        viewModel.onListDidChange = { [weak self] in
            self?.manufacturersTableView.reloadData()
        }
        viewModel.page = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ManufacturersListViewController.mainTypesSegue,
            let selectedManufacturer = viewModel.selectedManufacturer {
            let detail = segue.destination as? MainTypesListViewController
            detail?.configure(viewModel: MainTypesListViewModel(manufacturer: selectedManufacturer))
        }
    }
}

// MARK: - UITableViewDataSource

extension ManufacturersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.manufacturers ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = (indexPath.row % 2 == 0 ? "even": "odd" )
        let cell = manufacturersTableView.dequeueReusableCell(withIdentifier: cellType)!
        
        cell.textLabel?.text = viewModel.manufacturers?[indexPath.row].name
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ManufacturersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= (viewModel.manufacturers?.count ?? 0) - 1 {
            viewModel.incrementPage()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectManufacturer(atIndex: indexPath.row)
        self.performSegue(withIdentifier: ManufacturersListViewController.mainTypesSegue, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
