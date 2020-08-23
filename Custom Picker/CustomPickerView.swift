//
//  CustomPickerView.swift
//  Custom Picker
//
//  Created by Niraj on 23/08/2020.
//

import SwiftUI

struct CustomPickerView: View {
    var items: [String]
    @State private var searchFilter: String = ""
    @State private var frameHeight: CGFloat = 400
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack() {
                        Button(action: {}) {
                            Text("Cancel")
                        }
                        .padding(10)
                        Spacer()
                    }
                    .background(Color(UIColor.gray))
                    .foregroundColor(Color.white)

                    TextField("Enter search text", text: $searchFilter)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    List {
                        ForEach(items, id: \.self) { item in
                            Button(action: {}) {
                                Text(item)
                            }
                        }
                    }
                }
            }
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .frame(maxWidth: 400)
            .padding(.horizontal, 10)
            .frame(height: frameHeight)
            .padding(.top,20)
            Spacer()

        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    static var sampleData = ["Apple","Mangoes","Corn","Bread", "Watermelon","Banana","Tee-Shirts"]
    static var previews: some View {
        CustomPickerView(items: sampleData)
    }
}
