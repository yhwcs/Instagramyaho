//
//  ResultListTabView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/11.
//

import SwiftUI

struct ResultListTabView: View {
    //@ObservedObject var resultlist = Resultlist()
    @State private var showingSheetA = false
    @State private var showingSheetB = false
    var body: some View {
        NavigationView{
            Form{
                HStack{
                    Text("Result A")
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetA = true
                }
                .fullScreenCover(isPresented: $showingSheetA, content: {
                    //SecondView()
                    ResultAView()
                })
                HStack{
                    Text("Result B")
                    Spacer()
                }
                    .background(Color.white)
                    .onTapGesture {
                    self.showingSheetB = true
                }
                .fullScreenCover(isPresented: $showingSheetB, content: {
                    //SecondView()
                    ResultBView()
                })
                /*
                NavigationLink(
                    destination: ResultAView(),
                    label: {
                        Text("Result A")
                    })
                NavigationLink(
                    destination: ResultBView(),
                    label: {
                        Text("Result B")
                    })
                */
            }
            .navigationBarTitle("Result List")
        } // End of navigationView
    }
}

struct ResultListTabView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListTabView()
    }
}
