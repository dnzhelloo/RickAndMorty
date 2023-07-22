//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Deniz on 16.07.2023.
//

import SwiftUI
import RickAndMortyAPI

class CharacterListViewModel:ObservableObject{
    @Published var characters = [CharacterListQuery.Data.Characters.Result]()
    let service = CharacterService()
    
    @State var imagex: UIImage? = nil
    
    func getCharacterList(page:Int){
        service.fetchCharacters(page: page) { result in
            switch result {
                
            case .success(let data):
                DispatchQueue.main.async {
                    self.characters.append(contentsOf: data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: LoadImage
    
}
