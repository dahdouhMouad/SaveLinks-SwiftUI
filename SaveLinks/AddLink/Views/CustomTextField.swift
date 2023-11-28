//
//  CustomTextField.swift
//  SaveLinks
//
//  Created by Macbook Pro on 28/11/2023.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @Binding var value: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                    .font(Font.custom("Colfax-Regular", size: 18))
                    .frame(alignment: .topLeading)
                    .padding(.top)
                Spacer()
            }
            TextField("", text: $value)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .font(Font.custom("Colfax-Regular", size: 16))
                .foregroundColor(.black)
                .frame(height: 40)
            Divider()
                .overlay {
                    Color.green
                        .frame(height: 1)
                }
                
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "Test Text Field", value: .constant("Mouaddhd10@gmail.com"))
    }
}
