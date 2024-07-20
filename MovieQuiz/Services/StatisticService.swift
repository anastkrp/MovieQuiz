//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Anastasiia Ki on 18.07.2024.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    
    private enum Keys: String {
        case correctAnswers
        case gamesCount
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
    }
    
    private let storage: UserDefaults = .standard
    
    private var correctAnswers: Int {
        get {
            return storage.integer(forKey: Keys.correctAnswers.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.correctAnswers.rawValue)
        }
    }
    
    var gamesCount: Int {
        get {
            return storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date =  storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        if correctAnswers == 0 {
            return 0
        }
        
        return Double(correctAnswers) / Double(gamesCount * 10) * 100
    }
    
    func store(correct count: Int, total amount: Int) {
        correctAnswers += count
        gamesCount += 1
        
        let newResult = GameResult(correct: count, total: amount, date: Date())
        
        if newResult.isBetterThan(bestGame) {
            self.bestGame = newResult
        }
    }
}

