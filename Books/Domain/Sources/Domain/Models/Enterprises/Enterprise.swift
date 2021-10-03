//
//  Enterprise.swift
//  
//
//  Created by Daniel Gomes on 03/10/21.
//

public struct Enterprise: Codable {

    public let identifier: Int
    public let name: String
    public let photo: String
    public let description: String
    public let city: String
    public let country: String
    public let sharePrice: Double
    public let type: EnterpriseType

    enum CodingKeys: String, CodingKey {

        case photo, description, city, country
        case identifier = "id"
        case name = "enterprise_name"
        case sharePrice = "share_price"
        case type = "enterprise_type"
    }
}
