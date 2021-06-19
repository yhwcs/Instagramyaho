//
//  PeopleTapView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/19.
//

import SwiftUI

struct PeopleTapView: View {
    @State var toggling = false
    @State var showingToggle = false
    let grouplist = ["같은 그룹에게만 공개", "전체 공개"]
    @State var selected = "같은 그룹에게만 공개"
    @ObservedObject var PeopleGrouplist = Peoplelist()
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header:
                                HStack{
                                    Image(systemName: "gearshape")
                                    Text("설정")
                                }.font(.title3)
                    ){
                        Toggle(isOn: $showingToggle){
                            Text("계정 공개")
                        }
                        if showingToggle {
                            Picker("공개 범위 설정", selection: $selected){
                                ForEach(grouplist, id: \.self){
                                    Text($0)
                                }
                            }
                        }
                    }
                    
                    List{
                        Section(header: Text("RED").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Red") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                }
                            } // End of ForEach
                        }
                        Section(header: Text("ORANGE").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Orange") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                    }
                            } // End of ForEach
                        }
                        Section(header: Text("YEELOW").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Yellow") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                    }
                            } // End of ForEach
                        }
                        Section(header: Text("GRREN").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Green") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                    }
                            } // End of ForEach
                        }
                        Section(header: Text("BLUE").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Blue") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                    }
                            } // End of ForEach
                        }
                        Section(header: Text("NAVY").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Navy") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                    }
                            } // End of ForEach
                        }
                        Section(header: Text("PURPLE").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Purple") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                    }
                            } // End of ForEach
                        }
                        Section(header: Text("BLACK").font(.title3)){
                            ForEach(PeopleGrouplist.items) {
                                index in
                                    if (PeopleGrouplist.items[index].isChecked == true && PeopleGrouplist.items[index].color == "Black") {
                                        Link(destination: URL(string: "https://www.instagram.com/\(PeopleGrouplist.items[index].name)/")!){
                                            Text(PeopleGrouplist.items[index].name)
                                        }
                                    }
                            } // End of ForEach
                        }
                    } // End of List

                } // End of Form
            } // End of VStack
            .navigationBarTitle("Make a Connection!")
        } // End of Navigation
    } // End of body
}

struct PeopleTapView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleTapView()
    }
}
