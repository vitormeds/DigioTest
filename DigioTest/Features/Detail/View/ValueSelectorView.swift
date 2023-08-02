//
//  ValueSelectorView.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import UIKit

class ValueSelectorView: UIView {
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Spacing.normalSpacing
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let tenButton: UIButton = {
        let tenButton = UIButton()
        tenButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        tenButton.setTitleColor(.white, for: .normal)
        tenButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        tenButton.layer.cornerRadius = 8
        tenButton.setTitle(DigioTestStrings.Product.productValue("10,00"), for: .normal)
        tenButton.addTarget(self, action: #selector(tenButtonAction), for: .allTouchEvents)
        return tenButton
    }()
    let twentyButton: UIButton = {
        let tenButton = UIButton()
        tenButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        tenButton.setTitleColor(.white, for: .normal)
        tenButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        tenButton.layer.cornerRadius = 8
        tenButton.setTitle(DigioTestStrings.Product.productValue("20,00"), for: .normal)
        tenButton.addTarget(self, action: #selector(twentyButtonAction), for: .allTouchEvents)
        return tenButton
    }()
    let fiftyButton: UIButton = {
        let tenButton = UIButton()
        tenButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        tenButton.setTitleColor(.white, for: .normal)
        tenButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        tenButton.layer.cornerRadius = 8
        tenButton.setTitle(DigioTestStrings.Product.productValue("50,00"), for: .normal)
        tenButton.addTarget(self, action: #selector(fiftyButtonAction), for: .allTouchEvents)
        return tenButton
    }()
    let hundredButton: UIButton = {
        let tenButton = UIButton()
        tenButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        tenButton.setTitleColor(.white, for: .normal)
        tenButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        tenButton.layer.cornerRadius = 8
        tenButton.setTitle(DigioTestStrings.Product.productValue("100,00"), for: .normal)
        tenButton.addTarget(self, action: #selector(hundredButtonAction), for: .allTouchEvents)
        return tenButton
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
        addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(tenButton)
        stackView.addArrangedSubview(twentyButton)
        stackView.addArrangedSubview(fiftyButton)
        stackView.addArrangedSubview(hundredButton)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            tenButton.heightAnchor.constraint(equalToConstant: Size.sizeButton)
        ])
        NSLayoutConstraint.activate([
            twentyButton.heightAnchor.constraint(equalToConstant: Size.sizeButton)
        ])
        NSLayoutConstraint.activate([
            fiftyButton.heightAnchor.constraint(equalToConstant: Size.sizeButton)
        ])
        NSLayoutConstraint.activate([
            hundredButton.heightAnchor.constraint(equalToConstant: Size.sizeButton)
        ])
    }
    @objc
    func tenButtonAction() {
        resetButtonState()
        tenButton.backgroundColor = UIColor.darkGray
    }
    @objc
    func twentyButtonAction() {
        resetButtonState()
        twentyButton.backgroundColor = UIColor.darkGray
    }
    @objc
    func fiftyButtonAction() {
        resetButtonState()
        fiftyButton.backgroundColor = UIColor.darkGray
    }
    @objc
    func hundredButtonAction() {
        resetButtonState()
        hundredButton.backgroundColor = UIColor.darkGray
    }
    func resetButtonState() {
        tenButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        twentyButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        fiftyButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        hundredButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
    }
}
