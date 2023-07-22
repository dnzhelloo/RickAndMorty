//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Deniz on 16.07.2023.
//

import SwiftUI
import RickAndMortyAPI

class CharacterService{
    
    func fetchCharacters(page:Int,completion: @escaping (Result<[CharacterListQuery.Data.Characters.Result], Error>) -> Void){
        NetworkManager.shared.download(query: CharacterListQuery(page:GraphQLNullable<Int>(integerLiteral: page))) { (result: Result<CharacterListQuery.Data?, Error>) in
            switch result{
            case .success(let data):
                if let characters = data?.characters?.results?.compactMap({$0}){
                    completion(.success(characters))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
