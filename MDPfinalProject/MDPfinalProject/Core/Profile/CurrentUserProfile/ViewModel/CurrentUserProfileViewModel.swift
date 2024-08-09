//
//  ProfileViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI


class CurrentUserProfileViewModel: ObservableObject
{
    @Published var currentUser : User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    } // end init
    
    private func setupSubscribers()
    {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    } // end func setuo subscribers
} // end class profile view model

