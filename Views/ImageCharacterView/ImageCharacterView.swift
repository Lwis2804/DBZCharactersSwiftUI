//
//  ImageCharacterView.swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 09/09/24.
//

import SwiftUI
import Kingfisher

struct ImageCharacterView: View {
    
    let url : String
    let width : CGFloat
    let height : CGFloat
    
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
            .frame(width: width, height: height)
    }
}

#Preview {
    ImageCharacterView(url: MockData.dbCharacters[0].image, width: 100, height: 150)
}
