//
//  ArticleMainCell.swift
//  main
//
//  Created by Andy on 2022/3/16.
//

import UIKit
import Kingfisher

class ArticleMainCell: UICollectionViewCell {
    static let id = "ArticleMainCellID"
    static let height: CGFloat = 220
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleContentLabel: UILabel!
    @IBOutlet weak var tagStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        userIcon.makeRadius(radius: userIcon.frame.height/2)
        tagStackView.spacing = 10
    }
    
    private func removeTag() {
        tagStackView.arrangedSubviews.forEach {
            tagStackView.removeArrangedSubview($0)
        }
    }
    public func config(with article: ArticleItem) {
        removeTag()
        titleLabel.text = article.title
        userNameLabel.text = article.user.nickName
        dateLabel.text = article.creationDate
        articleContentLabel.text = article.content
        
        if let userIconURL = URL(string: article.user.imageUrl) {
            userIcon.kf.setImage(with: userIconURL)
        }
        if let articleURL = URL(string: article.imageUrls.first ?? "") {
            articleImageView.kf.setImage(with: articleURL)
        }
        
        article.tags.forEach {
            let label = UILabel()
            label.text = $0
            label.backgroundColor = .yellow
            label.textColor = .black
            label.font = .systemFont(ofSize: 12)
            tagStackView.addArrangedSubview(label)
        }
        
        tagStackView.addArrangedSubview(tagLabel(with: "點贊\(article.likeCount)"))
        tagStackView.addArrangedSubview(tagLabel(with: "收藏\(article.favoriteCount)"))
        tagStackView.addArrangedSubview(tagLabel(with: "評論\(article.commentCount)"))
        tagStackView.addArrangedSubview(tagLabel(with: "觀看\(article.unlockCount)"))
        
    }
    
    private func tagLabel(with tag: String) -> UILabel {
        let tagLabel = UILabel()
        tagLabel.textColor = .black
        tagLabel.text = tag
        tagLabel.backgroundColor = .clear
        tagLabel.font = .systemFont(ofSize: 12)
        return tagLabel
    }
}


extension UIView {
    public func makeRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
