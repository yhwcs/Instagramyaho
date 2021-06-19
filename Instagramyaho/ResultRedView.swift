//
//  ResultRedView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/19.
//

import SwiftUI

struct ResultRedView: View {
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
                        .fill(AngularGradient(gradient: Gradient(colors: [.white, .red]), center: .topLeading, angle: .degrees(180+45)))
                        .frame(width:130, height:130)
                    HStack{
                        Text("겉바속촉").font(.system(size:25, weight: .black))
                        Text("빨강").font(.system(size:25, weight: .black))
                            .foregroundColor(Color.red)
                    }
                    Text("전체 사용자의 11%에 해당합니다")
                        .font(.system(size:17, weight: .medium))
                        .foregroundColor(Color.gray)
                    Image("red")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    ForEach(MyResultlist.Redlist.items) {
                        index in
                        RowView(resultlistItem: self.$MyResultlist.Redlist.items[index])
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
            self.MyResultlist.Redlist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.MyResultlist.Redlist.saveResultlistItems()
        }
    }
}

struct ResultRedView_Previews: PreviewProvider {
    static var previews: some View {
        ResultRedView()
    }
}
