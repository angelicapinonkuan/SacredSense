//
//  Title.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 22/05/23.
//

import SwiftUI

struct Title: View {
    
    var imageName: String
    var title: String

    var body: some View {
        
        VStack {
            Image("\(imageName)")
                .resizable()
                .frame(width: 170, height:220)
            
            Text("\(title)")
                .font(Font.custom("PTSerif-Regular", size: 20))
                .foregroundColor(Color.white)
                
        }
        .padding(.top, -15)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(imageName: "Head", title: "Head Line")
    }
}
