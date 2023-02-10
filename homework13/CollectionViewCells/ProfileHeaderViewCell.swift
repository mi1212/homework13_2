//
//  ProfileHeaderViewCell.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 06.02.2023.
//

import UIKit

protocol ProfileHeaderViewCellDelegate: AnyObject {
    func tapImage()
}

final class ProfileHeaderViewCell: UICollectionViewCell {

    weak var delegate: ProfileHeaderViewCellDelegate?
    
    private let infoArray = [
    "Matthew McConaughey",
    "Деятель искусства",
    "Актер, Продюсер, Режиссер, Сценарист",
    "Подписаны: "
    ]
    
    private let statisticArray = ["Публикации": "1342", "Подписчики": "5 млн", "Подписки": "50" ]
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statisticStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let infoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подписаться", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let textButton: UIButton = {
        let button = UIButton()
        button.setTitle("Написать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let extraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTapGestureRecognizerToImage()
        setupLayout()
        setupInfoStack()
        setupStatisticStack()
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadiusOfImage()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTapGestureRecognizerToImage() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        profileImageView.addGestureRecognizer(tap)
    }
    
    @objc private func tapImage() {
        delegate?.tapImage()
    }
    
    private func setupLayout() {
        addSubview(profileImageView)
        addSubview(statisticStack)
        addSubview(infoStack)
        addSubview(followButton)
        addSubview(textButton)
        addSubview(extraButton)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: Inset.small.rawValue),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Inset.small.rawValue),
            profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.44),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            statisticStack.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            statisticStack.heightAnchor.constraint(equalTo: profileImageView.heightAnchor, multiplier: 0.4),
            statisticStack.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Inset.normal.rawValue),
            statisticStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Inset.normal.rawValue),
        ])
        
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Inset.small.rawValue),
            infoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Inset.small.rawValue),
            infoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Inset.small.rawValue),
            infoStack.bottomAnchor.constraint(equalTo: followButton.topAnchor, constant: -Inset.small.rawValue),
        ])
        
        NSLayoutConstraint.activate([
            followButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Inset.small.rawValue),
            followButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Inset.small.rawValue),
            followButton.heightAnchor.constraint(equalToConstant: 32),
            followButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.44)
        ])
        
        NSLayoutConstraint.activate([
            textButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Inset.small.rawValue),
            textButton.leadingAnchor.constraint(equalTo: followButton.trailingAnchor, constant: Inset.small.rawValue),
            textButton.heightAnchor.constraint(equalToConstant: 32),
            textButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
        ])
        
        NSLayoutConstraint.activate([
            extraButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Inset.small.rawValue),
            extraButton.leadingAnchor.constraint(equalTo: textButton.trailingAnchor, constant: Inset.small.rawValue),
            extraButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Inset.small.rawValue),
            extraButton.heightAnchor.constraint(equalToConstant: 32),
        ])
    }

    private func setupCornerRadiusOfImage() {
        if profileImageView.layer.cornerRadius == 0.0 {
            profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        }
    }
    
    private func setupInfoStack() {
        infoArray.map {text in
            let label = UILabel()
            label.text = text
            
            label.textColor = .white
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.preferredFont(forTextStyle: .body)
            
            infoStack.addArrangedSubview(label)
        }
    }
    
    private func setupStatisticStack() {
        statisticArray.map { key, value in
            let statisticView = StatisticProfileView(title: key, value: value)
            statisticStack.addArrangedSubview(statisticView)
        }
    }
}
