//
//  PublishViewController.swift
//  myProject

import UIKit

class PublishViewController: UIViewController {
    
    //create a variable to save input data
    var selectionDelegate: PublishSelectionDelegate!
    
    //Sending through table data
    var publishOption: [PublishOption] = []
    
    
    private let publishView: UITableView = {
        let publishView = UITableView()
        publishView.register(PublishTableViewCell.self, forCellReuseIdentifier: PublishTableViewCell.identifier)
        return publishView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(publishView)
        
        //tableview(publishview) Adjustments
        self.publishView.rowHeight = 70.0
        self.publishView.isScrollEnabled = false

        
        //initializing table data
        publishOption = publishArray()
        
        publishView.delegate = self
        publishView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(closeTapped))
    }
    
    func publishArray() -> [PublishOption] {
        var puboption: [PublishOption] = []
        
        let pub1 = PublishOption(image: UIImage(systemName: "face.smiling")!, title: "Public", subtitle: "Anyone on the App")
        let pub2 = PublishOption(image: UIImage(systemName: "face.smiling")!, title: "Private", subtitle: "Only Myself and Shared people")
        let pub3 = PublishOption(image: UIImage(systemName: "face.smiling")!, title: "Close Friends", subtitle: "Only my Close Friends")
        
        puboption.append(pub1)
        puboption.append(pub2)
        puboption.append(pub3)
        
        return puboption
    }
    
    @objc func closeTapped(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        publishView.frame = view.bounds
        publishView.tableFooterView = UIView(frame: .zero)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectionDelegate.didTapChoice(selection: publishOption[indexPath.row].title)
        
        self.dismiss(animated: true, completion: nil)
        
    }
}

//delegate protocol for tableview data
protocol PublishSelectionDelegate {
    func didTapChoice(selection: String)
}

extension PublishViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return publishOption.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let publish = publishOption[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: PublishTableViewCell.identifier) as! PublishTableViewCell
    
    cell.setPublishOption(option: publish)
        
    return cell
    }
}



