//
//  CreateViewController.swift
//  myProject
//

import UIKit

//tableview data
struct Category {
    let title: String
}

class CreateViewController: UIViewController {


    public var tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(CreatePublishTableViewCell.self, forCellReuseIdentifier: CreatePublishTableViewCell.identifier)
        return tableView
    }()
    
    public var data: [Category] = [
        Category(title: "Who can see this Post") ]

    var selected: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        //view customisation
        self.title = "Create Post"
        self.tableView.rowHeight = 50.0
        
        
        //navigation bar items
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func cancelTapped(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = data[indexPath.row]
        
        let vc = PublishViewController()
        let publishNav = UINavigationController(rootViewController: vc)
        self.present(publishNav, animated: true, completion: nil)
        
        vc.title = category.title
        
        vc.selectionDelegate = self
    }
}

extension CreateViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreatePublishTableViewCell.identifier, for: indexPath) as? CreatePublishTableViewCell else { return UITableViewCell() }
        cell.mySelection.text = selected ?? ""
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension CreateViewController: PublishSelectionDelegate {
    func didTapChoice(selection: String) {
        selected = selection
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

