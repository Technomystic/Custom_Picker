//
//  ContentView.swift
//  Custom Picker
//
//  Created by Niraj on 2020-08-23.
//  Copyright © 2020 Technomystic. All rights reserved.
//

import SwiftUI

struct ContentView: View, CustomPicker {

    @State private var foodArray = ["Apple","Mangoes","Corn","Bread", "Watermelon","Banana","Tee-Shirts"]
    @State private var food = ""
    @State private var country = ""

    @State private var presentPicker = false

    var body: some View {
        ZStack {
            NavigationView {
                    ZStack {
                        Color("Background")
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Spacer()
                            CustomPickerTextView(presentPicker: $presentPicker, fieldString: $food, placeholder: "Select a food item")

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
            if presentPicker {
                CustomPickerView(items: foodArray.sorted(),
                                 pickerField: $food,
                                 presentPicker: $presentPicker, saveUpdate: saveUpdate)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
        }
    }

    func saveUpdate(_ newItem: String) {
        foodArray.append(newItem)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

