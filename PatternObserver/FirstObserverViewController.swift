//
//  FirstObserverViewController.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

class FirstObserverViewController: UIViewController {
    
    let firstObserverView = ObserverView()

    override func viewDidLoad() {
        
        super.viewDidLoad()        
        self.view.backgroundColor = .white
        self.view.addSubview(firstObserverView)
    }
    
    override func viewWillLayoutSubviews() {
        
        self.firstObserverView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        self.firstObserverView.addNameLable(name: "Observer #1")
    }
}
