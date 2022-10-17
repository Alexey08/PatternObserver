//
//  FirstObserverViewController.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

class FirstObserverViewController: UIViewController {
    
    // Создаем шаблон View
    var firstObserverView = ObserverView()
    
    var obseverName = "Observer #1"
    var weatherImage = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()        
        self.view.backgroundColor = .white
        
        // Добавляем firstObserverView на VC
        self.view.addSubview(firstObserverView)        
    }
    
    override func viewWillLayoutSubviews() {
        
        // Задаем границы firstObserverView
        self.firstObserverView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        
        self.firstObserverView.addNameLable(name: obseverName)
    }
}

extension FirstObserverViewController: Observer {
    
    // Метод, для получения обновлений от Publisher
    func update(publisher: Publisher) {
        weatherImage = publisher.imageWeather
        self.firstObserverView.addWeatherImage(weather: weatherImage)
    }
    
    override func viewDidLayoutSubviews() {
        self.firstObserverView.addWeatherImage(weather: weatherImage)
    }
}
