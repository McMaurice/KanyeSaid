//
//  ContentView.swift
//  KanyeSaid
//
//  Created by Macmaurice Osuji on 2/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Kanye once said ")
                .font(.title)
                .padding()
            if let quoteResult = viewModel.quoteModel.quote {
                Text(quoteResult)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 26))
                    .italic()
                    .padding()
                    .cornerRadius(10)
                    .shadow(radius: 15)
                    .padding()
            } else {
                ProgressView("Loading quote..")
            }
            Button {
                viewModel.getRequest()
            } label: {
                Text("Get A Quote")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
