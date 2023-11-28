//
//  Link.swift
//  SaveLinks
//
//  Created by Macbook Pro on 27/11/2023.
//

import Foundation

struct LinkModel: Hashable{
    var title: String
    var link: URL
    var date: Date = Date()
}
