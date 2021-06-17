//
//  NewResultlistItemView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//


import SwiftUI

struct NewResultlistItemView: View {
    //var resultlist: Resultlist
    var resultlist: Mylist
    //@EnvironmentObject var MyResultlist: UserSetting
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image(systemName: "square.and.pencil")
                Text("Add new item")
            }
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
                        Image(systemName: "plus.circle")
                        Text("Save")
                    } // End of HStack
                } // End of Button
                .disabled(newItemName.count == 0)
            } // End of List
            HStack{
                Image(systemName: "arrow.down")
                Text("Swipe down to cancel.")
            }
        } // End of VStack
        .onAppear(){
            print("NewChecklistItemView has appeared!")
        } // End of .onAppear()
        .onDisappear(){
            print("NewChecklistItemView has disappeared!")
            resultlist.saveResultlistItems()
        } // End of .onDisappear()
    } // End of body
} // End of View

struct NewResultlistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewResultlistItemView(resultlist: Mylist())
    }
}
