//
//  ViewController.swift
//  Dicee
//
//  Created by Praveen on 11/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImageView1.image = UIImage(named: "Dice6.png")
        diceImageView2.image = UIImage(named: "Dice4.png")
    }
    
    
    @IBAction func rollButton(_ sender: Any) {
        let randomNumber1 = getRandomNumberBetweenOneToSix()
        let randomNumber2 = getRandomNumberBetweenOneToSix()
        diceImageView1.image = UIImage(named: "Dice\(randomNumber1).png")
        diceImageView2.image = UIImage(named: "Dice\(randomNumber2).png")
    }
    
    func getRandomNumberBetweenOneToSix() -> Int {
        let value = Int.random(in: 1...6)
        return value
    }
    

}

