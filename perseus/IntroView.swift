//
//  IntroView.swift
//  perseus
//
//  Created by Luan Fazolin on 26/08/23.
//

import SwiftUI

struct IntroView: View {
    var intro: IntroPage
    
    var body: some View {
        VStack {
            Image("\(intro.imageUrl)")
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFill()
            Text(intro.name)
                .font(.title)
            Text(intro.description)
                .frame(width: 250)
                .padding()
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(intro: IntroPage.samplePage)
    }
}
