//
//  User.swift
//  
//
//  Created by Daniel Gomes on 30/09/21.
//

public struct User: Codable {

    public let investor: Investor
    public let isSuccess: Bool

    public init(investor: Investor, isSuccess: Bool) {
        self.investor = investor
        self.isSuccess = isSuccess
    }
}

extension User {

    enum CodingKeys: String, CodingKey {
        case investor
        case isSuccess = "success"
    }
}
