//
//  Model.swift
//  GREENTRaiL
//
//  Created by Ruth Lu on 1/2/24.
//

import Foundation

struct user: Codable {
    var age: Int = 1
    var gender: String = ""
    var height: Float = 1
    var weight: Float = 1
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var aerobicfitnessrating: Int = 1
    var hikes: [String] = [""]
    var location: [Float] = [1]
}


struct trails: Codable {
    var active: Bool = false
    var difficulty: Int = 3
    var location: [Float] = [3.0]
    var hikes: [String] = ["hi"]
    var name: String
}

struct hike: Codable {
    var bpm: [Int]
    var distance: [Float]
    var duration: Int
    var elevation: [Float]
    var name: String
    var time: [Float]
    var trail: String
}

struct workout {
    var max_bpm: Int
    var startTime: String
    var endTime: String
}
