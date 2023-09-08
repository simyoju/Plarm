//
//  InputWithTitleTableViewCell.swift
//  Plarm
//
//  Created by Muzlive_Player on 2023/09/08.
//

import UIKit

class InputWithTitleTableViewCell: UITableViewCell {
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = .white
    }
    
    let inputTextField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InputWithTitleTableViewCell {
    private func setupView() {
        [
            titleLabel, inputTextField
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
                .offset(16)
        }
        
        inputTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
                .inset(16)
        }
    }
}
