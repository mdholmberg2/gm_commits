//
//  Item.swift
//  GM
//
//  Created by M D Holmberg II on 12/10/19.
//  Copyright © 2019 M D Holmberg II. All rights reserved.
//

import Foundation

struct Item: Decodable {
    var sha: String
    var commit: Commit
}
