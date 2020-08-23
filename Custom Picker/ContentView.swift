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
    @StateObject private var countriesVM = CountryViewModel()

    @State private var presentPicker = false
    @State private var tag: Int = 1

    var body: some View {
        ZStack {
            NavigationView {
                    ZStack {
                        Color("Background")
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Spacer()
                            CustomPickerTextView(presentPicker: $presentPicker, fieldString: $food, placeholder: "Select a food item", tag: $tag, selectedTag: 1)

                            CustomPickerTextView(presentPicker: $presentPicker, fieldString: $country, placeholder: "Select a country", tag: $tag, selectedTag: 2)
                            
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
                if tag == 1 {
                    CustomPickerView(items: foodArray.sorted(),
                                     pickerField: $food,
                                     presentPicker: $presentPicker, saveUpdate: saveUpdate)
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                } else {
                    CustomPickerView(items: countriesVM.countryNamesArray,
                                     pickerField: $country,
                                     presentPicker: $presentPicker)
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }

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

