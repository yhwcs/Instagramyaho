//
//  ResultA.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/11.
//

import SwiftUI

struct ResultAView: View {
    @ObservedObject var resultlist = Resultlist()
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
                    .padding(20)
                }
                Spacer()
            }
            Spacer()
            Text("Result A page")
            
            NavigationView {
                List {
                    ForEach(resultlist.items) {
                        index in
                        RowView(resultlistItem: self.$resultlist.items[index])
                    } // End of ForEach
                    .onDelete(perform: resultlist.deleteListItem)
                    .onMove(perform: resultlist.moveListItem)
                } // End of list
            } // End of NavigationView
            .navigationBarTitle("Resultlist")

        } // End of VStack
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.resultlist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.resultlist.saveResultlistItems()
        }
    } // End of body
} // End of View

struct ResultAView_Previews: PreviewProvider {
    static var previews: some View {
        ResultAView()
    }
}
