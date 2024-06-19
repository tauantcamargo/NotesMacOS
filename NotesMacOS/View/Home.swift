//
//  Home.swift
//  NotesMacOS
//
//  Created by Tauan Tathiell Camargo on 19/06/24.
//

import SwiftUI

struct Home: View {
    @State var showColors: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            // Side bar ...
            if isMacOS() {
                Group {
                    SideBar()
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1)
                }
            }
            // Main Content
            
        }
        .ignoresSafeArea()
        .frame(width: isMacOS() ? getRect().width / 1.7 : nil, height: isMacOS() ? getRect().height - 180 : nil, alignment: .leading)
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
            
            // Colors
            VStack(spacing: 15){
                let colors = [
                    Color(.orange),
                    Color(.red),
                    Color(.purple),
                    Color(.blue),
                    Color(.green)
                ]
                
                ForEach(colors,id: \.self){ color in
                    Circle()
                        .fill(color)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.top,20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
        }
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal,22)
        .padding(.top, 35)
    }
    
    @ViewBuilder
    func AddButton()->some View{
        Button {
            withAnimation{
                showColors.toggle()
            }
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .padding(isMacOS() ? 12 : 15)
                .background(Color.black)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .padding(.top,30)
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
