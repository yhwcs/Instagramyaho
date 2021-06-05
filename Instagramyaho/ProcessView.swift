//
//  ProcessView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/05/20.
//

// import Foundation
import SwiftUI

struct ProcessView: View {
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 0.0
    @State var progressValue = 0.0
    @State var timeFlag = false
    @State private var showingSheet = false
    @Binding var userid: String
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                Image("logo").padding()
                Text("\(userid) 분석중입니다!").padding()
                ProgressView(value: progressValue).onReceive(timer) { _ in if self.progressValue < 1.0 { self.progressValue += 0.1 } }
                //Text("\(currentDate)") .onReceive(timer) { input in self.currentDate = input }
                //Text("\(timeRemaining)") .onReceive(timer) { _ in if self.timeRemaining > 0 { self.timeRemaining -= 1 } }
                
                HStack{
                    Button(action: {
                        if self.progressValue >= 1.0 {
                            self.timeFlag = false
                            self.showingSheet = true
                        } else {
                            self.timeFlag = true
                        }
                    }){
                        Text("result")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).strokeBorder())
                            .background(Color.blue)

                    }
                    .alert(isPresented: $timeFlag) {
                        Alert(title: Text("Wait"), message: Text(alertMessage()), dismissButton: .default(Text("OK")))
                    }
                    /*
                    .sheet(isPresented: $showingSheet){
                        //resultView()
                        SecondView()
                    }
                    */
                    .fullScreenCover(isPresented: $showingSheet, content: {
                        SecondView()
                    })
                }.padding()
                    
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func alertMessage() -> String {
        if self.progressValue >= 1.0 {
            return " 분석이 완료되었습니다!\n결과를 확인해주세요. "
        }
        else{
            return "현재 진행률은 \(Int(round(progressValue*100)))% 입니다.\n기다려주세요! "
        }
    }
}

struct resultView: View {
    var body: some View {
        Text("Hello, World!")
    }
    
}

// MARK : SecondeView
struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("puple")
                .ignoresSafeArea()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "xmark")
                .font(.title)
                .foregroundColor(.blue)
                .padding(20)
            }
        }
    }
}

struct ProcessView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessView(userid: ContentView().$userid)
    }
}
	
