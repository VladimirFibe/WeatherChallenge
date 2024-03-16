//
//  ViewController.swift
//  WeatherChallenge
//
//  Created by Vladimir Fibe on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "28"
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "London"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(label)
        view.addSubview(cityLabel)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            cityLabel.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -16)
        ])
        APIManager().load { [weak self] weather in
            DispatchQueue.main.async {
                self?.label.text = "\(weather.main.temp)"
            }
        }
    }


}

