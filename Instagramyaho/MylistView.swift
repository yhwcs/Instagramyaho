//
//  MylistView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//

import SwiftUI

struct MylistView: View {
    @ObservedObject var resultlist = Resultlist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(resultlist.items) {
                    index in
                        RowView(resultlistItem: self.$resultlist.items[index])
                } // End of ForEach
                .onDelete(perform: resultlist.deleteListItem)
                .onMove(perform: resultlist.moveListItem)
                
            } // End of list
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible = true}) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("Mylist")
            //.onAppear() {
                //self.checklist.printChecklistContents()
            //}
        } // End of navigationView
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            //Text("New item screen coming soon!")
            NewResultlistItemView(resultlist: self.resultlist)
        } // End of .sheet
        .onAppear(){
            print("ChecklistView has appeared!")
            self.resultlist.loadResultlistItems()
        } // End of .onAppear()
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.resultlist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.resultlist.saveResultlistItems()
        }
    } // End of body
}

struct MylistView_Previews: PreviewProvider {
    static var previews: some View {
        MylistView()
    }
}
