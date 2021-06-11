//
//  ResultA.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/11.
//

import SwiftUI

struct ResultAView: View {
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
            Spacer()
            Text("list")
            Spacer()
        }
    }
}

struct ResultA_Previews: PreviewProvider {
    static var previews: some View {
        ResultAView()
    }
}
