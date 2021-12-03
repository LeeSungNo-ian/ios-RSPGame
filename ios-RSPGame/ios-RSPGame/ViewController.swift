//
//  ViewController.swift
//  ios-RSPGame
//
//  Created by 이성노 on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        comChoiceLabel.text = "준비 중 입니다!"
        myChoiceLabel.text = "준비 중 입니다!"
        
    }

    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
    

}

