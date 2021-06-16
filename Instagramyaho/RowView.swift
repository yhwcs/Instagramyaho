//
//  RowView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//

import SwiftUI

struct RowView: View {
    @Binding var resultlistItem: ResultlistItem
    var body: some View {
        HStack{
            Text(resultlistItem.name)
            Spacer()
            Text(resultlistItem.isChecked ? "☑️" : "⬛️")
        } // End of HStack
        .background(Color.white)
        .onTapGesture {
            self.resultlistItem.isChecked.toggle()
        }
        
    } // Enf of View
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(resultlistItem: .constant(ResultlistItem(name: "Sample Item")))
        //RowView(resultlistItem: ResultlistItem(name: "A"))
    }
}

 
	
