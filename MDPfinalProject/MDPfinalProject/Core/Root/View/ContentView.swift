//
//  ContentView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct ContentView: View 
{
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View
    {
        Group
        {
            if viewModel.userSession != nil
            {
                MDPTabView()
            } else {
                LoginView()
            } // end if statement
        } //end group
    } // end body
} // end struct

#Preview {
    ContentView()
}
