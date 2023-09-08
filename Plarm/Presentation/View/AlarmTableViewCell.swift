//
//  AlarmTableViewCell.swift
//  Plarm
//
//  Created by Muzlive_Player on 2023/09/08.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    private let timeLabel = UILabel().then {
        $0.text = "6:30"
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.textColor = .white
    }
    
    private let playlistTitleLabel = UILabel().then {
        $0.text = "This is Playlist Title session"
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let alarmSwitch = UISwitch().then {
        $0.isOn = false
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlarmTableViewCell {
    private func setupView() {
        contentView.backgroundColor = UIColor(named: "background")
        
        [
            timeLabel,
            playlistTitleLabel,
            alarmSwitch
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(14)
            $0.leading.equalToSuperview()
        }
        
        playlistTitleLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom)
                .offset(2)
            $0.leading.equalTo(timeLabel)
            $0.trailing.equalTo(alarmSwitch.snp.leading)
                .inset(16)
        }
        
        alarmSwitch.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
                .inset(8)
        }
    }
}
