//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Glayce on 25/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import Foundation

class Quiz {
    //Variaveis da classe
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    //Construtor da classe
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validateOption(_ index: Int) -> Bool{
        //Recupera a resposta conforme o indice
        let answer = options[index]
        
        return answer == correctedAnswer
    }
    
    deinit {
        print("Liberou quiz da memória")
    }
}
