//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Deniz on 16.07.2023.
//

import SwiftUI
import Apollo
import RickAndMortyAPI

class NetworkManager{
    static let shared = NetworkManager()
    
    private lazy var apollo =  ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    private init(){}
    
    func download<Query: GraphQLQuery>(query: Query, completion: @escaping (Result<Query.Data?, Error>) -> Void) {
        
        apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                completion(.success(graphQLResult.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
