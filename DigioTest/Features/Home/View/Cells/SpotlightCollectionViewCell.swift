//
//  SpotlightCollectionViewCell.swift
//  DigioTest
//
//  Created by Vitor Mendes on 01/08/23.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {
    let conteinerView: UIView = {
        let conteinerView = UIView()
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        conteinerView.backgroundColor = UIColor.white
        conteinerView.layer.masksToBounds = true
        conteinerView.layer.cornerRadius = 15
        conteinerView.dropShadow()
        return conteinerView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(conteinerView)
        conteinerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.normalSpacing),
            conteinerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.normalSpacing),
            conteinerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Spacing.normalSpacing),
            conteinerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.normalSpacing)
        ])
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: conteinerView.topAnchor)
        ])
    }
    func setupCell(image: String) {
        imageView.loadImage(imageUrl: image)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
