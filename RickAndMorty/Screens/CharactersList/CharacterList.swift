//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Deniz on 16.07.2023.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterList: View {
    
    @StateObject var viewModel = CharacterListViewModel()

    var body: some View {
        ScrollView(.horizontal){
            VStack(alignment: .leading, spacing: 10){
                LazyHStack{
                    ForEach(0..<viewModel.characters.count,id: \.self){index in
                        CharacterCardView(character: viewModel.characters[index])
                    }
                    .frame(height: 150)
                }.onAppear {
                    viewModel.getCharacterList(page: 1)
                }
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}
