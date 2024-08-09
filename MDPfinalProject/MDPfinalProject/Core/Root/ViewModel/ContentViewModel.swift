//
//  ContentViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import Foundation
import Combine
import Firebase

class  ContentViewModel: ObservableObject
{
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    } // end init
    
    private func setupSubscribers()
    {
        AuthService.shared.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    } // end func
} // end class
