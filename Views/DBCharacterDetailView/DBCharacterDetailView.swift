//
//  DBCharacterDetailView.swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 11/09/24.
//

import SwiftUI

struct DBCharacterDetailView: View {
    
    @State private var isAnimating = false
    @StateObject var viewModel : DBViewModel
    
    let dbChar : DBZCharacter
    var body: some View {
        ScrollView{
            VStack(spacing : 18){
                ZStack{
                    GifWebView(gifName: dbChar.race == "Saiyan" ? "fondo2" : "fondo")
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                    
                    VStack{
                        ImageCharacterView(url: dbChar.image, width: 140, height: 230)
                            .shadow(radius: 12)
                            .scaleEffect(isAnimating ? 1.2 : 0.7)
                            .padding(.top, 40 )
                        
                        Text(dbChar.name)
                            .font(.largeTitle)
                            .foregroundColor(Color("TextColor"))
                    }
                }
                
                Text(dbChar.description)
                    .font(.footnote)
                
                // TANSFROMACIONES
                
                HStack{
                    Text(" ki \(dbChar.ki)")
                    
                    Text(" Maxki \(dbChar.maxKi)")
                        .foregroundStyle(.gray)
                }
                .font(.caption)
                .padding(24)
                
                HStack{
                    Text(dbChar.race)
                        .foregroundColor(.red)
                    
                    Text("-")
                    
                    Text(dbChar.affiliation)
                        .font(.subheadline)
                }
                .font(.caption)
                .padding(24)
                
            } // Vstack
            .padding()
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    withAnimation{
                        isAnimating = true
                    }
                }
            }
        }
    }
}

#Preview {
    DBCharacterDetailView(viewModel: DBViewModel(), dbChar: MockData.dbCharacters[1])
}
