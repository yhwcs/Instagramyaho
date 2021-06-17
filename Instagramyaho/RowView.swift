//
//  RowView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//

import SwiftUI

struct RowView: View {
    @Binding var resultlistItem: ResultlistItem
    //@State var checkmark: String
    var body: some View {
        HStack{
            Text(resultlistItem.isChecked ? "☑️" : "⬛️")
            //Image(systemName: Decide_checkmark())
            //Spacer()
            Text(resultlistItem.name)
            Spacer()
        } // End of HStack
        .background(Color.white)
        .onTapGesture {
            self.resultlistItem.isChecked.toggle()
        }
        
    } // Enf of body
    
    func Decide_checkmark() -> String {
        if self.resultlistItem.isChecked == true {
            return "checkmark.square.fill"
        } else {
            return "square.fill"
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(resultlistItem: .constant(ResultlistItem(name: "Sample Item")))
        //RowView(resultlistItem: ResultlistItem(name: "A"))
    }
}

 
	
