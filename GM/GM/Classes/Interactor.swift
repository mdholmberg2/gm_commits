//
//  Interactor.swift
//  GM
//
//  Created by M D Holmberg II on 12/8/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import Foundation

class Interactor {
    private var commits = [Commit]()
    
    func getCommits() {
        self.commits.append(Commit(author: "John", hash: "kjhdsakjshd", message: "this is a commit(1)"))
        self.commits.append(Commit(author: "Harry", hash: "sdfawewe", message: "this is a commit(2)"))
        self.commits.append(Commit(author: "Shiela", hash: "afsdfs", message: "this is a commit(3)"))
        self.commits.append(Commit(author: "Becky", hash: "sdfafsdfsdfsdf", message: "this is a commit(4)"))
        
        print("commits... \(commits)")
    }
    
    func getNumberOfCommits() -> Int {
        return self.commits.count
    }
    
    func author(index: Int) -> String {
        return self.commits[index].author
    }
    
    func hash(index: Int) -> String {
        return self.commits[index].hash
    }
    
    func message(index: Int) -> String {
        return self.commits[index].message
    }
}
