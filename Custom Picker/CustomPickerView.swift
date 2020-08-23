//
//  CustomPickerView.swift
//  Custom Picker
//
//  Created by Niraj on 23/08/2020.
//

import SwiftUI

protocol CustomPicker {
    func saveUpdate(_ newItem: String)
}

struct CustomPickerView: View {
    var items: [String]
    @State private var filteredString: String = ""
    @State private var frameHeight: CGFloat = 400
    @State private var filteredItems: [String] = []

    @Binding var pickerField: String
    @Binding var presentPicker: Bool
    var saveUpdate: ((String) -> Void)?

    var body: some View {
        let filteredBinding = Binding<String>(
            get: {
                 filteredString
            }, set: {
                filteredString = $0
                if filteredString != "" {
                    filteredItems = items.filter { $0.lowercased().contains(filteredString.lowercased()) }
                } else {
                    filteredItems = items
                }
                setHeight()
            }
        )
        return ZStack {
            Color.black.opacity(0.4)
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Button(action: {
                            presentPicker = false
                        }) {
                            Text("Cancel")
                        }
                        .padding(10)
                        Spacer()

                        if let saveUpdate = saveUpdate {
                            Button(action: {
                                if !items.contains(filteredString) {
                                    saveUpdate(filteredString)
                                }
                                pickerField = filteredString
                                withAnimation {
                                    presentPicker = false
                                }
                            }) {
                                Image(systemName: "plus.circle")
                                    .frame(width: 44, height: 44)
                            }
                            .disabled(filteredString.isEmpty)
                        }
                    }
                    .background(Color(UIColor.gray))
                    .foregroundColor(Color.white)
                    Text("Tap an entry to select it, or add a new one")
                        .font(.caption)
                        .padding(.leading)

                    TextField("Enter search text", text: filteredBinding)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()


                    List {
                        ForEach(filteredItems, id: \.self) { item in
                            Button(action: {
                                pickerField = item
                                presentPicker = false
                            }) {
                                Text(item)
                            }
                        }
                    }
                }
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .frame(maxWidth: 400)
                .padding(.horizontal, 10)
                .frame(height: frameHeight)
                .padding(.top,40)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            filteredItems = items
            setHeight()
        }
    }

    fileprivate func setHeight() {
        withAnimation {
            if filteredItems.count > 5 {
                frameHeight = 400
            } else if filteredItems.count == 0 {
                frameHeight = 130
            } else {
                frameHeight = CGFloat(filteredItems.count * 45) + 130
            }
        }
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    static var sampleData = ["Apple","Mangoes","Corn","Bread", "Watermelon","Banana","Tee-Shirts"].sorted()
    static var previews: some View {
        CustomPickerView(items: sampleData, pickerField: .constant(""), presentPicker: .constant(false))
    }
}
