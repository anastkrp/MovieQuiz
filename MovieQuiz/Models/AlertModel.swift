//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Anastasiia Ki on 16.07.2024.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    var completion: () -> Void
}
