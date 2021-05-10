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
        selection.text = "placeholdertext"
        selection.textColor = .secondaryLabel
        selection.textAlignment = .right
        return selection
    }()
    
    //initialise content to view
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myTitle)
        contentView.addSubview(mySelection)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myTitle.text = nil
        mySelection.text = nil
    }
    
    //edit placements
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let screenWidth = contentView.frame.size.width
        let screenHeight = contentView.frame.size.height
        
        myTitle.frame = CGRect(x: 21,  y: (screenHeight / 2) - 12 , width: screenWidth, height: 24)
        mySelection.frame = CGRect(x: -8, y: (screenHeight / 2) - 12, width: screenWidth, height: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
