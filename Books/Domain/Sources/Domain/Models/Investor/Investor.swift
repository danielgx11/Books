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
    public let city: String
    public let country: String
    public let balance: Double
    public let patrimony: Double
    public let isFirstAccess: Bool
    public let isAdmin: Bool

    enum CodingKeys: String, CodingKey {

        case identifier, name, email, city, country, balance
        case patrimony = "portfolio_value"
        case isFirstAccess = "first_access"
        case isAdmin = "super_angel"
    }
}
