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
        case .paper:
            comChoiceImage.image = #imageLiteral(resourceName: "paper")
            comChoicePick.text = "보 !"
        case .rock:
            comChoiceImage.image = #imageLiteral(resourceName: "rock")
            comChoicePick.text = "묵 !"
        case .scissors:
            comChoiceImage.image = #imageLiteral(resourceName: "scissors")
            comChoicePick.text = "가위 !"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
    
}

