//
//  ContentView.swift
//  Custom Picker
//
//  Created by Niraj on 2020-08-23.
//  Copyright © 2020 Technomystic. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var food = ""
    @State private var country = ""

    var body: some View {
            NavigationView {
                ZStack {
                    Color("Background")
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        TextField("Select Food Item", text: $food)
                        TextField("Select Country", text: $country)
                        Image("Working")
                            .resizable()
                            .frame(width: 400)
                            .scaledToFit()
                        Spacer()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 250)
                    .navigationBarTitle("Picker Demo")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
