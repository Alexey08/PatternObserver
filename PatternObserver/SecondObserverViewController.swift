//
//  SecondObserverViewController.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

class SecondObserverViewController: UIViewController {

    var secondObserverView = ObserverView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(secondObserverView)
    }
    
    override func viewWillLayoutSubviews() {
        
        self.secondObserverView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        self.secondObserverView.addNameLable(name: "Observer #2")
    }
}
