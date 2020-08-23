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
    var body: some View {
        TextField(placeholder, text: $fieldString).disabled(true)
            .overlay(
                Button(action: {
                    withAnimation {
                        presentPicker = true
                    }
                }) {
                    Rectangle().foregroundColor(Color.clear)
                }
            )
    }
}

struct CustomPickerTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerTextView(presentPicker: .constant(false), fieldString: .constant(""), placeholder: "")
    }
}
