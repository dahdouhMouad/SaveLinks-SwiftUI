//
//  CustomButtonView.swift
//  SaveLinks
//
//  Created by Macbook Pro on 28/11/2023.
//

import SwiftUI

struct CustomButtonView: View {
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.green)
            .frame(height: 50)
            .overlay {
                Text(text)
                    .font(Font.custom("Colfax-Regular", size: 20))
                    .kerning(0.4)
                    .foregroundColor(.white)
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Button {
                
            } label: {
                CustomButtonView(text: "Test")
            }
        }
        .padding()
    }
}
