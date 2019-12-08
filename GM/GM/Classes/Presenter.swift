//
//  Presenter.swift
//  GM
//
//  Created by M D Holmberg II on 12/8/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import Foundation

class Presenter {
    private let interactor = Interactor()
    
    init() {
        interactor.getCommits()
    }
    
}
