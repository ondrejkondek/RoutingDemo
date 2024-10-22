//
//  TestAPI.swift
//  AuthManager
//
//  Created by Ondrej Kondek on 22/10/2024.
//

import SwiftUI

// MARK: - Example of API service

public struct Post: Codable, Sendable {
    public init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
    public let id: Int
    public var title: String
    public let body: String
    
    mutating public func changeTitle(to newTitle: String) {
        self.title = newTitle
    }
}

public final class TestAPI {
    public init() {}
    public func fetchPosts() async throws -> [Post] {
        // Specify the URL of the API
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw URLError(.badURL) // Handle the case where the URL is invalid
        }
        
        // Create a URLSession data task
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check if the response is valid
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse) // Handle bad server response
        }
        
        // Decode the JSON data into an array of Post
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return posts
    }
}

//public class NonSendable {
//    private var internalState: Int = 0
//
//    // Method to modify the internal state
//    public func increment() {
//        internalState += 1
//    }
//
//    // Method to retrieve the current state
//    public func getState() -> Int {
//        return internalState
//    }
//}

