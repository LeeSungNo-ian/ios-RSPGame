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
    
    var mySelectHandShape: HandShape = HandShape.paper
    var comSelectHandShape: HandShape = ComputerSelectRandomHandShape().computerRandomOptionSelector()
    
    var loadingMessage: String = "준비 중 🤯"
    var pleaseChoiceMessage: String = "선택하세요 !"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        comChoiceLabel.text = loadingMessage
        myChoiceLabel.text = loadingMessage
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "가위":
            mySelectHandShape = HandShape.scissors
        case "바위":
            mySelectHandShape = HandShape.rock
        case "보":
            mySelectHandShape = HandShape.paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        setImageTitle(pick: comSelectHandShape)
        setImageTitle(pick: mySelectHandShape)
        
        announceWhoWinner(myPick: mySelectHandShape, comPick: comSelectHandShape)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comChoiceLabel.text = loadingMessage
        myChoiceLabel.text = loadingMessage
        
        comChoiceImage.image = #imageLiteral(resourceName: "ready")
        myChoiceImage.image = #imageLiteral(resourceName: "ready")
        
        mainLabel.text = pleaseChoiceMessage
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
        
        if pick == comSelectHandShape {
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

