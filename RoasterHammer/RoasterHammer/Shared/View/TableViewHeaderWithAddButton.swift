//
//  RoasterHammerTableViewHeader.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/5/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewHeaderWithAddButtonDelegate: class {
    func tableViewHeaderAddButtonTapped(_ sender: UIButton, inSection section: Int)
}

final class TableViewHeaderWithAddButton: UIView {
    private let label = UILabel(forAutoLayout: ())
    private let addButton = UIButton(forAutoLayout: ())
    private let stackView = UIStackView(forAutoLayout: ())
    private var section: Int!
    private weak var delegate: TableViewHeaderWithAddButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.lightGray

        label.textColor = UIColor.black
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(addButton)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15.0),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15.0)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupWithTitle(_ title: String, section: Int, delegate: TableViewHeaderWithAddButtonDelegate) {
        label.text = title
        self.section = section
        self.delegate = delegate
    }

    @objc private func addButtonTapped(_ sender: UIButton) {
        delegate?.tableViewHeaderAddButtonTapped(sender, inSection: self.section)
    }
}
