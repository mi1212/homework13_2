//
//  TableViewCell.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 30.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private var indexPath = IndexPath()
    
    private let headerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.backgroundColor = .clear
        return stack
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .systemGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGray
//        label.backgroundColor = .systemGreen
        label.text = "officiallymcconaughey"
        return label
    }()
    
    private let dotsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
//        label.backgroundColor = .systemGreen
        label.textColor = .systemGray
        label.text = "..."
        return label
    }()
    
    private let picImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
//        image.backgroundColor = .brown
        
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let iconsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
//        stack.backgroundColor = .gray
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let likeImageView = IconImageView(image: UIImage(systemName: "suit.heart"))
    
    private let commentImageView = IconImageView(image: UIImage(systemName: "message"))
    
    private let messageImageView = IconImageView(image: UIImage(systemName: "paperplane"))
    
    private let shareImageView = IconImageView(image: UIImage(systemName: "bookmark"))
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "Нравится: 191"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Я устал сегодня. Пожалуйста, дайте мне новый день."
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lookingCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "посмотреть комментарии"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        backgroundColor = .black
        selectionStyle = .none
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(dotsLabel)
        contentView.addSubview(picImageView)
        contentView.addSubview(iconsStackView)
        iconsStackView.addArrangedSubview(likeImageView)
        iconsStackView.addArrangedSubview(commentImageView)
        iconsStackView.addArrangedSubview(messageImageView)
        contentView.addSubview(shareImageView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lookingCommentsLabel)
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            nickNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: inset),
            nickNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            nickNameLabel.trailingAnchor.constraint(equalTo: dotsLabel.leadingAnchor, constant: -inset)
        ])
        
        NSLayoutConstraint.activate([
            dotsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            dotsLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            picImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: inset),
            picImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            picImageView.heightAnchor.constraint(equalTo: picImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            iconsStackView.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: inset),
            iconsStackView.widthAnchor.constraint(equalToConstant: 28*3+8*2),
            iconsStackView.heightAnchor.constraint(equalToConstant: 28),
        ])
        
        NSLayoutConstraint.activate([
            shareImageView.topAnchor.constraint(equalTo: iconsStackView.topAnchor),
            shareImageView.widthAnchor.constraint(equalToConstant: 28),
            shareImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            shareImageView.bottomAnchor.constraint(equalTo: iconsStackView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: shareImageView.bottomAnchor, constant: inset),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            lookingCommentsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            lookingCommentsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            lookingCommentsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            lookingCommentsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
    
    func setupData(indexPath: IndexPath) {
        self.indexPath = indexPath
        picImageView.image = UIImage(named: "postImage\(indexPath.row)")
    }

}
