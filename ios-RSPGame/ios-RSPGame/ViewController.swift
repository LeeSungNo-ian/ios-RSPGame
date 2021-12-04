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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comChoicePick.text = "준비 중 🤯"
        myChoicePick.text = "준비 중 🤯"
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        let title = sender.currentTitle!
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
    }
    
    
    
    
    
}

