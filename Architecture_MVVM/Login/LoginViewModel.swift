//
//  LoginViewModel.swift
//  Architecture_MVVM
//
//  Created by Danilo Osorio on 4/03/25.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var isEnable = false
    @Published var showLoading: Bool = false
    @Published var errorMessage: String = ""
    
    var cancellables = Set<AnyCancellable>()
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
        
        formValidation()
    }
    
    func formValidation() {
        Publishers.CombineLatest($email, $password)
            .sink{ value in
                self.isEnable = (self.email.count > 5 && self.password.count > 5 )
        }.store(in: &cancellables)
            
    }
    
    
    @MainActor
    func userLogin(withEmail email:String,
                   password: String){
        errorMessage = ""
        showLoading = true
        Task {
            do {
                let userModel = try await apiClient.login(withEmail: email, password: password)
            }catch let error as BackendError {
                errorMessage = error.rawValue
            }
            showLoading = false
        }
    }
}
