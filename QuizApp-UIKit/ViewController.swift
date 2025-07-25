//
//  ViewController.swift
//  QuizApp-UIKit
//
//  Created by Bipul Islam on 24/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
    let questions: [QuestionModel] = [
        QuestionModel(image: UIImage(named: "lion")!, correctAnswer: 2, answer1: "Hippo", answer2: "Lion", answer3: "Antelope"),
        QuestionModel(image: UIImage(named: "giraffe")!, correctAnswer: 1, answer1: "Giraffe", answer2: "Lion", answer3: "Antelope"),
        QuestionModel(image: UIImage(named: "buffalo")!, correctAnswer: 3, answer1: "Hippo", answer2: "Lion", answer3: "Buffalo"),
    ]
    var score = 0
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupQuestion()
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
        guard  currentQuestionIndex <= questions.count - 1 else {
            print("We have reached the end of the quiz")
            currentQuestionIndex = 0
            score = 0
            scoreLabel.text = "Score :\(score)"
            setupQuestion()
            return
        }
        setupQuestion()
        
    }
    
    func setupQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionImageView.image = currentQuestion.image
        answer1Button.setTitle(currentQuestion.answer1, for: .normal)
        answer2Button.setTitle(currentQuestion.answer2, for: .normal)
        answer3Button.setTitle(currentQuestion.answer3, for: .normal)
    }

    @IBAction func answer1ButtonTapped(_ sender: Any) {
        let currentQuestion = questions[currentQuestionIndex]
        if currentQuestion.correctAnswer == 1 {
            print("Answer is correct")
            showAlert(title: "Correct", message: "You got it right")
            
            score += 1
            scoreLabel.text = "Score :\(score)"
        } else {
            print("Answer is incorrect")
            showAlert(title: "Incorrect", message: "You got it wrong")
        }
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default){ _ in
            self.nextQuestion()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func answer2ButtonTapped(_ sender: Any) {
        let currentQuestion = questions[currentQuestionIndex]
        if currentQuestion.correctAnswer == 2 {
            print("Answer is correct")
            showAlert(title: "Correct", message: "You got it right")
            
            score += 1
            scoreLabel.text = "Score :\(score)"
        } else {
            print("Answer is incorrect")
            showAlert(title: "Incorrect", message: "You got it wrong")
        }
    }
    
    
    @IBAction func answer3ButtonTapped(_ sender: Any) {
        let currentQuestion = questions[currentQuestionIndex]
        if currentQuestion.correctAnswer == 3 {
            print("Answer is correct")
            showAlert(title: "Correct", message: "You got it right")
            
            score += 1
            scoreLabel.text = "Score :\(score)"
        } else {
            print("Answer is incorrect")
            showAlert(title: "Incorrect", message: "You got it wrong")
        }
        
    }
}

