//
//  DetailView.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import UIKit

protocol DetailViewToViewDelegate: AnyObject {
    func setup(product: ProductAdapter)
}

class DetailView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    let productCardView: UIView = {
        let productCardView = UIView()
        productCardView.backgroundColor = .white
        productCardView.translatesAutoresizingMaskIntoConstraints = false
        productCardView.clipsToBounds = true
        productCardView.layer.cornerRadius = 8
        productCardView.dropShadow()
        return productCardView
    }()
    let productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.backgroundColor = .white
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 8
        return productImageView
    }()
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Spacing.normalSpacing
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let selectValueLabel: UILabel = {
        let selectValueLabel = UILabel()
        selectValueLabel.text = DigioTestStrings.Product.selectValue
        selectValueLabel.textAlignment = .left
        selectValueLabel.font = .boldSystemFont(ofSize: 18)
        selectValueLabel.translatesAutoresizingMaskIntoConstraints = false
        selectValueLabel.isHidden = true
        return selectValueLabel
    }()
    let actionButton: UIButton = {
        let actionButton = UIButton()
        actionButton.backgroundColor = UIColor.blue
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        actionButton.layer.cornerRadius = 8
        return actionButton
    }()
    let valueSelectorView: ValueSelectorView = {
        let valueSelectorView = ValueSelectorView()
        valueSelectorView.isHidden = true
        valueSelectorView.translatesAutoresizingMaskIntoConstraints = false
        return valueSelectorView
    }()
    var product: ProductAdapter?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Identifier has not been implemeted")
    }
    func setupViews() {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(productCardView)
        containerView.addSubview(productImageView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(selectValueLabel)
        stackView.addArrangedSubview(valueSelectorView)
        stackView.addArrangedSubview(actionButton)
    }
    func setupContraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                constant: Spacing.normalSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                 constant: -Spacing.normalSpacing),
            titleLabel.heightAnchor.constraint(equalToConstant: Size.headerSize)
        ])
        setupProductsContraints()
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: productCardView.bottomAnchor,
                                                  constant: Spacing.normalSpacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                      constant: Spacing.normalSpacing),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                       constant: -Spacing.normalSpacing)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
                                           constant: Spacing.normalSpacing),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                               constant: Spacing.normalSpacing),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                constant: -Spacing.normalSpacing),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            selectValueLabel.heightAnchor.constraint(equalToConstant: Size.sizeButton)
        ])
        NSLayoutConstraint.activate([
            actionButton.heightAnchor.constraint(equalToConstant: Size.sizeButton)
        ])
    }
    func setupProductsContraints() {
        NSLayoutConstraint.activate([
            productCardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                 constant: Spacing.normalSpacing)
        ])
        if product?.type != .product {
            NSLayoutConstraint.activate([
                productCardView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                         constant: Spacing.normalSpacing),
                productCardView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                          constant: -Spacing.normalSpacing),
                productCardView.heightAnchor.constraint(equalToConstant: Size.cardSize)
            ])
            NSLayoutConstraint.activate([
                productImageView.leadingAnchor.constraint(equalTo: productCardView.leadingAnchor),
                productImageView.trailingAnchor.constraint(equalTo: productCardView.trailingAnchor),
                productImageView.topAnchor.constraint(equalTo: productCardView.topAnchor),
                productImageView.bottomAnchor.constraint(equalTo: productCardView.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                productCardView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                productCardView.widthAnchor.constraint(equalToConstant: Size.productCollectionSize),
                productCardView.heightAnchor.constraint(equalToConstant: Size.productCollectionSize)
            ])
            NSLayoutConstraint.activate([
                productImageView.centerYAnchor.constraint(equalTo: productCardView.centerYAnchor),
                productImageView.centerXAnchor.constraint(equalTo: productCardView.centerXAnchor),
                productImageView.widthAnchor.constraint(equalToConstant: Size.productSize),
                productImageView.heightAnchor.constraint(equalToConstant: Size.productSize)
            ])
        }
    }
}

extension DetailView: DetailViewToViewDelegate {
    func setup(product: ProductAdapter) {
        self.product = product
        titleLabel.text = product.name
        descriptionLabel.text = product.productDescription
        setupViews()
        setupContraints()
        productImageView.loadImage(imageUrl: product.imageURL)
        switch product.type {
        case .cash:
            actionButton.setTitle(DigioTestStrings.Cash.buttonTitle, for: .normal)
        case .product:
            selectValueLabel.isHidden = false
            valueSelectorView.isHidden = false
            actionButton.setTitle(DigioTestStrings.Product.buttonTitle, for: .normal)
        case .spotlight:
            selectValueLabel.isHidden = false
            valueSelectorView.isHidden = false
            actionButton.setTitle(DigioTestStrings.Product.buttonTitle, for: .normal)
        }
    }
}
