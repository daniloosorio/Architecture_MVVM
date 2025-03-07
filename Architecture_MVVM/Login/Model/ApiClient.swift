//
//  ApiClient.swift
//  Architecture_MVVM
//
//  Created by Danilo Osorio on 4/03/25.
//

import Foundation

enum BackendError:String,Error {
    case invalidEmail = "email invalido"
    case invalidPassword = "contraseña incorrecta"
}

final class ApiClient {
    func login(withEmail email:String, password:String) async throws -> User {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return try simulateBackendLogic(email: email, password: password)
    }
    
}
func simulateBackendLogic(email: String, password:String) throws -> User {
    guard email == "danilo@gmail.com" else {
        print("el usuario invalido")
        throw BackendError.invalidEmail
    }
    guard password == "123456" else {
        print("contraseña incorrecta")
        throw BackendError.invalidPassword
    }
    print("succes")
    return .init(name:"danilo",token: "asdada",sessionStart: .now)
}
