//
//  Investor.swift
//  
//
//  Created by Daniel Gomes on 30/09/21.
//

public struct Investor: Codable {

    public let identifier: Int
    public let name: String
    public let email: String
    public let city: Self
    public let country: String
    public let balance: Double
    public let patrimony: Double
    public let isFirstAccess: Bool
    public let isAdmin: Bool

    public init(identifier: Int, name: String, email: String, city: Investor, country: String,
                balance: Double, patrimony: Double, isFirstAccess: Bool, isAdmin: Bool) {
        self.identifier = identifier
        self.name = name
        self.email = email
        self.city = city
        self.country = country
        self.balance = balance
        self.patrimony = patrimony
        self.isFirstAccess = isFirstAccess
        self.isAdmin = isAdmin
    }
}

extension Investor {

    enum CodingKeys: String, CodingKey {

        case identifier, name, email, city, country, balance
        case patrimony = "portfolio_value"
        case isFirstAccess = "first_access"
        case isAdmin = "super_angel"
    }
}
