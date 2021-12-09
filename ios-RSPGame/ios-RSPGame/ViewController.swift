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
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var myPick: HandShape = HandShape.paper
    var comPick: HandShape = HandShape(rawValue: Int.random(in: 0...2))!
    
    var readyState: String = "준비 중 🤯"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        comChoiceLabel.text = readyState
        myChoiceLabel.text = readyState
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "가위":
            myPick = HandShape.scissors
        case "바위":
            myPick = HandShape.rock
        case "보":
            myPick = HandShape.paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        switch comPick {
        case .rock:
            (comChoiceImage.image, comChoiceLabel.text) = (#imageLiteral(resourceName: "rock"), "묵 !")
        case .scissors:
            (comChoiceImage.image, comChoiceLabel.text) = (#imageLiteral(resourceName: "scissors"), "가위 !")
        case .paper:
            (comChoiceImage.image, comChoiceLabel.text) = (#imageLiteral(resourceName: "paper"), "보 !")
        }
        
        switch myPick {
        case .rock:
            (myChoiceImage.image, myChoiceLabel.text) = (#imageLiteral(resourceName: "rock"), "묵 !")
        case .scissors:
            (myChoiceImage.image, myChoiceLabel.text) = (#imageLiteral(resourceName: "scissors"), "가위 !")
        case .paper:
            (myChoiceImage.image, myChoiceLabel.text) = (#imageLiteral(resourceName: "paper"), "보 !")
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
        comChoiceLabel.text = "준비 중 🤯"
        myChoiceLabel.text = "준비 중 🤯"
        
        comChoiceImage.image = #imageLiteral(resourceName: "ready")
        myChoiceImage.image = #imageLiteral(resourceName: "ready")
        
        mainLabel.text = "선택하세요 !"
    }
}

