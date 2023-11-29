//
//  Student.swift
//  Bookworm
//
//  Created by Michelle Trinh on 11/28/23.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

