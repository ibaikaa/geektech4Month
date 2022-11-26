//
//  ViewController.swift
//  jokesApp
//
//  Created by ibaikaa on 25/11/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var networkManager = NetworkManager()
    
    private var controller: JokeController?
    
    var jokesData = [Joke]()
    
    private lazy var appLabel: UILabel = {
        let appLabel = UILabel()
        appLabel.text = "All jokes app 🤙🏻"
        appLabel.textAlignment = .center
        appLabel.textColor = .black
        appLabel.font = UIFont(name: "Avenir Next Bold", size: 35)
        return appLabel
    }()
    
    
    private lazy var jokeSetupLabel: UILabel = {
        let jokeSetupLabel = UILabel()
        jokeSetupLabel.numberOfLines = 0
        jokeSetupLabel.lineBreakMode = .byWordWrapping
        jokeSetupLabel.textColor = .black
        jokeSetupLabel.textAlignment = .center
        return jokeSetupLabel
    }()
    
    private lazy var jokePunchlineLabel: UILabel = {
        let jokePunchlineLabel = UILabel()
        jokePunchlineLabel.numberOfLines = 0
        jokePunchlineLabel.lineBreakMode = .byWordWrapping
        jokePunchlineLabel.textAlignment = .center
        jokePunchlineLabel.textColor = .black
        return jokePunchlineLabel
        
    }()
    
    private lazy var showPunchlineButton: UIButton = {
        let showPunchlineButton = UIButton(type: .system)
        showPunchlineButton.tintColor = .white
        showPunchlineButton.backgroundColor = .systemOrange
        showPunchlineButton.setTitle("Tell me a joke", for: .normal)
        showPunchlineButton.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 25)
        showPunchlineButton.layer.cornerRadius = 15
        showPunchlineButton.addTarget(self, action: #selector(showPunchline), for: .touchUpInside)
        return showPunchlineButton
    }()
    
    var isTimeToShowPunchline = false
    
    var jokeNumber = 0

    let punchlineAwaitingAnswers = ["What", "When", "Why", "Where", "Who", "How"]
    
    @objc func showPunchline() {
        
        if jokesData.isEmpty {
            jokeSetupLabel.text = "Упс, шутки еще не прогрузились. Попробуйте еще раз через 3 сек!"
        } else {
            
            if isTimeToShowPunchline {
                
                jokePunchlineLabel.text = "😂 \(jokesData[jokeNumber].punchline)"
                
                showPunchlineButton.setTitle("Next 🤣❤️‍🔥", for: .normal)
                
                isTimeToShowPunchline = !isTimeToShowPunchline
                
                jokeNumber = 0
                
            } else {
                
                let randomJokeNumber = Int.random(in: 0..<jokesData.count)
                
                jokeNumber = randomJokeNumber
    
                jokePunchlineLabel.text = ""
                
                jokeSetupLabel.text = "❗️: \(jokesData[randomJokeNumber].setup)"
                
                var firstWordOfSetup = jokesData[randomJokeNumber].setup.components(separatedBy: " ").first!
                
                
                if !punchlineAwaitingAnswers.contains(firstWordOfSetup) && !firstWordOfSetup.contains("'") {
                    firstWordOfSetup = "So"
                } else if !punchlineAwaitingAnswers.contains(firstWordOfSetup) && firstWordOfSetup.contains("'") {
                    for _ in 1...2{
                        firstWordOfSetup.removeLast()
                    }
                }
                
                firstWordOfSetup += "❓"
                
                showPunchlineButton.setTitle(firstWordOfSetup, for: .normal)
                
                isTimeToShowPunchline = !isTimeToShowPunchline
            }
            
        }
        


    }

    func updateUI() {
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 246/255, alpha: 255)

        
        view.addSubview(appLabel)
                
        appLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(jokeSetupLabel)
        
        jokeSetupLabel.snp.makeConstraints{ make in
            make.top.equalTo(appLabel.snp.bottom).offset(50)
            make.height.equalTo(100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(jokePunchlineLabel)
        jokePunchlineLabel.snp.makeConstraints{ make in
            make.top.equalTo(jokeSetupLabel.snp.bottom).offset(50)
            make.height.equalTo(100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(showPunchlineButton)
        
        showPunchlineButton.snp.makeConstraints{ make in
            make.top.equalTo(jokePunchlineLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        controller = JokeController(view: self)
        controller?.updateJokesList()
        
        
    }
        
    


}

