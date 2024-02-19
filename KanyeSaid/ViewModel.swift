//
//  ModelView.swift
//  KanyeSaid
//
//  Created by Macmaurice Osuji on 2/18/24.
//

import Foundation

@MainActor class ViewModel: ObservableObject {
    @Published var quoteModel = QuoteModel(quote: "")
    @Published var newQuote: Bool = false
    
    // FUNCTION FOR GET REQUEST API CALL
    func getRequest() {
        
        guard let url = URL(string: "https://api.kanye.rest") else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("Could not retrieve data...")
                return
            }
            
            do {
                let quote = try JSONDecoder().decode(QuoteModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.quoteModel = quote
                    self.newQuote = true
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        .resume()
    }
}
