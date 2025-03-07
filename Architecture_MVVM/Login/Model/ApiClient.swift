//
//  ApiClient.swift
//  Architecture_MVVM
//
//  Created by Danilo Osorio on 4/03/25.
//

import Foundation

final class ApiClient {
    func login(withEmail email:String, password:String) async throws {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
    }
    
}
func simulateBackendLogic(email: String, password:String){
    guard email == "danilo@gmail.com" else {
        print("el usuario invalido")
        return
    }
    guard password == "123456" else {
        print("contraseña incorrecta")
        return
    }
    print("succes")
}
