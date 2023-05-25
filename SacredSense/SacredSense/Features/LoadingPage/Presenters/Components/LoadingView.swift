//
//  LoadingView.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 23/05/23.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        VStack {
            
           SpinningEllipse()
        
        }
    }
}

struct SpinningEllipse: View {
    @State private var width: CGFloat = 50

    var body: some View {
      
            Ellipse()
            .frame(width: width, height: 50)
            .foregroundColor(AppColor.pink)
            .onAppear {
                withAnimation(
                    .easeInOut
                        .repeatForever(autoreverses: true)
                        .speed(1)
                ) {
                    width = 0
                }
            }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
