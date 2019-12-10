//
//  Interactor.swift
//  GM
//
//  Created by M D Holmberg II on 12/8/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import Foundation

class Interactor {
    private var commits: [Item]?
    
    func getCommits() {
        
        commits = loadJson(filename: "commitsData")
                   
        for i in 0..<getNumberOfCommits() {
            print("commit: \(author(index: i)), \(hash(index: i)), \(message(index: i))")
        }
    }
    
    func loadJson(filename: String) -> [Item]? {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.items
            } catch {
                fatalError("Couldn't load \(filename)")
            }
        }
        return nil
    }
    
    func getNumberOfCommits() -> Int {
        return self.commits!.count
    }
    
    func author(index: Int) -> String {
        return self.commits![index].commit.author.name
    }
    
    func hash(index: Int) -> String {
        return self.commits![index].sha
    }
    
    func message(index: Int) -> String {
        return self.commits![index].commit.message
    }
}
