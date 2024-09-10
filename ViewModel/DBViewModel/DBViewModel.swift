//
//  DBViewModel.swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 09/09/24.
//

import Foundation

class DBViewModel : ObservableObject {
    @Published var characters : [DBZCharacter] = []
    
    private let service = NetworkManager.shared // porque tengo el network.shared
    
    private var page = 1
    
    init() {
        getListOfCharacters()
    }
    
    func getListOfCharacters() {
        service.getListOfCharacters(numberPage: page) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):  // duda aqui porque pone como constante el charactes y no un succes
                    self?.characters = characters.items
                case .failure(let error):
                    print("Debug : error \(error) ")
                }
            }
            
        }
    }
}
