//
//  Home.swift
//  NotesMacOS
//
//  Created by Tauan Tathiell Camargo on 19/06/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        HStack {
            // Side bar ...
            if isMacOS() {
                SideBar()
            }
        }
        .frame(width: isMacOS() ? getRect().width / 1.7 : nil, height: isMacOS() ? getRect().height - 180 : nil)
        .background(Color("BG").ignoresSafeArea())
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    func SideBar()->some View{
        VStack {
            Text("Pocket")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Add Button
            AddButton()
        }
    }
    
    @ViewBuilder
    func AddButton()->some View{
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .padding(isMacOS() ? 12 : 15)
                .background(Color.black)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    Home()
}


// Extending View to get Frame and getting device os types..
extension View {
    func getRect()->CGRect{
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    func isMacOS()->Bool{
        #if os(iOS)
        return false
        #endif
        return true
    }
}
