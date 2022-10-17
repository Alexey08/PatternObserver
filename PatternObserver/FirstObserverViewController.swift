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
    
    // Создаем Publisher, чтобы подписываться/отписываться с помощью UISwitch
    var publisherWeather = Publisher.shared
    
    var obseverName = "Observer #1"
    var weatherImage = ""
    
    // создаем UISwitch
    private var subscriptionSwitch: UISwitch = {
        let mySwich = UISwitch()
        mySwich.translatesAutoresizingMaskIntoConstraints = false
        mySwich.addTarget(self, action: #selector(tapSwitch), for: .valueChanged)
        return mySwich
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()        
        self.view.backgroundColor = .white
        
        // Добавляем firstObserverView на VC
        self.view.addSubview(firstObserverView)
        
        self.view.addSubview(subscriptionSwitch)
        addConstraint()
    }
    
    private func addConstraint() {

        // расставляем элементы
        NSLayoutConstraint.activate([
            subscriptionSwitch.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            subscriptionSwitch.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
    
    override func viewWillLayoutSubviews() {
        
        // Задаем границы firstObserverView
        self.firstObserverView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        
        // Передаем название в Lable
        self.firstObserverView.addNameLable(name: obseverName)
    }
    
    // Метод, реагирует на нажатие UISwitch
    @objc
    func tapSwitch(mySwitch: UISwitch) {
        if mySwitch.isOn {
            print(#function + "ON")
            publisherWeather.appendObserver(self)
        } else {
            print(#function + "OFF")
            publisherWeather.removeObserver(self)
        }
    }
}


extension FirstObserverViewController: Observer {
    
    // Метод, для получения обновлений от Publisher
    func update(publisher: Publisher) {
        weatherImage = publisher.imageWeather
        self.firstObserverView.addWeatherImage(weather: weatherImage)
    }
    
    override func viewDidLayoutSubviews() {
        // Меняем картинку
        self.firstObserverView.addWeatherImage(weather: weatherImage)
    }
}
