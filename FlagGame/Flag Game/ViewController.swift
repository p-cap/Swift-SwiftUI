//
//  ViewController.swift
//  Project2
//
//  Created by Paul Capili on 2/4/21.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    // global variables
    var countries = Countries()
    var correctAnswer = 0
    var score1: Int = 0 {
        didSet {
            player1Score.text = "Player 1 Score: \(score1)"
        }
    }
    var score2: Int = 0 {
        didSet {
            player2Score.text = "Player 2 Score: \(score2)"
         
        }
    }
    
    
    // 3 Buttons with the flags
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    // label that indicates who's turn is it
    @IBOutlet var player1Turn: UILabel!
    @IBOutlet var player2Turn: UILabel!
    
    // labels for the scoreboard
    @IBOutlet var player1Score: UILabel!
    @IBOutlet var player2Score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // call the method for a shuffled country array
        askQuestions()
        
        // Nav bar background color and text
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        // Player Turn initial config
        player1Turn.text = "Player 1"
        player2Turn.text = "Player 2"
        
        player1Turn.numberOfLines = 0
        player2Turn.numberOfLines = 0
        
        player1Turn.isHidden = false
        player2Turn.isHidden = true

        player1Turn.font = player1Turn.font.withSize(30)
        player2Turn.font = player2Turn.font.withSize(30)
        
        // score board
        player1Score.text = "Player 1 Score:  \(score1)"
        player2Score.text = "Player 2 Score:  \(score2)"
        
        player1Score.font = player1Score.font.withSize(35)
        player2Score.font = player2Score.font.withSize(35)

    }
    
    
    // functions and button actions
    func askQuestions(action: UIAlertAction! = nil) {
        countries.list.shuffle()
        button1.setImage(UIImage(named: countries.list[0]), for: .normal)
        button2.setImage(UIImage(named: countries.list[1]), for: .normal)
        button3.setImage(UIImage(named: countries.list[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries.list[correctAnswer]
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if player2Turn.isHidden {
            if sender.tag == correctAnswer {
               title = "Correct"
               score1 += 1
            } else {
               title = "Wrong"
               score1 -= 1
            }
            let ac = UIAlertController(title: title, message: "Player1 score: \(score1)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
            present(ac, animated: true)
        }
            
        if player1Turn.isHidden {
            if sender.tag == correctAnswer {
               title = "Correct"
               score2 += 1
            } else {
               title = "Wrong"
               score2 -= 1
            }
            let ac = UIAlertController(title: title, message: "Player2 score:  \(score2)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
            present(ac, animated: true)
           }
        
        // allows to hide the label to indicate the turn of the player
        player1Turn.isHidden = !player1Turn.isHidden
        player2Turn.isHidden = !player2Turn.isHidden

    }
}

