//
//  SheetColor.swift
//  edTechHack
//
//  Created by Sarah dos Santos Silva on 26/05/23.
//

import SwiftUI

struct SheetColor: View {
    
    var onColorSelected: ((Color) -> Void)?
    @Environment(\.presentationMode) var presentationMode


    
    var body: some View {
        VStack(spacing: 20){
            Text("Selecione uma cor: ")
            HStack{
                Image(systemName: "largecircle.fill.circle")
                    .foregroundColor(Color.blue)
                    .font(.largeTitle)
                    .onTapGesture {
                        onColorSelected?(Color.blue)

                    }
                
                Image(systemName: "largecircle.fill.circle")
                    .foregroundColor(Color.green)
                    .font(.largeTitle)
                    .onTapGesture {
                        print("verdinho")
                        onColorSelected?(Color.green)

                    }
            }
            HStack{
                Image(systemName: "largecircle.fill.circle")
                    .foregroundColor(Color.pink)
                    .font(.largeTitle)
                    .onTapGesture {
                        print("rosinha")
                        onColorSelected?(Color.pink)

                    }
                
                Image(systemName: "largecircle.fill.circle")
                    .foregroundColor(Color.purple)
                    .font(.largeTitle)
                    .onTapGesture {
                        print("roxinho")
                        onColorSelected?(Color.purple)

                    }
            }
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Pronto")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(15)
            }

        }.presentationDetents([.height(250)])
    }
}

//struct SheetColor_Previews: PreviewProvider {
//    static var previews: some View {
//        SheetColor()
//    }
//}
