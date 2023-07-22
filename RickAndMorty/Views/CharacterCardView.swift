//
//  CardView.swift
//  RickAndMorty
//
//  Created by Deniz on 17.07.2023.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterCardView: View {
    let character: CharacterListQuery.Data.Characters.Result
    
    @State private var image: UIImage? = nil
    let padding: CGFloat = 10

    var body: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .overlay(
                        VStack {
                            Spacer()
                            Text(character.name ?? "name")
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.clear, .black]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    )
            } else {
                Color.gray
                    .frame(width: 100, height: 100)
            }
        }
        .onAppear {
            loadImage(from: character.image)
        }
    }
    
    private func loadImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    image = loadedImage
                }
            }
        }
        .resume()
    }
}
