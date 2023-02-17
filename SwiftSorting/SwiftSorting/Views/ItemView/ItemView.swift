//
//  ItemView.swift
//  SwiftSorting
//
//  Created by Eugene Goloboyar on 17.02.2023.
//

import SwiftUI

struct ItemView: View {
    
    // MARK: - Properties
    
    let item: SortingItem
    
    // MARK: - Body
    
    var body: some View {
        Text("\(item.value)")
            .fontWeight(.bold)
            .frame(width: 36, height: 36)
            .background(Color.yellow)
            .clipShape(Circle())
    }
}

// MARK: - Preview

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: SortingItem(value: 55))
            .previewLayout(.sizeThatFits)
    }
}
