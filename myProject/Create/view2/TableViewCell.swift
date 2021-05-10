//
//  PublishTableViewCell.swift

import UIKit

class PublishTableViewCell: UITableViewCell {
    
    static let identifier = "PublishTableViewCell"
    
    func setPublishOption(option: PublishOption) {
        myImageView.image = option.image
        pubLabel.text = option.title
        pubSubtitle.text = option.subtitle
    }
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let pubLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    public let pubSubtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.font = subtitle.font.withSize(14)
        subtitle.textColor = .secondaryLabel
        return subtitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myImageView)
        contentView.addSubview(pubLabel)
        contentView.addSubview(pubSubtitle)
    }
    
    public func configure(imageName: String, text: String, subtitle: String) {
        myImageView.image = UIImage(named: imageName)
        pubLabel.text = text
        pubSubtitle.text = subtitle
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
        pubLabel.text = nil
        pubSubtitle.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewHeight = contentView.frame.size.height
        let viewWidth = contentView.frame.size.width
        
        myImageView.frame = CGRect(x: 21,  y: (contentView.frame.size.height / 2) - 12 , width: 24, height: 24)
        pubLabel.frame = CGRect(x: 70, y: ((contentView.frame.size.height / 2) - 10) - 9, width: viewWidth, height: 20)
        pubSubtitle.frame = CGRect(x: 70, y: (viewHeight/2)+1, width: viewWidth, height: 20)
    }
}
