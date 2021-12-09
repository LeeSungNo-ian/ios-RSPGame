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
    
    var loadingTitle: String = "준비 중 🤯"
    var pleaseChoiceTitle: String = "선택하세요 !"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        comChoiceLabel.text = loadingTitle
        myChoiceLabel.text = loadingTitle
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
        setImageTitle(pick: computerRandomChoicePick)
        setImageTitle(pick: mySelectPickChoice)
        
        announceWhoWinner(myPick: mySelectPickChoice, comPick: computerRandomChoicePick)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comChoiceLabel.text = loadingTitle
        myChoiceLabel.text = loadingTitle
        
        comChoiceImage.image = #imageLiteral(resourceName: "ready")
        myChoiceImage.image = #imageLiteral(resourceName: "ready")
        
        mainLabel.text = pleaseChoiceTitle
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
    
    private func announceWhoWinner(myPick: HandShape, comPick: HandShape) {
        if myPick == comPick {
            mainLabel.text = GameResult.draw.rawValue
        } else if myPick == .rock && comPick == .scissors || myPick == .scissors && comPick == .paper || myPick == .paper && comPick == .rock {
            mainLabel.text = GameResult.win.rawValue
        } else {
            mainLabel.text = GameResult.lose.rawValue
        }
    }
}

