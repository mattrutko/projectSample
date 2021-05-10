//
//  CreatePubTableViewCell.swift
//  myProject

import UIKit

class CreatePublishTableViewCell: UITableViewCell {
    static let identifier = "CreatePublishTableViewCell"

    //create cell content
    private let myTitle: UILabel = {
        let title = UILabel()
        title.text = "Who can see this Post?"
        return title
    }()
    public var mySelection: UILabel = {
        let selection = UILabel()
        selection.textColor = .secondaryLabel
        selection.textAlignment = .right
        return selection
    }()
    
    //initialise content to view
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let stackView = UIStackView(arrangedSubviews: [myTitle, mySelection])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
