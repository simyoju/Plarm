//
//  MainViewController.swift
//  Plarm
//
//  Created by Muzlive_Player on 2023/09/08.
//

import UIKit

class MainViewController: UIViewController {
    private let addBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addBarButtonTapped))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc
    func addBarButtonTapped() {
        
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
        navigationItem.rightBarButtonItem = addBarButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "background")
    }
}
