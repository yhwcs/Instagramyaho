//
//  PeoplelistItem.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/19.
//

import Foundation

struct PeoplelistItem: Identifiable, Codable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
    var color: String
}
