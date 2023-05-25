//
//  BackgroundView.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 22/05/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        
        Image("Background")
            .resizable()
            .ignoresSafeArea(.all)
            .aspectRatio(contentMode: .fill)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
