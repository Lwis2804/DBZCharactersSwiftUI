//
//  ErroeWebService .swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 06/09/24.
//

import Foundation

enum ErrorWebService : Error {
    case wrongUrl
    case wrongJson
    case wrongResponse
    
    func getMessage() -> String{
        switch self {
        case .wrongUrl:
            return "La URL esta mal"
        case .wrongJson:
            return "Fallo el Json"
        case .wrongResponse:
            return "No hay respuesta del servicio"
        }
    }
}
