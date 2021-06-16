//
//  NewResultlistItemView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//


import SwiftUI

struct NewResultlistItemView: View {
    var resultlist: Resultlist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Add new item")
            Form{
                //Text("Enter item name")
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newResultlistItem = ResultlistItem(name: self.newItemName)
                    self.resultlist.items.append(newResultlistItem)
                    self.resultlist.printResultlistContents()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    } // End of HStack
                } // End of Button
                .disabled(newItemName.count == 0)
            } // End of List
            Text("Swipe down to cancel.")
        } // End of VStack
        .onAppear(){
            print("NewChecklistItemView has appeared!")
        } // End of .onAppear()
        .onDisappear(){
            print("NewChecklistItemView has disappeared!")
        } // End of .onDisappear()
    } // End of body
} // End of View

struct NewResultlistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewResultlistItemView(resultlist: Resultlist())
    }
}
