//
//  HeaderView.swift
//  DigioTest
//
//  Created by Vitor Mendes on 01/08/23.
//

import UIKit

protocol HeaderViewToViewDelegate: AnyObject {
    func setupValues(name: String)
}

class HeaderView: UIView {
    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 4
        return iconImageView
    }()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return titleLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Identifier has not been implemeted")
    }
    func setupViews() {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: Spacing.smallSpacing),
            iconImageView.widthAnchor.constraint(equalToConstant: Size.iconSize),
            iconImageView.heightAnchor.constraint(equalToConstant: Size.iconSize)
        ])
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,
                                                constant: Spacing.smallSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension HeaderView: HeaderViewToViewDelegate {
    func setupValues(name: String) {
        titleLabel.text = DigioTestStrings.Header.title(name)
        iconImageView.image = DigioTestAssets.digioIcon.image
    }
}
