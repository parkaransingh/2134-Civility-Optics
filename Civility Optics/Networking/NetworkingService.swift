//
//  NetworkingService.swift
//  Civility Optics
//
//  Created by Michael Verges on 9/4/21.
//

import Foundation
import CoreLocation

enum NetworkingService {
  static let baseURL = "http://localhost:5001/"
  static let url = URL(string: "http://localhost:5001/postRating")!
}

extension NetworkingService {
  
  /// - Returns: True if status is okay
  static func checkStatus(_ res: HTTPURLResponse) -> Bool {
    guard (200 ... 299) ~= res.statusCode else {
      print("statusCode should be 2XX, but is \(res.statusCode)")
      print("response = \(res)")
      return false
    }
    return true
  }
  
  static func printResponse(_ data: Data) {
    let resStr = String(data: data, encoding: .utf8)
    print("responseString = \(String(describing: resStr))")
  }
  
  static func submitRating(
    _ rating: Int, 
    date: Date, 
    tag: Array<String>, 
    comment: String? = nil, 
    id: String
  ) {
    var req = URLRequest(url:NetworkingService.url)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: AnyEncodable] = [
      "date_visited": AnyEncodable(date),
      "value": AnyEncodable(rating),
      "tags": AnyEncodable(tag),
      "review": AnyEncodable(comment),
      "place_id": AnyEncodable(id)
    ]
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      printResponse(data)
    }.resume()
  }
  
  static func getRating(
    placeID: String,
    completion: @escaping (Double?) -> ()
  ) {
    
    var req = URLRequest(url: URL(string: baseURL + "getRating")!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: String] = [
      "place_id": placeID
    ]
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      let result = try? JSONDecoder().decode([RatingResult].self, from: data)
      completion(result?.first?.avg_rating)
    }.resume()
  }
  
  static func searchResults(
    query: String, 
    sessionID: String, 
    completion: @escaping ([AutocompleteResult.Prediction]?) -> ()
  ) {
    var req = URLRequest(url: URL(string: baseURL + "getPlaceAutoComplete")!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: String] = [
      "input": query,
      "sessiontoken": sessionID,
      "latitude": "33.78232",
      "longitude": "-84.39645"
    ]
    
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      printResponse(data)
      
      let result = try? JSONDecoder().decode(AutocompleteResult.self, from: data)
      completion(result?.predictions)
    }.resume()
  }
  
  static func getPlaceDetails(
    placeID: String,
    sessionID: String,
    completion: @escaping (PlaceDetailsResult.Place?) -> ()
  ) {
    var req = URLRequest(url: URL(string: baseURL + "getPlaceDetails")!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: String] = [
      "place_id": placeID,
      "sessiontoken": sessionID,
    ]
    
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      printResponse(data)
      
      let result = try? JSONDecoder().decode(PlaceDetailsResult.self, from: data)
      completion(result?.result)
    }.resume()
  }
  
  static func getReviews(
    placeID: String, 
    completion: @escaping (ReviewsResult?) -> ()
  ) {
    var req = URLRequest(url: URL(string: baseURL + "getReviews")!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: AnyEncodable] = [
      "place_id": AnyEncodable(placeID),
      "limit": AnyEncodable(10),
    ]
    
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      printResponse(data)
      
      completion(try? JSONDecoder().decode(ReviewsResult.self, from: data))
    }.resume()
  }
  
  static func register(
    email: String, 
    password: String,
    name: String,
    race: String,
    disability: String,
    gender: String,
    completion: @escaping (AuthResult?) -> ()
  ) {
    var req = URLRequest(url: URL(string: baseURL + "users")!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: String] = [
      "email": email,
      "password": password,
      "name": name,
      "race": race,
      "disability": disability,
      "gender": gender
    ]
    
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      printResponse(data)
      
      completion(try? JSONDecoder().decode(AuthResult.self, from: data))
    }.resume()
  }

  static func businessRegister(
    email: String, 
    password: String,
    business_key: String,
    business_name: String,
    business_addr: String,
    completion: @escaping (AuthResult?) -> ()
  ) {
    var req = URLRequest(url: URL(string: baseURL + "businesses")!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: String] = [
      "email": email,
      "password": password,
      "business_key": business_key,
      "business_name": business_name,
      "business_addr": business_addr
    ]
    
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      printResponse(data)
      
      completion(try? JSONDecoder().decode(AuthResult.self, from: data))
    }.resume()
  }
  
  static func login(
    email: String, 
    password: String, 
    completion: @escaping (AuthResult?) -> ()
  ) {
    var req = URLRequest(url: URL(string: baseURL + "users/login")!)
    req.httpMethod = "POST"
    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: String] = [
      "email": email,
      "password": password,
    ]
    
    req.httpBody = try? JSONEncoder().encode(body)
    
    URLSession.shared.dataTask(with: req) { data, res, error in
      guard
        let data = data,
        let res = res as? HTTPURLResponse,
        error == nil
      else {
        print("Error", error ?? "Unknown error")
        return
      }
      
      guard checkStatus(res) else {
        return
      }
      
      printResponse(data)
      
      completion(try? JSONDecoder().decode(AuthResult.self, from: data))
    }.resume()
  }

    static func getUserDetail(
      email: String,
      completion: @escaping (Post?) -> ()
    ) {
      var req = URLRequest(url: URL(string: baseURL + "users/me")!)
      req.httpMethod = "POST"
      req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String : String] =  ["email": email]
      req.httpBody = try? JSONEncoder().encode(body)
      
      URLSession.shared.dataTask(with: req) { data, res, error in
        guard
          let data = data,
          let res = res as? HTTPURLResponse,
          error == nil
        else {
          print("Error", error ?? "Unknown error")
          return
        }
        
        guard checkStatus(res) else {
          return
        }
          printResponse(data)
          
          let decoder = JSONDecoder()
          var post: Post? = nil
          do {
              post = try decoder.decode(Post.self, from: data)
          }
          catch {
              print(error)
          }
          
          completion(post)
          
////        let result = try? JSONDecoder().decode([UserResult].self, from: data)
////          completion(result?.first?.name)
//
//          let result = try JSONDecoder().decode(Post.self, from: jsonData)
//          catch {
//              print(error)
//          }
//          completion(try? JSONDecoder().decode([UserResult].self, from: data))
      }.resume()
    }

    
}

struct AutocompleteResult: Codable {
  var predictions: [Prediction]
  
  struct Prediction: Codable, Hashable {
    var description: String
    var place_id: String
  }
}

typealias ReviewsResult = [Review]
struct Review: Codable, Hashable {
  var review: String
  var value: Double
  var tags: [String] 
  var date_visited: String
}

struct AnyEncodable: Encodable {
  let value: Encodable
  init(_ value: Encodable) {
    self.value = value
  }
  func encode(to encoder: Encoder) throws {
    try value.encode(to: encoder)
  }
}

struct AuthResult: Codable, Hashable {
  var token: String
}

struct PlaceDetailsResult: Codable, Hashable {
  
  var result: Place
  
  struct Place: Codable, Hashable {
    var name: String
  }
}

struct RatingResult: Codable, Hashable {
  
  var avg_rating: Double
  
}

struct UserDetail: Codable, Hashable {
    var name: String
}
struct UserResult: Codable, Hashable {
//    var id: String
//    var email: String
//  var isVerified: Bool
  var name: String
//    var gender: String
//    var race: String
//    var disability: String
}

struct Post: Codable {
    var user: User
}
struct User: Codable, Identifiable {
    var id: String?
    var email: String?
    var isVerified: Bool?
    var name: String?
    var gender: String?
    var race: String?
    var disability: String?
}

//struct User: Codable, Identifiable {
//
//        var id: String?
//        var email: String?
//       var isVerified: Bool?
//       var name: String?
//        var gender: String?
//        var race: String?
//        var disability: String?
//}
