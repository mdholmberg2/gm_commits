//
//  Presenter.swift
//  GM
//
//  Created by M D Holmberg II on 12/8/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import Foundation

protocol CommitsResult: class {
    func shouldRefreshList()
    func shouldShowNetworkError(message: String)
}

class Presenter {
    private let interactor = Interactor()
    var delegate: CommitsResult? = nil
    
    init() {
        self.interactor.delegate = self
        refreshUI()
    }
    
    func refreshUI() {
        interactor.loadCommits()
    }
    
    func numberOfRows() -> Int {
        return interactor.getNumberOfCommits()
    }
    
    func author(row: Int) -> String {
        return interactor.author(index: row)
    }
    
    func sha(row: Int) -> String {
        return interactor.sha(index: row)
    }
    
    func message(row: Int) -> String {
        return interactor.message(index: row)
    }
}

extension Presenter: ApiResult {
    func didReceiveResponse() {
        delegate?.shouldRefreshList()
    }
    
    func didReceiveError(message: String) {
        delegate?.shouldShowNetworkError(message: message)
    }
}
