//
//  MylistView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//

import SwiftUI

struct MylistTabView: View {
    @ObservedObject var Ownlist = Mylist()
    @EnvironmentObject var MyResultlist: UserSetting
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("RED").font(.title)){
                    ForEach(MyResultlist.Redlist.items) {
                        index in
                        if MyResultlist.Redlist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Redlist.items[index])
                        }
                    } // End of ForEach
                    .onMove(perform: MyResultlist.Redlist.moveListItem)
                }
                Section(header: Text("ORANGE").font(.title)){
                    ForEach(MyResultlist.Orangelist.items) {
                        index in
                        if MyResultlist.Orangelist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Orangelist.items[index])
                        }
                    } // End of ForEach
                    .onMove(perform: MyResultlist.Orangelist.moveListItem)
                }
                Section(header: Text("YELLOW").font(.title)){
                    ForEach(MyResultlist.Yellowlist.items) {
                        index in
                        if MyResultlist.Yellowlist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Yellowlist.items[index])
                        }
                    } // End of ForEach
                    .onMove(perform: MyResultlist.Yellowlist.moveListItem)
                }
                Section(header: Text("GREEN").font(.title)){
                    ForEach(MyResultlist.Greenlist.items) {
                        index in
                        if MyResultlist.Greenlist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Greenlist.items[index])
                        }
                    } // End of ForEach
                    .onMove(perform: MyResultlist.Greenlist.moveListItem)
                }
                Section(header: Text("BLUE").font(.title)){
                    ForEach(MyResultlist.Bluelist.items) {
                        index in
                        if MyResultlist.Bluelist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Bluelist.items[index])
                        }
                    } // End of ForEach
                    //.onDelete(perform: MyResultlist.list.deleteListItem)
                    .onMove(perform: MyResultlist.Bluelist.moveListItem)
                }
                Section(header: Text("NAVY").font(.title)){
                    ForEach(MyResultlist.Navylist.items) {
                        index in
                        if MyResultlist.Navylist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Navylist.items[index])
                        }
                    } // End of ForEach
                    .onMove(perform: MyResultlist.Navylist.moveListItem)
                }
                Section(header: Text("PURPLE").font(.title)){
                    ForEach(MyResultlist.Purplelist.items) {
                        index in
                        if MyResultlist.Purplelist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Purplelist.items[index])
                        }
                    } // End of ForEach
                    .onMove(perform: MyResultlist.Purplelist.moveListItem)
                }
                Section(header: Text("BLACK").font(.title)){
                    ForEach(MyResultlist.Blacklist.items) {
                        index in
                        if MyResultlist.Blacklist.items[index].isChecked == true{
                            RowView(resultlistItem: self.$MyResultlist.Blacklist.items[index])
                        }
                    } // End of ForEach
                    .onMove(perform: MyResultlist.Blacklist.moveListItem)
                }
                Section(header: Text("MyResult").font(.title)){
                    ForEach(Ownlist.items) {
                        index in
                        HStack{
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
            self.MyResultlist.Redlist.loadResultlistItems()
            self.MyResultlist.Orangelist.loadResultlistItems()
            self.MyResultlist.Yellowlist.loadResultlistItems()
            self.MyResultlist.Navylist.loadResultlistItems()
            self.MyResultlist.Purplelist.loadResultlistItems()
            self.MyResultlist.Greenlist.loadResultlistItems()
            self.MyResultlist.Bluelist.loadResultlistItems()
            self.MyResultlist.Blacklist.loadResultlistItems()
        } // End of .onAppear()
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.Ownlist.saveResultlistItems()
            self.MyResultlist.Redlist.saveResultlistItems()
            self.MyResultlist.Orangelist.saveResultlistItems()
            self.MyResultlist.Yellowlist.saveResultlistItems()
            self.MyResultlist.Navylist.saveResultlistItems()
            self.MyResultlist.Purplelist.saveResultlistItems()
            self.MyResultlist.Greenlist.saveResultlistItems()
            self.MyResultlist.Bluelist.saveResultlistItems()
            self.MyResultlist.Blacklist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.Ownlist.saveResultlistItems()
            self.MyResultlist.Redlist.saveResultlistItems()
            self.MyResultlist.Orangelist.saveResultlistItems()
            self.MyResultlist.Yellowlist.saveResultlistItems()
            self.MyResultlist.Navylist.saveResultlistItems()
            self.MyResultlist.Purplelist.saveResultlistItems()
            self.MyResultlist.Greenlist.saveResultlistItems()
            self.MyResultlist.Bluelist.saveResultlistItems()
            self.MyResultlist.Blacklist.saveResultlistItems()
        }
    } // End of body
    
}

struct MylistView_Previews: PreviewProvider {
    static var previews: some View {
        MylistTabView()
    }
}
