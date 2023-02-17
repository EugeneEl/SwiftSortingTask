//
//  SortViewModel.swift
//  SwiftSorting
//
//  Created by Eugene Goloboyar on 17.02.2023.
//

import Combine
import Foundation

enum LoopState: Equatable {
    case notStarted
    case paused
    case looping(currentIndex: Int, previousIndex: Int?)
    case restarting(endIndex: Int)
    case swap(index1: Int, Index2: Int)
    case completed
}

class SortViewModel: ObservableObject {

    // MARK: - Properties
    
    @Published var state = LoopState.notStarted
    @Published var currentText = ""
    @Published var array: [SortingItem] = []
    
    static private let timeInterval: TimeInterval = 1
    let textFieldPlaceholder = "Please enter a new value"
    
    private var currentIndex = 0
    private lazy var endIndex = array.count - 1
    private var didPerformSwap = false
    private var timer: Timer?
    
    // MARK: - Public
    
    func clear() {
        currentText = ""
        array.removeAll()
        state = .notStarted
    }
    
    func addValue() {
        if let value = Int(currentText) {
            array.append(SortingItem(value: value))
            currentText = ""
        }
    }
    
    func sortArray() {
        var currentIndex = 0
        didPerformSwap = false
        state = .looping(currentIndex: currentIndex, previousIndex: nil)
        performSwap(currentIndex)
        
        timer = Timer.scheduledTimer(withTimeInterval: SortViewModel.timeInterval, repeats: true, block: { [weak self] (t) in
            guard let self = self else { return }
            currentIndex += 1
            self.performLoop(currentIndex, t)
        })
    }
    
    func stepBack() {
        pause()
        state = .restarting(endIndex: currentIndex - 1)
    }
    
    func stepForward() {
        pause()
        state = .restarting(endIndex: currentIndex + 1)
    }
    
    // MARK: - Private
    
    private func pause() {
        timer?.invalidate()
        state = .paused
    }
        
    private func performSwap(_ currentIndex: Int) {
        let shouldSwap = array[currentIndex].value > array[currentIndex + 1].value
        if shouldSwap {
            array.swapAt(currentIndex + 1, currentIndex)
            state = .swap(index1: currentIndex,
                               Index2: currentIndex + 1)
            didPerformSwap = true
        }
    }
    
    private func performLoop(_ currentIndex: Int, _ t: Timer) {
        let previousIndex = currentIndex - 1
        
        state = .looping(currentIndex: currentIndex,
                              previousIndex: previousIndex)
        
        let hasNotReachedEndIndex = currentIndex != endIndex
        if hasNotReachedEndIndex {
            performSwap(currentIndex)
        }
        
        let hasReachedEndIndex = currentIndex >= endIndex
        if hasReachedEndIndex {
            state = .restarting(endIndex: endIndex)
            if !didPerformSwap {
                state = .completed
                t.invalidate()
            }
            if didPerformSwap {
                sortArray()
                endIndex -= 1
            }
            t.invalidate()
        }
    }
}
