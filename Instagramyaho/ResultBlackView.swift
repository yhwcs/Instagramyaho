//
//  ResultBlackView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/19.
//

import SwiftUI

struct ResultBlackView: View {
    @EnvironmentObject var MyResultlist: UserSetting
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                  Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(10)
                }
                Spacer()
            }
            NavigationView{
                ScrollView {
                    Circle()
                        //.fill(AngularGradient(gradient: Gradient(colors: [.white, .black]), center: .topLeading, angle: .degrees(180+45)))
                        .fill(Color.black)
                        .frame(width:130, height:130)
                    Text("시크한 검정").font(.system(size:25, weight: .black))
                    Text("전체 사용자의 32%에 해당합니다")
                        .font(.system(size:17, weight: .medium))
                        .foregroundColor(Color.gray)
                    Image("black")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    ForEach(MyResultlist.Blacklist.items) {
                        index in
                        RowView(resultlistItem: self.$MyResultlist.Blacklist.items[index])
                    } // End of ForEach
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
            }
            //.background(Color.white)
            
        } // End of VStack
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.MyResultlist.Blacklist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.MyResultlist.Blacklist.saveResultlistItems()
        }
    }
}

struct ResultBlackView_Previews: PreviewProvider {
    static var previews: some View {
        ResultBlackView()
    }
}
