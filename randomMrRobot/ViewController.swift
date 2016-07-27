//
//  ViewController.swift
//  randomMrRobot
//
//  Created by Paige Walters on 7/19/16.
//  Copyright © 2016 Paige Walters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let quotes = ["We are in a war, and we are on the losing side of it.\nWe are on our knees with guns to our heads, and they are picking us off one by one.", "How do I take off a mask when it stops being a mask?\nWhen it's as much a part of me as me?"]

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var quoteLabel: UILabel!

    var correctAnswers = "0"
    var usersAnswer = "Darlene"
    var stringAnswer = "Darlene"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func randomQuote() -> String {
        let idx = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[idx]
    }
    
    func setupView() {
        quoteLabel.text = randomQuote()
        answerIndex()
    }
    
    func correctAnswer() {
            switch correctAnswers {
            case "0":
                stringAnswer = "Darlene"
                print("\(correctAnswers) is Darlene")
            case "1":
                stringAnswer = "Elliot"
                print("\(correctAnswers) is Elliot")
            default:
                print("\(correctAnswers) that is not the answer")
            }
        

        comparingAnswers()
    }
    
    func comparingAnswers(){
        if usersAnswer == stringAnswer {
            let alertController = UIAlertController(title: "Correct", message: "You're freaking awesome!", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Next", style: .Cancel) { (action) in
                self.setupView()
                self.answerIndex()
            }
            alertController.addAction(cancelAction)
            
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }

            print("YOU ARE CORRECT! :)")
        } else {
            print("Try Again :(")
            
            let alertController = UIAlertController(title: "Incorrect", message: "Better luck next time, buddy!", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Next", style: .Cancel) { (action) in
                self.setupView()
                self.answerIndex()
            }
            alertController.addAction(cancelAction)
            
      
            self.presentViewController(alertController, animated: true) {
                // ...
            }
        }
    }
    func answerIndex() {
        let answerIndex = quotes.indexOf(quoteLabel.text!)!
        correctAnswers = "\(answerIndex)"
        print(answerIndex)
    }

    @IBAction func randomBtn(sender: AnyObject) {
       setupView()
    }
    
    @IBAction func buttonOne(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
        
    }
    
    @IBAction func buttonTwo(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
    }
    
    @IBAction func buttonThree(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
    }
    @IBAction func buttonFour(sender: AnyObject) {
        print(sender.currentTitle!!)
        usersAnswer = sender.currentTitle!!
        correctAnswer()
    }
}
