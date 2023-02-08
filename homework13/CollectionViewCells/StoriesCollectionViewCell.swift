//
//  StoriesCollectionViewCell.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 31.01.2023.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.text = "officiallymcconaughey"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupProperts()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(nickNameLabel)
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            nickNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nickNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            nickNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nickNameLabel.topAnchor, constant: -inset)
        ])
        
        
    }
    
    private func setupProperts() {
//        backgroundColor = .tintColor
        
    }
    func setupCorners() {
//        print("heightCell - \(heightCell)")
//        print("contentView.frame.height - \(contentView.frame.height)")
//        print("nickNameLabel.frame.height - \(nickNameLabel.frame.height)")
//        print("imageView.frame.height - \(imageView.frame.height)")
        imageView.layer.cornerRadius = (contentView.frame.height - 14.3 - 8)/2
    }
    
}
