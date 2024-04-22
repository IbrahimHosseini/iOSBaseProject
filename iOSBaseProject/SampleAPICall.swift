//
//  SampleAPICall.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/22/24.
//

import Foundation

enum UserEndpoint: APIEndpoint {

    // MARK:  APIs
    /// get a user by id
    case getUser(_ id: String)

    /// update the user name
    case updateUserName(_ id: String, _ name: String)

    // MARK: Implementations
    /// set the path for every APIs
    var path: String {
        switch self {
        case .getUser(let id):
            "/user/\(id)"
        case .updateUserName(let id, _):
            "/update/user/\(id)"
        }
    }

    /// set the methods for APIs
    var method: HTTPMethod {
        switch self {
        case .getUser(_): .get
        case .updateUserName(_,_): .put
        }
    }

    /// set the parameters for APIs
    var parameters: [String : Any]? {
        switch self {
        case .getUser(_): nil
        case .updateUserName(_, let username): ["Username": username]
        }
    }
}
