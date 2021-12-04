//
//  ViewController.swift
//  ios-RSPGame
//
//  Created by 이성노 on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comChoiceImage: UIImageView!
    @IBOutlet weak var myChoiceImage: UIImageView!
    
    @IBOutlet weak var comChoicePick: UILabel!
    @IBOutlet weak var myChoicePick: UILabel!
    
    var myPick: Rsp = Rsp.paper
    var comPick: Rsp = Rsp(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comChoicePick.text = "준비 중 🤯"
        myChoicePick.text = "준비 중 🤯"
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "가위":
            myPick = Rsp.scissors
        case "바위":
            myPick = Rsp.rock
        case "보":
            myPick = Rsp.paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        switch comPick {
        case .rock:
            comChoiceImage.image = #imageLiteral(resourceName: "rock")
            comChoicePick.text = "묵 !"
        case .scissors:
            comChoiceImage.image = #imageLiteral(resourceName: "scissors")
            comChoicePick.text = "가위 !"
        case .paper:
            comChoiceImage.image = #imageLiteral(resourceName: "paper")
            comChoicePick.text = "보 !"
        }
        
        switch myPick {
        case .rock:
            myChoiceImage.image = #imageLiteral(resourceName: "rock")
            myChoicePick.text = "묵 !"
        case .scissors:
            myChoiceImage.image = #imageLiteral(resourceName: "scissors")
            myChoicePick.text = "가위 !"
        case .paper:
            myChoiceImage.image = #imageLiteral(resourceName: "paper")
            myChoicePick.text = "보 !"
        }
        
        switch myPick {
        case .rock:
            switch comPick {
            case .rock:
                mainLabel.text = GameResult.draw.rawValue
            case .scissors:
                mainLabel.text = GameResult.win.rawValue
            case .paper:
                mainLabel.text = GameResult.lose.rawValue
            }
        case .scissors:
            switch comPick {
            case .rock:
                mainLabel.text = GameResult.lose.rawValue
            case .scissors:
                mainLabel.text = GameResult.draw.rawValue
            case .paper:
                mainLabel.text = GameResult.win.rawValue
            }
        case .paper:
            switch comPick {
            case .rock:
                mainLabel.text = GameResult.win.rawValue
            case .scissors:
                mainLabel.text = GameResult.lose.rawValue
            case .paper:
                mainLabel.text = GameResult.draw.rawValue
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comChoicePick.text = "준비 중 🤯"
        myChoicePick.text = "준비 중 🤯"
        
        comChoiceImage.image = #imageLiteral(resourceName: "ready")
        myChoiceImage.image = #imageLiteral(resourceName: "ready")
        
        mainLabel.text = "선택하세요 !"
    }
}

