//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Anastasiia Ki on 11.08.2024.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func show(quiz result: QuizResultsViewModel)
    
    func stateButtons(isEnabled: Bool)
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func hideImageBorder()
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
}
