//
//  PublisherViewController.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

class PublisherViewController: UIViewController {
    
    // Publisher
    var publisherWeather = Publisher()
    
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
    private lazy var subcruptionFirstLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "   Weather forecast subscription #1:"
        lable.textColor = .black
        lable.backgroundColor = .systemGray5
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textAlignment = .left
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        return lable
    }()
    
    // создаем UISwitch
    lazy var subscriptionFirstSwitch: UISwitch = {
        let mySwich = UISwitch()
        mySwich.translatesAutoresizingMaskIntoConstraints = false
        mySwich.addTarget(self, action: #selector(tapSwitch1), for: .valueChanged)
        return mySwich
    }()
    
    // создаем UILabel
    private lazy var subcruptionSecondLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "   Weather forecast subscription #2:"
        lable.textColor = .black
        lable.backgroundColor = .systemGray5
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textAlignment = .left
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        return lable
    }()
    
    // создаем UISwitch
    lazy var subscriptionSecondSwitch: UISwitch = {
        let mySwich = UISwitch()
        mySwich.translatesAutoresizingMaskIntoConstraints = false
        mySwich.addTarget(self, action: #selector(tapSwitch2), for: .valueChanged)
        return mySwich
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Добавляем элементы на экран
        self.view.addSubview(publisherLabel)
        self.view.addSubview(weatherForecastLabel)
        self.view.addSubview(weatherImage)
        self.view.addSubview(weatherForecastButton)
        self.view.addSubview(subcruptionFirstLabel)
        self.view.addSubview(subcruptionSecondLabel)
        self.view.addSubview(subscriptionFirstSwitch)
        self.view.addSubview(subscriptionSecondSwitch)

        
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
            weatherImage.bottomAnchor.constraint(equalTo: subcruptionFirstLabel.topAnchor, constant: -16),
            
            subcruptionFirstLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            subcruptionFirstLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            subcruptionFirstLabel.bottomAnchor.constraint(equalTo: subcruptionSecondLabel.topAnchor, constant: -16),
            subcruptionFirstLabel.heightAnchor.constraint(equalToConstant: 48),
            
            subscriptionFirstSwitch.centerYAnchor.constraint(equalTo: subcruptionFirstLabel.centerYAnchor),
            subscriptionFirstSwitch.trailingAnchor.constraint(equalTo: subcruptionFirstLabel.trailingAnchor, constant: -16),
            
            subcruptionSecondLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            subcruptionSecondLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            subcruptionSecondLabel.bottomAnchor.constraint(equalTo: weatherForecastButton.topAnchor, constant: -16),
            subcruptionSecondLabel.heightAnchor.constraint(equalToConstant: 48),
            
            subscriptionSecondSwitch.centerYAnchor.constraint(equalTo: subcruptionSecondLabel.centerYAnchor),
            subscriptionSecondSwitch.trailingAnchor.constraint(equalTo: subcruptionSecondLabel.trailingAnchor, constant: -16),
        ])
    }
    
    // Метод, генерирует погоду по нажатию на кнопку
    @objc
    func tapButton() {
        publisherWeather.notify()
        weatherImage.image = UIImage(systemName: publisherWeather.imageWeather)
        print(observerFirst.weatherImage)
        print(observerSecond.weatherImage)
    }
    
    // Метод, реагирует на нажатие UISwitch1
    @objc
    func tapSwitch1(mySwitch: UISwitch) {
        if mySwitch.isOn {
            print("on obs1")
            publisherWeather.appendObserver(observerFirst)
        } else {
            print("off obs1")
            publisherWeather.removeObserver(observerFirst)
        }
    }
    
    // Метод, реагирует на нажатие UISwitch2
    @objc
    func tapSwitch2(mySwitch: UISwitch) {
        if mySwitch.isOn {
            print("on obs2")
            publisherWeather.appendObserver(observerSecond)
        } else {
            print("off obs2")
            publisherWeather.removeObserver(observerSecond)
        }
    }
}
