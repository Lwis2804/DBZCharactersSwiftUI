//
//  ContentView.swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 06/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = DBViewModel()
    
    private let numberOfColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: numberOfColumns, spacing: 10) {
                    ForEach(viewModel.characters, id: \.id) { dbChar in
                        VStack{
                            Text(dbChar.name)
                            Text(dbChar.image)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
