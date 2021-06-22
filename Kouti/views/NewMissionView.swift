//
//  NewMissionView.swift
//  Kouti
//
//  Created by Thiago Medeiros on 22/06/21.
//

import SwiftUI

struct NewMissionView: View {
    @State var selectedCategory: Category? = .health
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Criar missões")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Button(action: {}) {
                Text("Criar missão personalizada")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "plus.app.fill")
                    .accentColor(Color("grayAddButton"))
                    .font(.system(size: 23, weight: .semibold, design: .default))
                    .frame(width: 20, height: 20, alignment: .center)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .shadow(color: .black.opacity(0.25), radius: 3, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(22)
            
            VStack(spacing: 25) {
                TagList($selectedCategory)
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(1..<17) { _ in
                            DefaultMissionLink()
                        }
                    }
                    .padding(.horizontal, 5)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
            .background(Color.white)
            .cornerRadius(22)
        }
        .padding()
        .background(Color("bgOptional").edgesIgnoringSafeArea(.all))
    }
}

struct NewMissionView_Previews: PreviewProvider {
    static var previews: some View {
        NewMissionView()
    }
}
