//
//  AddLinkView.swift
//  SaveLinks
//
//  Created by Macbook Pro on 27/11/2023.
//

import SwiftUI

struct AddLinkView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddLinkViewModel()
    
    @State var title: String = ""
    @State var url: String = "https://"
    @State var showingAlert: Bool = false
    
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
                    Text("Add")
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
                
                VStack {
                    CustomTextField(title: "Title", value: $title)
                    CustomTextField(title: "Link", value: $url)
                    
                    Spacer()
                        .frame(height: 60)
                    Button {
                        if title.isEmpty || url.isEmpty {
                            showingAlert = true
                        } else {
                            if let url = URL(string: url) {
                                viewModel.addLink(title: title, link: url)
                            } else {
                                showingAlert = true
                            }
                        }
                        
                    } label: {
                        CustomButtonView(text: "Save")
                    }

                }
                .padding()
                
                Spacer(minLength: 0)
            }
            .alert("Please fill all the fields", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            .alert("Link successfully  saved", isPresented: $viewModel.isCompleted) {
                Button("OK", role: .cancel) { dismiss() }
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
