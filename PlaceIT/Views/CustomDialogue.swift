//
//  CustomDialogue.swift
//  PlaceIT
//
//  Created by Astor Ludueña  on 09/04/2025.
//

import SwiftUI

struct CustomDialogue<Content: View>: View {
    let closeDialogue:() -> Void
    let OnDismissOutside: Bool
    let content: Content
    
    var body: some View {
        ZStack{
            Rectangle().fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if OnDismissOutside{
                        withAnimation{
                            closeDialogue()
                        }
                    }
                }
            content.frame(width: UIScreen.main.bounds.size.width-100, height: 300)
                .padding()
                .background(.white)
                .cornerRadius(16)
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        withAnimation{
                            closeDialogue()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle")
                    }).foregroundStyle(Color.accentColor).padding(16)
                }
        }.ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.size.width,
                   height: UIScreen.main.bounds.size.height,
                   alignment: .center)
    }
}
