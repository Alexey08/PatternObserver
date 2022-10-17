//
//  ObserverView.swift
//  PatternObserver
//
//  Created by Алексей Уланов on 14.10.2022.
//

import UIKit

class ObserverView: UIView {
    
    // создаем UILabel
    private lazy var observerLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Observer"
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
    
    // создаем UILabel
    private lazy var subcruptionLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "   Weather forecast subscription:"
        lable.textColor = .black
        lable.backgroundColor = .systemGray5
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textAlignment = .left
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        return lable
    }()
    
    // создаем UISwitch
    var subscriptionSwitch: UISwitch = {
        let mySwich = UISwitch()
        mySwich.translatesAutoresizingMaskIntoConstraints = false
        return mySwich
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // добавляем элементы view
        self.addSubview(observerLabel)
        self.addSubview(weatherForecastLabel)
        self.addSubview(weatherImage)
        self.addSubview(subcruptionLabel)
        self.addSubview(subscriptionSwitch)
        
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraint() {

        // расставляем элементы
        NSLayoutConstraint.activate([
            observerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            observerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            observerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            observerLabel.heightAnchor.constraint(equalToConstant: 64),
            
            weatherForecastLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            weatherForecastLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            weatherForecastLabel.topAnchor.constraint(equalTo: observerLabel.bottomAnchor, constant: 16),
            weatherForecastLabel.heightAnchor.constraint(equalToConstant: 48),
            
            subcruptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            subcruptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            subcruptionLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            subcruptionLabel.heightAnchor.constraint(equalToConstant: 48),
            
            subscriptionSwitch.centerYAnchor.constraint(equalTo: subcruptionLabel.centerYAnchor),
            subscriptionSwitch.trailingAnchor.constraint(equalTo: subcruptionLabel.trailingAnchor, constant: -16),
            
            weatherImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            weatherImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            weatherImage.topAnchor.constraint(equalTo: weatherForecastLabel.bottomAnchor, constant: 16),
            weatherImage.bottomAnchor.constraint(equalTo: subcruptionLabel.topAnchor, constant: -16)
        ])
    }
    
    // Метод, добавляет имя observerLabel
    func addNameLable(name: String){
        observerLabel.text = name
    }
    
    // Метол, для добавления картинки в weatherImage
    func addWeatherImage(weather: String){
        weatherImage.image = UIImage(systemName: weather)
    }
}
