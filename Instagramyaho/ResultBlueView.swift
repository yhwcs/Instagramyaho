//
//  ResultA.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/11.
//

import SwiftUI

struct ResultBlueView: View {
    @EnvironmentObject var MyResultlist: UserSetting
    //@ObservedObject var resultlist = Resultlist()
    @Environment(\.presentationMode) var presentationMode
    @State var i: Int = 0
    
    /*
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    */
    
    var body: some View {
        VStack{	
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                  Image(systemName: "xmark")
                    //.font(.title)
                    .foregroundColor(.blue)
                    .padding(10)
                }
                Spacer()
            }
            NavigationView{
                ScrollView {
                    Circle()
                        .fill(AngularGradient(gradient: Gradient(colors: [.white, .blue]), center: .topLeading, angle: .degrees(180+45)))
                        .frame(width:130, height:130)
                    HStack{
                        Text("자유로운").font(.system(size:25, weight: .black))
                        Text("파랑").font(.system(size:25, weight: .black))
                            .foregroundColor(Color.blue)
                    }
                    Text("전체 사용자의 36%에 해당합니다")
                        .font(.system(size:17, weight: .medium))
                        .foregroundColor(Color.gray)
                    Image("blue")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
            //NavigationView {
                //List {
                    ForEach(MyResultlist.Bluelist.items) {
                        index in
                        RowView(resultlistItem: self.$MyResultlist.Bluelist.items[index])
                    } // End of ForEach
                    //.onDelete(perform: MyResultlist.Alist.deleteListItem)
                    //.onMove(perform: MyResultlist.Alist.moveListItem)
                //} // End of list
            //} // End of NavigationView
            //.navigationBarTitle("Resultlist")
                    //.frame(maxWidth: .infinity)
                    //Color.clear.padding(.top, -200)
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
            }
            //.background(Color.white)
            
        } // End of VStack
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.MyResultlist.Bluelist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.MyResultlist.Bluelist.saveResultlistItems()
        }
            
    } // End of body
} // End of View

struct ResultAView_Previews: PreviewProvider {
    static var previews: some View {
        ResultBlueView()
    }
}
