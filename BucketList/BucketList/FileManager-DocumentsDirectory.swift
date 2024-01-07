//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Michelle Trinh on 1/6/24.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
