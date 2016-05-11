//
//  QuestionList.swift
//  QuizApp
//
//  Created by Gabriel Velasquez on 4/24/16.
//  Copyright © 2016 CSUSM. All rights reserved.
//

import Foundation
import UIKit

class QuestionList {
    static let sharedQuestionList = QuestionList()
    
    //load this from plist
    private(set) var questions:[Int: [String]]
    
    //keep track of how many answers we got right
    //when grading quiz
    private(set) var numRight: Int
    
    //keep track if we got the question right or not
    private(set) var quesRight:[Bool]
    
    //store users answers here
    private(set) var answers:[Int: String]
    
    init() {
        //load questions into array from plist
    }
    
    //set an answer in the quiz
    func setAnswerTo(quesNum: Int, quesAns: String) {
        answers[quesNum] = quesAns
    }
    
    //reset an answer in the quiz
    func resetAnswer(quesNum: Int)
    {
        answers[quesNum] = ""
    }
    
    //if quiz graded successfull, true, otherwise, false
    func gradeQuiz() -> Bool
    {
        //go though all the questions
        for i in 0..<answers.count {
            
            //if its not answered
            if(answers[i] == ""){
                return false
            }
            
            else
            {
                //get the array for the question
                let qAns = questions[i]
                //is the user answer correct?
                if(answers[i] == qAns![1])
                {
                    quesRight[i] = true
                    numRight += 1
                }
                else
                {
                    quesRight[i] = false
                }
            }
            
        }
        
        return true
    }
    
    //return number correct
    func getNumCorrect() -> Int
    {
        return numRight
    }
    
    
    
}