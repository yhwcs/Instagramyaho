//
//  ResultA.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/11.
//

import SwiftUI

struct ResultAView: View {
    @EnvironmentObject var MyResultlist: UserSetting
    //@ObservedObject var resultlist = Resultlist()
    @Environment(\.presentationMode) var presentationMode
    @State var i: Int = 0
    
    var body: some View {
        VStack{
            
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                  Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(20)
                }
                Spacer()
            }
            Spacer()
            Text("Result A page")
            
            NavigationView {
                List {
                    ForEach(MyResultlist.Alist.items) {
                        index in
                        RowView(resultlistItem: self.$MyResultlist.Alist.items[index])
                    } // End of ForEach
                    .onDelete(perform: MyResultlist.Alist.deleteListItem)
                    .onMove(perform: MyResultlist.Alist.moveListItem)
                } // End of list
            } // End of NavigationView
            .navigationBarTitle("Resultlist")

        } // End of VStack
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.MyResultlist.Alist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.MyResultlist.Alist.saveResultlistItems()
        }
    } // End of body
    
} // End of View


struct ResultAView_Previews: PreviewProvider {
    static var previews: some View {
        ResultAView()
    }
}
