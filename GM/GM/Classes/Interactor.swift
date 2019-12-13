//
//  Interactor.swift
//  GM
//
//  Created by M D Holmberg II on 12/8/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import Foundation

protocol ApiResult: class {
    func didReceiveResponse()
    func didReceiveError(message: String)
    func didRestCommits()
}

class Interactor {
    private let url = "https://api.github.com/search/commits?q=repo:mdholmberg2/gm_commits+author-name:donHolmberg"
    private var commits: [Item]?
    
    var delegate: ApiResult? = nil
    
    func loadCommits() {
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "GET"
        request.addValue("application/vnd.github.cloak-preview", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error!)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                self.delegate?.didReceiveError(message: "HTTP Status Code: \(httpStatus.statusCode)")
                return
            }
            
            self.commits = self.loadResponse(data: data)
            self.commits?.sort(by: {
                $0.commit.author.date > $1.commit.author.date
            })
            self.delegate?.didReceiveResponse()
        }
        task.resume()
    }
    
    func loadResponse(data: Data) -> [Item]? {
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.items
        } catch {
            fatalError("Couldn't load response!")
        }
    }
    
    func resetCommits() {
        self.commits?.removeAll()
        self.delegate?.didRestCommits()
    }
    
    func getNumberOfCommits() -> Int {
        if let count = self.commits?.count {
            return count
        } else {
            return 0
        }
    }
    
    func author(index: Int) -> String {
        return self.commits![index].commit.author.name
    }
    
    func sha(index: Int) -> String {
        return self.commits![index].sha
    }
    
    func message(index: Int) -> String {
        return self.commits![index].commit.message
    }
}
