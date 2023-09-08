//
//  MainViewController.swift
//  Plarm
//
//  Created by Muzlive_Player on 2023/09/08.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {
    private let mainTableView = UITableView().then {
        $0.backgroundColor = .clear
    }
    
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
    func addBarButtonTapped() {
        print("### tapped")
    }
}

extension MainViewController {
    private func setupNavi() {
        setupNaviTitle()
        setupNaviRightItem()
    }
    
    private func setupNaviTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        title = "⏰ Plarm"
    }
    
    private func setupNaviRightItem() {
        let addBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addBarButtonTapped))
        
        navigationItem.rightBarButtonItem = addBarButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "background")
        view.addSubview(mainTableView)
    }
    
    private func setupLayout() {
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
                .offset(32)
            $0.leading.trailing.equalToSuperview()
                .inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}
