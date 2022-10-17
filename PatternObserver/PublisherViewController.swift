//
//  PublisherViewController.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

class PublisherViewController: UIViewController {
    
    // Publisher
    var publisherWeather = Publisher.shared
    
    // Наблюдатели
    var observerFirst = FirstObserverViewController()
    var observerSecond = SecondObserverViewController()
            
    // создаем UILabel
    private lazy var publisherLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Publisher"
        lable.textColor = .black
        lable.backgroundColor = .systemGray3
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        return lable
    }()
    
    // создаем UILabel
    private lazy var weatherForecastLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Weather forecast"
        lable.textColor = .black
        lable.backgroundColor = .systemGray5
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        return lable
    }()
    
    // создаем UIImageView
    private lazy var weatherImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "questionmark.square")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    // создаем UIButton
    private lazy var weatherForecastButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Generate weather forecast", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    // создаем UILabel
    private lazy var numberSubscribersLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "   Number of subscribers: 0"
        lable.textColor = .black
        lable.backgroundColor = .systemGray5
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textAlignment = .left
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        return lable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Добавляем элементы на экран
        self.view.addSubview(publisherLabel)
        self.view.addSubview(weatherForecastLabel)
        self.view.addSubview(weatherImage)
        self.view.addSubview(weatherForecastButton)
        self.view.addSubview(numberSubscribersLabel)

        
        // Добавляем Constraint
        addConstraint()
    }
    
    private func addConstraint() {
        
        // расставляем элементы
        NSLayoutConstraint.activate([
            publisherLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            publisherLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            publisherLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            publisherLabel.heightAnchor.constraint(equalToConstant: 64),
            
            weatherForecastLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            weatherForecastLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            weatherForecastLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 16),
            weatherForecastLabel.heightAnchor.constraint(equalToConstant: 48),

            weatherForecastButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            weatherForecastButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            weatherForecastButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            weatherForecastButton.heightAnchor.constraint(equalToConstant: 48),
            
            weatherImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            weatherImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            weatherImage.topAnchor.constraint(equalTo: weatherForecastLabel.bottomAnchor, constant: 16),
            weatherImage.bottomAnchor.constraint(equalTo: numberSubscribersLabel.topAnchor, constant: -16),
            
            numberSubscribersLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            numberSubscribersLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            numberSubscribersLabel.bottomAnchor.constraint(equalTo: weatherForecastButton.topAnchor, constant: -16),
            numberSubscribersLabel.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    // Метод, генерирует погоду по нажатию на кнопку
    @objc
    func tapButton() {
        print(#function)
        publisherWeather.notify()
        weatherImage.image = UIImage(systemName: publisherWeather.imageWeather)
        numberSubscribersLabel.text = "   Number of subscribers: \(publisherWeather.observers.count)"
        
    }
}
