//
//  FileMatcher.swift
//  FileMatcher
//
//  Created by Jun woo Park on 2017. 3. 25..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import Foundation

class FileMatcher {
    var path: String
    var filename: String
    
    init() {
        path = String()
        filename = String()
    }
    
    func allFiles(path: String) -> [String] {
        let fileManager = FileManager.default
        var contentsAtPath = [String]()
        do {
            contentsAtPath = try fileManager.contentsOfDirectory(atPath: path)
        } catch {
            print(error)
        }
        return contentsAtPath
    }
    
    
    func isExist(filename: String, atPath: String) -> Bool {
        let fileMatcher = FileMatcher()
        var contentsAtPath: [String] = fileMatcher.allFiles(path: atPath)
        for file in contentsAtPath {
            if file == filename {
                return true
            }
        }
        return false
    }
    
    func sortFile(atPath: String) -> [String] {
        let fileMatcher = FileMatcher()
        var contentsAtPath: [String] = fileMatcher.allFiles(path: atPath)
        return contentsAtPath.sorted( )
    }
}
