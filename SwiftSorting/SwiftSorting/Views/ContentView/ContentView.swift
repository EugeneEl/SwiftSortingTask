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
                        viewModel.addValue()
                    } label: {
                        Text("Add")
                    }.buttonStyle(.borderedProminent)
                    
                }.padding(.horizontal)
                
                // MARK: - Menu
                
                HStack {
                    Button {
                        print("start")
                    } label: {
                        Text("Sort")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    Button {
                        print("back")
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 30))
                        }
                    }
                    
                    Button {
                        print("back")
                    } label: {
                        HStack {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 30))
                        }
                    }

                }
                .padding(.horizontal)
                
                // MARK: - List
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.array) { item in
                            ItemView(item: item)
                        }
                    }
                }
  
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
