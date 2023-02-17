//
//  SortViewModel.swift
//  SwiftSorting
//
//  Created by Eugene Goloboyar on 17.02.2023.
//

import Combine
import Foundation

class SortViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var currentText: String = ""
    @Published var array: [SortingItem] = []
    
    let textFieldPlaceholder = "Please enter a new value"
    
    var sortStepCounter = 0

    // MARK: - Public
    
    func clear() {
        currentText = ""
        array.removeAll()
    }
    
    func addValue() {
        if let value = Int(currentText) {
            array.append(SortingItem(value: value))
            currentText = ""
        }
    }
    
    func sortArray() {
        let last_position = array.count - 1
        var swap = true
        while swap == true {
            swap = false
            for i in 0..<last_position {
                if array[i].value > array[i + 1].value {
                    let temp = array [i + 1]
                    array [i + 1] = array[i]
                    array[i] = temp
                    
                    swap = true
                }
            }
        }
    }
}
