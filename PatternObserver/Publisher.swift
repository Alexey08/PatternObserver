//
//  File.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 16.10.2022.
//

import Foundation

class Publisher {
    
    // Список публикации (погода)
    private lazy var publications = ["sun.max", "moon", "cloud", "cloud.rain",
                             "cloud.bolt.rain", "cloud.snow", "cloud.sun",
                             "cloud.moon", "cloud.sun.bolt", "cloud.moon.bolt",
                             "cloud.sun.rain", "cloud.moon.rain"]
    
    // Последняя публикация
    lazy var imageWeather = "questionmark.square"
    
    // Список подписчиков
    private lazy var observers = [Observer]()
    
    // Метод, для подписки на Publisher
    func appendObserver(_ observer: Observer) {
            observers.append(observer)
        }

    // Метод, для отписка от Publisher
    func removeObserver(_ observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
        }
    }
    
    // Метод, передаёт новые публикации подписчикам
    func notify() {
        imageWeather = publications.randomElement()!
        observers.forEach({ $0.update(publisher: self)})
        print (observers)
    }
}

protocol Observer: AnyObject {

    func update(publisher: Publisher)
}

