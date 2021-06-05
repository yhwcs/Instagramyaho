//
//  ContentView.swift
//  Instagramyaho
//
//  Created by 장서우 on 2021/05/07.
//

import SwiftUI
import UIKit
import WebKit

struct ContentView: View {
    @State var userid = ""
    @State private var isOn = true
    @State var tag:Int? = nil
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                // Spacer().navigationBarTitle("Instagramyaho")
                Image("logo")
                //Text("Instagramyaho")
                //    .font(.largeTitle)
                //    .padding()
                
                //TextField("사용자 이름", text: $userid)
                    //  .padding()
                
                //Text("You entered: \(userid)")
                //print("You entered: \(userid)")
                Spacer()
                HStack{
                    TextField("사용자 이름",text: $userid).frame(width: 200, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding().background(RoundedRectangle(cornerRadius: 5).strokeBorder())
                        .disableAutocorrection(true)
                        .textCase(.none)
                }

                HStack{
                    /*
                    Toggle(isOn: $isOn){
                        Text("자동")
                    }.frame(width: 90, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    */

                    //NavigationLink(destination: ProcessView()){
                    NavigationLink(destination: ProcessView(userid: self.$userid), tag:1, selection: self.$tag){
                        //Button(action: {self.tag = 1}) {
                        Button(action: {
                            if userid.count <= 0 {
                                self.tag = 0
                                self.showingAlert = true
                            } else {
                                self.tag = 1
                            }
                        }){
                            Text("로그인")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(width: 200, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).strokeBorder())
                                .background(Color.blue)
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("알림"), message: Text("사용자 이름을 입력하세요"), dismissButton: .default(Text("OK")))
                        }
                    }
                }.padding()
                Spacer()

                HStack{
                    Text("계정이 없으신가요?")
                    Link(destination: URL(string: "https://instagram.com/accounts/signup/phone")!){
                        Text("가입하기")
                        //.foregroundColor(Color.blue)
                    }

                }
                
                Spacer()
     
            }
        } // End of NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    //Method
    func linkClicked(sender: AnyObject) -> Int {
        openUrl(url: "http://fr.envisite.net/t5exce")
        return 0
    }
    func openUrl(url:String!) {

        let targetURL=NSURL(fileURLWithPath: url)
        let application=UIApplication.shared
        application.open(targetURL as URL);
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct LogInAction: View{
    @State private var isOn = true
    
    init(){
        UISwitch.appearance().onTintColor   = .gray
        UISwitch.appearance().thumbTintColor    = .white
    }
    
    var body: some View{
        HStack{
            Toggle(isOn: $isOn){
                Text("자동")
            }.frame(width: 90, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Button(action: { } ) {
                Text("로그인")
                    .frame(width: 80, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
        }.padding()
    }
}
