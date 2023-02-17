//
//  ContentView.swift
//  SwiftSorting
//
//  Created by Eugene Goloboyar on 17.02.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: SortViewModel = SortViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // MARK: - Input
                
                HStack {
                    TextField(viewModel.textFieldPlaceholder, text: $viewModel.currentText)
                        .keyboardType(.numberPad)
                    
                    Button {
                        withAnimation {
                            viewModel.addValue()
                        }
                    } label: {
                        Text("Add")
                    }.buttonStyle(.borderedProminent)
                    
                }.padding(.horizontal)
                
                // MARK: - Menu
                
                HStack {
                    Button {
                        viewModel.sortArray()
                        print("start")
                    } label: {
                        Text("Sort")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Button {
                        viewModel.stepBack()
                    } label: {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 30))
                    }
                    
                    Button {
                        viewModel.stepForward()
                    } label: {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 30))
                    }
                    
                    Button {
                        viewModel.clear()
                    } label: {
                            Image(systemName: "trash")
                                .font(.system(size: 30))

                    }

                }
                .padding(.horizontal)
                
                // MARK: - List
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.array) { item in
                            ItemView(item: item)
                        }
                    }.frame(maxHeight: 50)
                }.padding(.horizontal)
  
                Spacer()
            }
            .navigationTitle("Swift sorting")
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
