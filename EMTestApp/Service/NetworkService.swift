//
//  NetworkService.swift
//  EMTestApp
//
//  Created by Andrey Lobanov on 07.09.2022.
//

import Foundation

struct NetworkService {
    
    enum NetworkServiceError: Error {
        case invalidStatusCode
    }
    
    func fetchData() async throws -> StoreModel {
        let url =  URL(string:"https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175")!
        
        let configuration = URLSessionConfiguration.ephemeral
        
        let (data, response) = try await URLSession(configuration: configuration).data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkServiceError.invalidStatusCode
        }
        let decodeData = try JSONDecoder().decode(StoreModel.self, from: data)
        return decodeData
    }
    
    func fetchDetailsData() async throws -> DetailModel {
        let url =  URL(string:"https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5")!
        
        let configuration = URLSessionConfiguration.ephemeral
        
        let (data, response) = try await URLSession(configuration: configuration).data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkServiceError.invalidStatusCode
        }
        let decodeData = try JSONDecoder().decode(DetailModel.self, from: data)
        return decodeData
    }
    
    func fetchCartData() async throws -> CartModel {
        let url =  URL(string:"https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149")!
        
        let configuration = URLSessionConfiguration.ephemeral
        
        let (data, response) = try await URLSession(configuration: configuration).data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkServiceError.invalidStatusCode
        }
        let decodeData = try JSONDecoder().decode(CartModel.self, from: data)
        return decodeData
    }
}
