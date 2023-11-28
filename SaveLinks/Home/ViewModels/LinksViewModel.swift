//
//  LinksViewModel.swift
//  SaveLinks
//
//  Created by Macbook Pro on 27/11/2023.
//

import Foundation

class LinksViewModel: ObservableObject {
    let dataSercice = PersistenceController.shared
    @Published var links: [LinkCore] = []
    
    init() {
        getAllLinksInDb()
    }
    
    func getAllLinksInDb() {
        links = dataSercice.read()
    }
    
    func addLink(title: String, link: URL) {
        dataSercice.create(link: link, title: title)
        getAllLinksInDb()
    }
    
    func deleteLink(_ link: LinkCore) {
        dataSercice.delete(entity: link)
        getAllLinksInDb()
    }
}
