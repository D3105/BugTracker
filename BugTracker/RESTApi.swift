//
//  RESTApi.swift
//  BugTracker
//
//  Created by D on 3/25/18.
//  Copyright © 2018 D. All rights reserved.
//

import Foundation
import Moya
import Gloss

enum RESTApi {
    case createProblem(newProblem: JSONEncodable)
    case getProblem(id: String)
    case getAllProblems(minRating: Int?)
    case getAllParticipants
    case updateProblem(id: String, problemUpdate: JSONEncodable)
    case deleteProblem(id: String)
}

extension RESTApi: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }
    
    var path: String {
        switch self {
        case .createProblem, .getAllProblems:
            return "/problem"
        case .getProblem(let id), .updateProblem(let id, _), .deleteProblem(let id):
            return "/problem/\(id)"
        case .getAllParticipants:
            return "/participant"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProblem, .getAllProblems, .getAllParticipants:
            return .get
        case .createProblem:
            return .post
        case .updateProblem:
            return .put
        case .deleteProblem:
            return .delete
        }
    }
    
    var sampleData: Data {
        switch self {
        case .createProblem:
            return "df98544b-d477-4219-982c-91ea580e0c3b".utf8Encoded
        case .getProblem(let id):
            return """
            {
                "id": "\(id)",
                "name": "Cake",
                "description": "Give me my portion!",
                "rating": 9999,
                "participant": "Victory"
            }
            """.utf8Encoded
        case .getAllProblems:
            return """
            [
                {
                    "id": "90ee32af-9d11-43ea-be93-0009badff034",
                    "name": "Sleep",
                    "description": "I really want to sleep!",
                    "rating": 31,
                    "participant": "Alberto"
                },
                {
                    "id": "7b4c7da8-30ff-453c-94b9-1067104533d0",
                    "name": "Eat",
                    "description": "Can I taste a slice of pizza?",
                    "rating": 5,
                    "participant": "Alberto"
                }
            ]
            """.utf8Encoded
        case .getAllParticipants:
            return "AlbertoVictoryPeter".utf8Encoded
        case .updateProblem, .deleteProblem:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getAllParticipants, .deleteProblem, .getProblem:
            return .requestPlain
        case .createProblem(let newProblem):
            return .requestParameters(parameters: newProblem.toJSON()!, encoding: JSONEncoding.default)
//            return .requestJSONEncodable(problem.toJSON())
//            return .requestData
        case .updateProblem(_, let problemUpdate):
            return .requestParameters(parameters: problemUpdate.toJSON()!, encoding: JSONEncoding.default)
//            return .requestCompositeParameters(bodyParameters: problemUpdate.toJSON()!, bodyEncoding: JSONEncoding.default, urlParameters: ["id": id])
        case .getAllProblems(let minRating):
            if let minRating = minRating {
                return .requestParameters(parameters: ["minRating" : minRating], encoding: URLEncoding.queryString)
            } else {
                return .requestPlain
            }
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
