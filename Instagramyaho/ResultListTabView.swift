//
//  ResultListTabView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/11.
//

import SwiftUI

struct ResultListTabView: View {
    //@ObservedObject var resultlist = Resultlist()
    @State private var showingSheetBlue = false
    @State private var showingSheetGreen = false
    @State private var showingSheetBlack = false
    @State private var showingSheetRed = false
    @State private var showingSheetOrange = false
    @State private var showingSheetYellow = false
    @State private var showingSheetNavy = false
    @State private var showingSheetPurple = false
    var body: some View {
        NavigationView{
            Form{
                HStack{
                    Text("RED").font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.red)
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetRed = true
                }
                .fullScreenCover(isPresented: $showingSheetRed, content: {
                    //SecondView()
                    ResultRedView()
                })
                HStack{
                    Text("ORANGE").font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.orange)
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetOrange = true
                }
                .fullScreenCover(isPresented: $showingSheetOrange, content: {
                    //SecondView()
                    ResultOrangeView()
                })
                HStack{
                    Text("YELLOW").font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.yellow)
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetYellow = true
                }
                .fullScreenCover(isPresented: $showingSheetYellow, content: {
                    //SecondView()
                    ResultYellowView()
                })
                HStack{
                    Text("GREEN").font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.green)
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetGreen = true
                }
                .fullScreenCover(isPresented: $showingSheetGreen, content: {
                    //SecondView()
                    ResultGreenView()
                })
                HStack{
                    Text("BLUE").font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.blue)
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetBlue = true
                }
                .fullScreenCover(isPresented: $showingSheetBlue, content: {
                    //SecondView()
                    ResultBlueView()
                })
                HStack{
                    Text("NAVY").font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.navy)
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetNavy = true
                }
                .fullScreenCover(isPresented: $showingSheetNavy, content: {
                    //SecondView()
                    ResultNavyView()
                })
                HStack{
                    Text("PURPLE").font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(Color.purple)
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetPurple = true
                }
                .fullScreenCover(isPresented: $showingSheetPurple, content: {
                    //SecondView()
                    ResultPurpleView()
                })
                HStack{
                    Text("BLACK").font(.system(size: 20, weight: .bold, design: .rounded))
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetBlack = true
                }
                .fullScreenCover(isPresented: $showingSheetBlack, content: {
                    //SecondView()
                    ResultBlackView()
                })
            }
            .navigationBarTitle("🌈Result List")
        } // End of navigationView
    }
}

struct ResultListTabView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListTabView()
    }
}
