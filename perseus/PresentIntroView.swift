//
//  PresentIntroView.swift
//  perseus
//
//  Created by Luan Fazolin on 26/08/23.
//

import SwiftUI

struct PresentIntroView: View {
    @State private var pageIndex = 0
    @State private var showOnboarding = false
    private let intros: [IntroPage] = IntroPage.introPages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationView {
            TabView(selection: $pageIndex) {
                ForEach(intros) { intro in
                    VStack {
                        Spacer()
                        IntroView(intro: intro)
                        Spacer()
                        
                        if intro == intros.last {
                            NavigationLink("Começar a usar", destination: OnboardingAView())
                        } else {
                            Button("Prosseguir", action: incrementPage)
                        }
                        Spacer()
                    }
                    .tag(intro.tag)
                }
            }
            .animation(.default, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
}

struct PresentIntroView_Previews: PreviewProvider {
    static var previews: some View {
        PresentIntroView()
    }
}
