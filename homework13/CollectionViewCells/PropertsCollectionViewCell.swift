//
//  PropertsCollectionViewCell.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 06.02.2023.
//

import UIKit

final class PropertsCollectionViewCell: UICollectionViewCell {
    
    private let photosImageView = UIImageView(image: UIImage(systemName: "photo.stack"))
    
    private let videoImageView = UIImageView(image: UIImage(systemName: "video.square"))

    private let photosWithMeImageView = UIImageView(image: UIImage(systemName: "shared.with.you"))

    private let propertsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperts()
        setupLayout()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperts() {
        let imagesArray = [photosImageView, videoImageView, photosWithMeImageView]
        imagesArray.map ({ imageView in
            imageView.backgroundColor = .clear
            imageView.tintColor = .systemGray3
            imageView.contentMode = .scaleAspectFit
        })
    }
    
    private func setupLayout() {
        addSubview(propertsStackView)
        propertsStackView.addArrangedSubview(photosImageView)
        propertsStackView.addArrangedSubview(videoImageView)
        propertsStackView.addArrangedSubview(photosWithMeImageView)
        
        
        NSLayoutConstraint.activate([
            propertsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            propertsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            propertsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            propertsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            photosWithMeImageView.widthAnchor.constraint(equalTo: propertsStackView.widthAnchor, multiplier: 1/3),
            videoImageView.widthAnchor.constraint(equalTo: propertsStackView.widthAnchor, multiplier: 1/3),
            photosImageView.widthAnchor.constraint(equalTo: propertsStackView.widthAnchor, multiplier: 1/3)
        ])
    }
}
