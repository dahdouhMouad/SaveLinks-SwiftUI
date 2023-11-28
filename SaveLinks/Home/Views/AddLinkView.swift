//
//  AddLinkView.swift
//  SaveLinks
//
//  Created by Macbook Pro on 27/11/2023.
//

import SwiftUI

struct AddLinkView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .bold()
                            .tint(.white)
                    }
                    Text("Edit")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
           
                }
                .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                .background(
                    Rectangle()
                        .fill(.green).ignoresSafeArea()
                        .frame(height: 80)
                )
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct AddLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddLinkView()
    }
}
