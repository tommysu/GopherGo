//
//  Count.swift
//  gophergo
//
//  Created by Tommy Su on 3/16/23.
//

import Foundation

class Count: ObservableObject{
    @Published var num = 5
}

class FoundCount: ObservableObject{
    @Published var num = 0
}
