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
            VStack(){
                //Image("logo").padding()
                HStack{
                    Image(systemName: "person")
                    Text("\(userid)님의")
                }.font(.title3)
                Text("계정을 분석중입니다.")
                .font(.title3)
                .onReceive(timer) { _ in if self.progressValue < 1.0 { self.progressValue += 0.2 } else {self.timeFlag = true}}
                //Text("\(currentDate)") .onReceive(timer) { input in self.currentDate = input }
                //Text("\(timeRemaining)") .onReceive(timer) { _ in if self.timeRemaining > 0 { self.timeRemaining -= 1 } }
                LottieView(filename: "loading").frame(width: 200, height: 200)
                HStack{
                    Button(action: {
                        if self.progressValue >= 1.0 {
                            self.timeFlag = false
                            self.showingSheet = true
                        } else {
                            self.timeFlag = true
                        }
                    }){
                        HStack{
                            Text("   ")
                            Image(systemName: "magnifyingglass").font(.title3)
                            Text("결과 확인하기   ").font(.title3).fontWeight(.bold)
                        }
                        //.foregroundColor(Color.white)
                            //.frame(width: 100, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                            //.background(RoundedRectangle(cornerRadius: 30).strokeBorder())
                        //.background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                        .background(RoundedRectangle(cornerRadius: 30).strokeBorder())
                        //.cornerRadius(30)

                    }
                    .disabled(timeFlag == false)
                    /*
                    .alert(isPresented: $timeFlag) {
                        Alert(title: Text("Wait"), message: Text(alertMessage()), dismissButton: .default(Text("OK")))
                    }
                     */
                    /*
                    .sheet(isPresented: $showingSheet){
                        //resultView()
                        SecondView()
                    }
                    */
                    .fullScreenCover(isPresented: $showingSheet, content: {
                        //SecondView()
                        ResultBlueView()
                    })
                }.padding()
                Spacer()
                Text("   ").padding(.bottom, 100)
                Spacer()
                    
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
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                  Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(20)
                }
                //Spacer()
                Text("Result")
            }
        }
    }
}

struct ProcessView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
	
