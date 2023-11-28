//
//  ContentView.swift
//  SaveLinks
//
//  Created by Macbook Pro on 27/11/2023.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openURL
    @StateObject var viewModel = LinksViewModel()
    @State var addLinkPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("MyLinks")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        addLinkPresented.toggle()
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .tint(.white)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                .background(
                    Rectangle()
                        .fill(.green).ignoresSafeArea()
                        .frame(height: 80)
                )
                
                
                List(viewModel.links) { link in
                    HStack {
                        VStack {
                            HStack {
                                Text(link.title ?? "")
                                    .font(.title3)
                                .bold()
                                Spacer(minLength: 0)
                            }
                            
                            HStack {
                                Text(link.link?.absoluteString ?? "")
                                Spacer(minLength: 0)
                            }
                        }
                        .padding()
                        
                        Spacer(minLength: 0)
                        
                        Button {
                            if let link = link.link {
                                openURL(link)
                            }
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title2)
                        }
                        .padding()
                        
                    }
                    .listRowSeparator(.hidden)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .shadow(radius: 2)
                    )
                    .buttonStyle(.plain)
                    .swipeActions(allowsFullSwipe: false) {
                        Button {
                            viewModel.deleteLink(link)
                        } label: {
                            Text("Delete")
                        }

                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.getAllLinksInDb()
            }
            .navigationDestination(isPresented: $addLinkPresented) {
                AddLinkView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
