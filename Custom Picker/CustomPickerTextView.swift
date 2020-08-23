//
//  CustomPickerTextView.swift
//  Custom Picker
//
//  Created by Niraj on 23/08/2020.
//

import SwiftUI

struct CustomPickerTextView: View {
    @Binding var presentPicker: Bool
    @Binding var fieldString : String
    var placeholder: String
    @Binding var tag: Int
    var selectedTag: Int
    var body: some View {
        TextField(placeholder, text: $fieldString).disabled(true)
            .overlay(
                Button(action: {
                    tag = selectedTag
                    withAnimation {
                        presentPicker = true
                    }
                }) {
                    Rectangle().foregroundColor(Color.clear)
                }
            )
    }
}
