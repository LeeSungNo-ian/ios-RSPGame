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
    
    var mySelectPickChoice: HandShape = HandShape.paper
    var computerRandomChoicePick: HandShape = ComputerOptionSelector().SelectorComputerRandomOption()
    
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
            mySelectPickChoice = HandShape.scissors
        case "바위":
            mySelectPickChoice = HandShape.rock
        case "보":
            mySelectPickChoice = HandShape.paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        setImageTitle(pick: mySelectPickChoice)
        setImageTitle(pick: computerRandomChoicePick)
        
        switch mySelectPickChoice {
        case .rock:
            switch computerRandomChoicePick {
            case .rock:
                mainLabel.text = GameResult.draw.rawValue
            case .scissors:
                mainLabel.text = GameResult.win.rawValue
            case .paper:
                mainLabel.text = GameResult.lose.rawValue
            }
        case .scissors:
            switch computerRandomChoicePick {
            case .rock:
                mainLabel.text = GameResult.lose.rawValue
            case .scissors:
                mainLabel.text = GameResult.draw.rawValue
            case .paper:
                mainLabel.text = GameResult.win.rawValue
            }
        case .paper:
            switch computerRandomChoicePick {
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
    
    private func setImageTitle(pick: HandShape) {
        var resourceName: String {
            switch pick {
            case .rock:
                return "rock"
            case .scissors:
                return "scissors"
            case .paper:
                return "paper"
            }
        }
        
        var handShapeName: String {
            switch pick {
            case .rock:
                return "묵 !"
            case .scissors:
                return "가위 !"
            case .paper:
                return "보"
            }
        }
        
        if pick == computerRandomChoicePick {
            (comChoiceImage.image, comChoiceLabel.text) = (#imageLiteral(resourceName: resourceName), handShapeName)
        } else {
            (myChoiceImage.image, myChoiceLabel.text) = (#imageLiteral(resourceName: resourceName), handShapeName)
        }
    }
    
    private func announceWinner() {
        
    }
}

