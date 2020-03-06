//
//  QuizViewController.swift
//  SingleViewUI2
//
//  Created by Muhammad Fawwaz Mayda on 05/03/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var option1Button: UIButton!
    
    @IBOutlet weak var option2Button: UIButton!
    
    @IBOutlet weak var option3Button: UIButton!
    
    @IBOutlet weak var option4Button: UIButton!
    
    //Question Related
    
    struct Question {
        let question :String
        let possibleAnswers : [String]
        let correctAnswerIndex : Int
    }
    
    var questionList : [Question] = []
    var answerGiven : [Int] = []
    var numQuestion = 2
    var numCorrect : Int = 0
    var currentQuestion : Int = 0
    func addQuestion(){
        var q = Question(question: "What is the size for VGG-16 input", possibleAnswers: ["278x278","324x324","224x224","244x244"], correctAnswerIndex : 2)
        questionList.append(q)

        q = Question(question: "Activation Function to combat Vanishing Gradient", possibleAnswers: ["Linear","tanH","Sigmoid","reLU"] , correctAnswerIndex: 3)
        questionList.append(q)
        
        q = Question(question: "Apple Specific ML", possibleAnswers: ["TensorFlow","PyTorch","MXNet","CoreML"], correctAnswerIndex: 3)
        questionList.append(q)
        
        numQuestion = questionList.count
    }
    
    func drawQuestion() {
        print("questionIndex: \(currentQuestion) numCorrect: \(numCorrect) numQuestion: \(numQuestion)")
        //Masih ada Quiz
        if(currentQuestion < numQuestion) {
            labelQuestion.text = questionList[currentQuestion].question
            let ansButton = questionList[currentQuestion].possibleAnswers
            option1Button.setTitle(ansButton[0], for: UIControl.State.normal)
            option2Button.setTitle(ansButton[1], for: UIControl.State.normal)
            option3Button.setTitle(ansButton[2], for: UIControl.State.normal)
            option4Button.setTitle(ansButton[3], for: UIControl.State.normal)
        } else {
            for i in 0..<numQuestion {
                if(answerGiven[i] == questionList[i].correctAnswerIndex){
                    numCorrect+=1
                }
            }
            labelQuestion.text = "Answer correct \(numCorrect) of \(numQuestion)"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("QUIZ VIEW")
        addQuestion()
        drawQuestion()
        // Do any additional setup after loading the view.
        // Edit Button Appreance
        giveButtonStyle(option1Button)
        giveButtonStyle(option2Button)
        giveButtonStyle(option3Button)
        giveButtonStyle(option4Button)
    }
    
    func giveButtonStyle(_ button : UIButton) {
        button.layer.cornerRadius = 7.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 1
        button.layer.shadowOpacity = 1.0
    }
    
    
    @IBAction func button1Tapped(_ sender: UIButton) {
        print("One tapped")
        answerGiven.append(0)
        currentQuestion+=1
        drawQuestion()
    }
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        print("Second tapped")
        answerGiven.append(1)
        currentQuestion+=1
        drawQuestion()
    }
    
    @IBAction func button3Tapped(_ sender: UIButton) {
        print("Third tapped")
        answerGiven.append(2)
        currentQuestion+=1
        drawQuestion()
    }
    
    @IBAction func button4Tapped(_ sender: UIButton) {
        print("Fourth tapped")
        answerGiven.append(3)
        currentQuestion+=1
        drawQuestion()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
