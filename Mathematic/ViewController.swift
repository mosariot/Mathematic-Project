//
//  ViewController.swift
//  Mathematic
//
//  Created by Александр Воробьев on 18.02.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func digitButtonPressed(_ sender: UIButton) {
        guard let answerDigit = sender.titleLabel?.text else { return }
        guard let answer = answerLabel.text else { return }
        
        switch answer {
        case "0":
            answerLabel.text = sender.titleLabel?.text
        default:
            answerLabel.text = answer + answerDigit
        }
    }
    
    @IBAction func deleteButtonPressed() {
        guard let answer = answerLabel.text else { return }
        guard answer.count > 0 else { return }
        
        let updatedAnswerLabel = String(answer.dropLast())
        answerLabel.text = updatedAnswerLabel
        if updatedAnswerLabel.count == 0 {
            answerLabel.text = "0"
        }
    }
    
    @IBAction func checkAnswer() {
        guard let answer = answerLabel.text else { return }
        guard let firstNumber = firstNumberLabel.text else { return }
        guard let secondNubmer = secondNumberLabel.text else { return }
        
        var sumCheck: String {
            if (Int(answer) ?? 0) == (Int(firstNumber) ?? 0) + (Int(secondNubmer) ?? 0) {
                    return "Верный!"
            } else {
                return "Неверный!"
            }
        }
        
        let alertCheck = UIAlertController(title: "Ваш ответ - \(sumCheck)", message: "", preferredStyle: .alert)
        let onceMore = UIAlertAction(title: "Заново", style: .default, handler: {(action) in self.updateUI() })
        alertCheck.addAction(onceMore)
        
        self.present(alertCheck, animated: true, completion: nil)
    }
    
    func updateUI() {
        firstNumberLabel.text = String(Int.random(in: 0...100))
        secondNumberLabel.text = String(Int.random(in: 0...100))
        answerLabel.text = "0"
    }
}
