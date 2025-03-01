//
//  NetworkManager.swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 06/09/24.
//

import Foundation

class NetworkManager : NSObject, ObservableObject {
    static let shared = NetworkManager()
    
    static let baseURL = "https://dragonball-api.com/api/characters?page="
    static let detailCharacterURL = "https://dragonball-api.com/api/characters/"
    
    func getListOfCharacters(numberPage : Int, completed : @escaping(Result<CharacterResponse, ErrorWebService>) ->  Void) {
        guard let url = URL(string: NetworkManager.baseURL+"\(numberPage)"+"&limit=20") else {
            completed(.failure(.wrongUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.wrongResponse))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else  {
                completed(.failure(.wrongResponse))
                return
            }
            guard let data = data else   {
                completed(.failure(.wrongResponse))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(CharacterResponse.self, from: data)
                completed(.success(decodedResponse))
            } catch  {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.wrongJson))
            }
        }
        task.resume()
    }
    
    
    func getDetailOfCharacters(numberOfCharacter: Int, completed: @escaping (Result<CharacterDetailResponse, ErrorWebService>) -> Void ) {
        guard let url = URL(string: NetworkManager.detailCharacterURL+"\(numberOfCharacter)" ) else {
            completed(.failure(.wrongUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.wrongUrl))
                return
            }
            guard let response  = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.wrongResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.wrongResponse))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodeResponse = try decoder.decode(CharacterDetailResponse.self, from: data)
                completed(.success(decodeResponse))
            }catch {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.wrongJson))
            }
        }
        task.resume()
    }
}

