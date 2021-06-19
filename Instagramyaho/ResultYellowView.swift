//
//  ResultYellowView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/19.
//

import SwiftUI

struct ResultYellowView: View {
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
                        .fill(AngularGradient(gradient: Gradient(colors: [.white, .yellow]), center: .topLeading, angle: .degrees(180+45)))
                        .frame(width:130, height:130)
                    HStack{
                        Text("통통튀는").font(.system(size:25, weight: .black))
                        Text("노랑").font(.system(size:25, weight: .black))
                            .foregroundColor(Color.yellow)
                    }
                    Text("전체 사용자의 8%에 해당합니다")
                        .font(.system(size:17, weight: .medium))
                        .foregroundColor(Color.gray)
                    Image("yellow")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    ForEach(MyResultlist.Yellowlist.items) {
                        index in
                        RowView(resultlistItem: self.$MyResultlist.Yellowlist.items[index])
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
            self.MyResultlist.Yellowlist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.MyResultlist.Yellowlist.saveResultlistItems()
        }
    }
}

struct ResultYellowView_Previews: PreviewProvider {
    static var previews: some View {
        ResultYellowView()
    }
}
