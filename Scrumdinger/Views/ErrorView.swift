//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Eric Liu on 6/20/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding()
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Dismiss"){
                        dismiss()
                    }
                }
            }
        }
    }
    
    enum SampleError: Error {
        case errorRequired
    }
}

#Preview {
    
    var wrapper: ErrorWrapper {
        ErrorWrapper(error: ErrorView.SampleError.errorRequired, guidance: "You can safely ignore this error.")
    }
    
    return ErrorView(errorWrapper: wrapper)
}
