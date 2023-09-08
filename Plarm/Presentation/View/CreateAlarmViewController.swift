//
//  CreateAlarmViewController.swift
//  Plarm
//
//  Created by Muzlive_Player on 2023/09/08.
//

import UIKit

enum RepeatDay: String {
    case none = "안함"
    case sunday = "일요일마다"
    case monday = "월요일마다"
    case tuesday = "화요일마다"
    case wednsday = "수요일마다"
    case thursday = "목요일마다"
    case friday = "금요일마다"
    case saturday = "토요일마다"
}

class CreateAlarmViewController: UIViewController {
    private let datePicker = UIDatePicker().then {
        $0.datePickerMode = .time
        $0.preferredDatePickerStyle = .wheels
        $0.setValue(UIColor.white, forKey: "textColor")
    }
    
    lazy var menuTableView = UITableView().then {
        $0.backgroundColor = UIColor(named: "listBackground")
        $0.layer.cornerRadius = 13
        
        $0.delegate = self
        $0.dataSource = self
        
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.register(InputWithTitleTableViewCell.self, forCellReuseIdentifier: "InputWithTitleTableViewCell")
    }
    
    private let removeButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "listBackground")
        $0.layer.cornerRadius = 13
        $0.setTitle("알람 삭제", for: .normal)
        $0.setTitleColor(UIColor(named: "systemRed"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private let menus: [String] = [
        "반복", "레이블", "플레이리스트"
    ]
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    @objc
    func rightBarButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc
    func leftBarButtonTapped() {
        self.dismiss(animated: true)
    }
}

extension CreateAlarmViewController {
    private func setupNavi() {
        setupNaviTitle()
        setupNaviRightBarItem()
        setupNaviLeftBarItem()
    }
    
    private func setupNaviTitle() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        title = "알람추가"
    }
    
    private func setupNaviRightBarItem() {
        let addBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem = addBarButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupNaviLeftBarItem() {
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem = leftBarButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "background")
        [
            datePicker,
            menuTableView,
            removeButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        datePicker.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
                .offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        menuTableView.snp.makeConstraints {
            $0.top.equalTo(datePicker.snp.bottom)
                .offset(16)
            $0.leading.trailing.equalToSuperview()
                .inset(16)
            $0.height.equalTo(144)
        }
        
        removeButton.snp.makeConstraints {
            $0.top.equalTo(menuTableView.snp.bottom)
                .offset(16)
            $0.leading.trailing.equalTo(menuTableView)
            $0.height.equalTo(56)
        }
        
    }
}

extension CreateAlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.backgroundColor = UIColor(named: "listBackground")
            cell.textLabel!.text = "반복"
            cell.textLabel!.textColor = .white
            cell.selectionStyle = .none
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputWithTitleTableViewCell", for: indexPath) as! InputWithTitleTableViewCell
            cell.backgroundColor = UIColor(named: "listBackground")
            cell.selectionStyle = .none
            cell.titleLabel.text = menus[row]
            return cell
        }
        
    }
}

