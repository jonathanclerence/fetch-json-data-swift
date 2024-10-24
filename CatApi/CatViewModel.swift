//
//  CatViewModel.swift
//  CatApi
//
//  Created by Hanan Jonathan Clerence on 2024-10-23.
//

import Foundation

class CatViewModel: ObservableObject {
    @Published var catData: [CatDTO] = []
    
    func fetchCat() async {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
                print("Invalid URL")
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                print("Invalid response from api")
                return
            }
            
            let decodedData = try JSONDecoder().decode([CatDTO].self, from: data)
            
            catData = decodedData
        }
        catch{
            print("Something went wrong!")
        }
        
    }
    
    func createImgUrl(imageId: String?) -> String{
        return String("https://cdn2.thecatapi.com/images/\(imageId ?? "").jpg")
    }
}
