//
//  AddLinkViewModel.swift
//  SaveLinks
//
//  Created by Macbook Pro on 28/11/2023.
//

import Foundation

class AddLinkViewModel: ObservableObject {
    let dataSercice = PersistenceController.shared
    
    @Published var isCompleted: Bool = false
 
    func addLink(title: String, link: URL) {
        dataSercice.create(link: link, title: title)
        isCompleted = true
    }
 
}
