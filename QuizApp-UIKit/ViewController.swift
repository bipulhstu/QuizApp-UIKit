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
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default){ _ in
            self.nextQuestion()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func check(selectedAnswer answer: Int) {
        let currentQuestion = questions[currentQuestionIndex]
        var alertTitle = ""
        var alertMessage = ""
        
        if currentQuestion.correctAnswer == answer {
            print("Answer is correct")
            score += 1
            scoreLabel.text = "Score :\(score)"
            alertTitle = "Correct"
            alertMessage = "You got it right"

        } else {
            print("Answer is incorrect")
            alertTitle = "Incorrect"
            alertMessage = "You got it wrong"
            
        }
        
        //if last question
        if currentQuestionIndex == questions.count - 1 {
            alertTitle = "End of Quiz"
            alertMessage = "Your final score is \(score)/ \(questions.count)"
        }

        showAlert(title: alertTitle, message: alertMessage)
    }

    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        check(selectedAnswer: sender.tag)
        /*if sender.tag == 1 {
            check(selectedAnswer: 1)
        } else if sender.tag == 2 {
            check(selectedAnswer: 2)
        } else if sender.tag == 3 {
            check(selectedAnswer: 3)
        }*/
        
    }
}

