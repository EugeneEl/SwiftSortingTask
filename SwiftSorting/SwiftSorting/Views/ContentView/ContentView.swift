//
//  ContentView.swift
//  SwiftSorting
//
//  Created by Eugene Goloboyar on 17.02.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel: SortViewModel = SortViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField(viewModel.textFieldPlaceholder, text: $viewModel.currentText)
                        .keyboardType(.numberPad)
                    
                    Button {
                        viewModel.addValue()
                    } label: {
                        Text("Add")
                    }.buttonStyle(.borderedProminent)
                    
                }.padding(.horizontal)
                
                LazyHStack {
                    ForEach(viewModel.array) { item in
                        Text("\(item.value)")
                            .fontWeight(.bold)
                            .frame(width: 30, height: 30)
                            .background(Color.yellow)
                            .clipShape(Circle())
                    }
                }
  

                Spacer()
            }
            .navigationTitle("Swift sorting")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
