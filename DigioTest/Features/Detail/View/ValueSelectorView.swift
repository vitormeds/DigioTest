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
        return tenButton
    }()
    let twentyButton: UIButton = {
        let twentyButton = UIButton()
        twentyButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        twentyButton.setTitleColor(.white, for: .normal)
        twentyButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        twentyButton.layer.cornerRadius = 8
        twentyButton.setTitle(DigioTestStrings.Product.productValue("20,00"), for: .normal)
        return twentyButton
    }()
    let fiftyButton: UIButton = {
        let fiftyButton = UIButton()
        fiftyButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        fiftyButton.setTitleColor(.white, for: .normal)
        fiftyButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        fiftyButton.layer.cornerRadius = 8
        fiftyButton.setTitle(DigioTestStrings.Product.productValue("50,00"), for: .normal)
        return fiftyButton
    }()
    let hundredButton: UIButton = {
        let hundredButton = UIButton()
        hundredButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        hundredButton.setTitleColor(.white, for: .normal)
        hundredButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        hundredButton.layer.cornerRadius = 8
        hundredButton.setTitle(DigioTestStrings.Product.productValue("100,00"), for: .normal)
        return hundredButton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addActions()
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
    func addActions() {
        tenButton.addTarget(self, action: #selector(tenButtonAction), for: .allTouchEvents)
        twentyButton.addTarget(self, action: #selector(twentyButtonAction), for: .allTouchEvents)
        fiftyButton.addTarget(self, action: #selector(fiftyButtonAction), for: .allTouchEvents)
        hundredButton.addTarget(self, action: #selector(hundredButtonAction), for: .allTouchEvents)
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
