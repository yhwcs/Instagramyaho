//
//  ResultPurpleView.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/19.
//

import SwiftUI

struct ResultPurpleView: View {
    @EnvironmentObject var MyResultlist: UserSetting
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                  Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding(10)
                }
                Spacer()
                Button(action: {
                    let resultimage = takeCapture()
                    saveInPhoto(img: resultimage)
                    //sharePicture(img: resultimage)
                    self.showingAlert = true
                    
                }) {
                    Image(systemName: "square.and.arrow.down")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding(10)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("알림"), message: Text("사진이 저장되었습니다.\n앨범을 확인하세요!"), dismissButton: .default(Text("OK")))
                }
            }
            NavigationView{
                ScrollView {
                    Circle()
                        .fill(AngularGradient(gradient: Gradient(colors: [.white, .purple]), center: .topLeading, angle: .degrees(180+45)))
                        .frame(width:130, height:130)
                    HStack{
                        Text("유니크한").font(.system(size:25, weight: .black))
                        Text("보라").font(.system(size:25, weight: .black))
                            .foregroundColor(Color.purple)
                    }
                    Text("전체 사용자의 2%에 해당합니다")
                        .font(.system(size:17, weight: .medium))
                        .foregroundColor(Color.gray)
                    Image("purple")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    ForEach(MyResultlist.Purplelist.items) {
                        index in
                        RowView(resultlistItem: self.$MyResultlist.Purplelist.items[index])
                    } // End of ForEach
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
            }
            //.background(Color.white)
            
        } // End of VStack
        .onDisappear(){
            print("ChecklistView has disappeared!")
            self.MyResultlist.Purplelist.saveResultlistItems()
        } // End of .onDisappear()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
            _ in print("willResignActiveNotification")
            self.MyResultlist.Purplelist.saveResultlistItems()
        }
    }
    
    func takeCapture() -> UIImage {
            var image: UIImage?
            guard let currentLayer = UIApplication.shared.windows.first { $0.isKeyWindow }?.layer else { return UIImage() }

            let currentScale = UIScreen.main.scale

            UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale)

            guard let currentContext = UIGraphicsGetCurrentContext() else { return UIImage() }

            currentLayer.render(in: currentContext)

            image = UIGraphicsGetImageFromCurrentImageContext()

            UIGraphicsEndImageContext()

            return image ?? UIImage()
        }
    
    func saveInPhoto(img: UIImage) {
            UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
    }
}

struct ResultPurpleView_Previews: PreviewProvider {
    static var previews: some View {
        ResultPurpleView()
    }
}
