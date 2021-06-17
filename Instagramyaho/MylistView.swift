//
//  MylistView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//

import SwiftUI

struct MylistView: View {
    @ObservedObject var Ownlist = Mylist()
    @EnvironmentObject var MyResultlist: UserSetting
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("ResultA")){
                    ForEach(MyResultlist.Alist.items) {
                        index in
                        if MyResultlist.Alist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Alist.items[index])
                        }
                    } // End of ForEach
                    //.onDelete(perform: MyResultlist.list.deleteListItem)
                    .onMove(perform: MyResultlist.Alist.moveListItem)
                }
                Section(header: Text("MyResult")){
                    ForEach(Ownlist.items) {
                        index in
                        HStack{
                            //Image(systemName: "circle")
                            Text("•")
                            Text(Ownlist.items[index].name)
                            Spacer()
                        }
                    } // End of ForEach
                    .onDelete(perform: Ownlist.deleteListItem)
                    .onMove(perform: Ownlist.moveListItem)
                }
            } // End of list
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible = true}) {
                    HStack{
                        Image(systemName: "square.and.pencil")
                        Text("Add item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("Mylist")
        } // End of navigationView
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            //Text("New item screen coming soon!")
            NewResultlistItemView(resultlist: self.Ownlist)
        } // End of .sheet
        .onAppear(){
            print("ChecklistView has appeared!")
            self.Ownlist.loadResultlistItems()
            self.MyResultlist.Alist.loadResultlistItems()
        } // End of .onAppear()
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.Ownlist.saveResultlistItems()
            self.MyResultlist.Alist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.Ownlist.saveResultlistItems()
            self.MyResultlist.Alist.saveResultlistItems()
        }
    } // End of body
    
}

struct MylistView_Previews: PreviewProvider {
    static var previews: some View {
        MylistView()
    }
}
