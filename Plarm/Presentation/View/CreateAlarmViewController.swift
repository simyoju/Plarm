//
//  CreateAlarmViewController.swift
//  Plarm
//
//  Created by Muzlive_Player on 2023/09/08.
//

import UIKit

class CreateAlarmViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
    }
}
