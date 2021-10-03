//
//  EnterpriseType.swift
//  
//
//  Created by Daniel Gomes on 03/10/21.
//

public struct EnterpriseType: Codable {

    public let identifier: Int
    public let type: String

    enum CodingKeys: String, CodingKey {

        case identifier = "id"
        case type = "enterprise_type_name"
    }
}
