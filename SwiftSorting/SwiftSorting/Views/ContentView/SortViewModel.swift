//
//  SortViewModel.swift
//  SwiftSorting
//
//  Created by Eugene Goloboyar on 17.02.2023.
//

import Combine

class SortViewModel: ObservableObject {
    @Published var currentText: String = ""
    @Published var array: [SortingItem] = []
    
    let textFieldPlaceholder = "Please enter a new value"
    
    func addValue() {
        if let value = Int(currentText) {
            array.append(SortingItem(value: value))
            currentText = ""
        }
    }
}
