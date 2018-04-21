//
//  MainTypesListViewController.swift
//  CarCompany
//
//  Created by Jhon on 4/20/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import UIKit

final class MainTypesListViewController: UIViewController {
    var viewModel: MainTypesListViewModel? = nil
    @IBOutlet weak var maintTypesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main Types"
        
        self.maintTypesTableView.delegate = self
        self.maintTypesTableView.dataSource = self
    }
    
    func configure(viewModel: MainTypesListViewModel) {
        self.viewModel = viewModel
        self.viewModel?.onListDidChange = { [weak self] in
            self?.maintTypesTableView.reloadData()
        }
        self.viewModel?.page = 0
    }
}

// MARK: - UITableViewDataSource

extension MainTypesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.mainTypes ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = (indexPath.row % 2 == 0 ? "even": "odd" )
        let cell = maintTypesTableView.dequeueReusableCell(withIdentifier: cellType)!
        
        cell.textLabel?.text = viewModel?.mainTypes?[indexPath.row].name
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension MainTypesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= (viewModel?.mainTypes?.count ?? 0) - 1 {
            viewModel?.incrementPage()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Your selection", message: "\(viewModel?.manufacturer?.name ?? "") - \(viewModel?.mainTypes?[indexPath.row].name ?? "")", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
