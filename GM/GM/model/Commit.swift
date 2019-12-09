//
//  Commit.swift
//  GM
//
//  Created by M D Holmberg II on 12/8/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import Foundation

struct Commit: Codable {
    var author: Author
    var sha: String
    var message: String
}
