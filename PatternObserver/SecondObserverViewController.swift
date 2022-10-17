//
//  SecondObserverViewController.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

class SecondObserverViewController: UIViewController {
    
    // Создаем шаблон View
    var secondObserverView = ObserverView()
    
    var obseverName = "Observer #1"
    var weatherImage = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Добавляем firstObserverView на VC
        self.view.addSubview(secondObserverView)
    }
    
    override func viewWillLayoutSubviews() {
        
        // Задаем границы firstObserverView
        self.secondObserverView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        
        self.secondObserverView.addNameLable(name: obseverName)
    }
}

extension SecondObserverViewController: Observer {
    
    // Метод, для получения обновлений от Publisher
    func update(publisher: Publisher) {
        weatherImage = publisher.imageWeather
    }
    
    override func viewDidLayoutSubviews() {
        self.secondObserverView.addWeatherImage(weather: weatherImage)
    }
}
