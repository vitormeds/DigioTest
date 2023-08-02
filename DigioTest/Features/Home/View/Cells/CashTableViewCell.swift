//
//  CashTableViewCell.swift
//  DigioTest
//
//  Created by Vitor Mendes on 01/08/23.
//

import UIKit
import Nuke

class CashTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return titleLabel
    }()
    let cashImageView: UIImageView = {
        let cashImageView = UIImageView()
        cashImageView.translatesAutoresizingMaskIntoConstraints = false
        cashImageView.layer.masksToBounds = true
        cashImageView.layer.cornerRadius = 15
        return cashImageView
    }()
    var openDetail: (() -> Void)?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    func setupViews() {
        backgroundColor = UIColor.white
        contentView.addSubview(titleLabel)
        contentView.addSubview(cashImageView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.normalSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -Spacing.normalSpacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Spacing.normalSpacing)
        ])
        NSLayoutConstraint.activate([
            cashImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: Spacing.normalSpacing),
            cashImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                    constant: -Spacing.normalSpacing),
            cashImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: Spacing.normalSpacing),
            cashImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cashImageView.heightAnchor.constraint(equalToConstant: Size.cardCashSize)
        ])
    }
    func setup(cash: Cash, openDetail: @escaping () -> Void) {
        setupText()
        if let urlImg: URL = URL(string: cash.bannerURL) {
            let request: ImageRequest? = ImageRequest(urlRequest: URLRequest(url: urlImg))
            let options = ImageLoadingOptions(
                placeholder: DigioTestAssets.noImageIcon.image,
                transition: .fadeIn(duration: 0.33)
            )
            Nuke.loadImage(with: request!, options: options, into: cashImageView)
        }
        self.openDetail = openDetail
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        addGestureRecognizer(tapAction)
    }
    func setupText() {
        let rangeDigio = (DigioTestStrings.Cash.title as NSString)
            .range(of: DigioTestStrings.Cash.titleDigioColor)
        let rangeCash = (DigioTestStrings.Cash.title as NSString)
            .range(of: DigioTestStrings.Cash.titleCashColor)
        let attributedString = NSMutableAttributedString(string: DigioTestStrings.Cash.title)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: rangeDigio)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: rangeCash)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: rangeDigio)
        attributedString.addAttribute(.foregroundColor, value: UIColor.gray, range: rangeCash)
        titleLabel.attributedText = attributedString
    }
    @objc
    func tapAction() {
        openDetail?()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
