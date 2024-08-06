//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Anastasiia Ki on 16.07.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
