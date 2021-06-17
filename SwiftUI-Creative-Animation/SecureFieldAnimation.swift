//
//  SecureFieldAnimation.swift
//  SwiftUI-Creative-Animation
//
//  Created by Adam on 6/17/21.
//

import SwiftUI

struct SecureFieldAnimation: View {
    
    @State private var password = ""
    
    @State private var securePassword = "*"
    
    @State private var showPassword = false
    
    @State private var scaleAnimation = false
    
    var body: some View {
        
        VStack{
            Spacer()
            
            HStack{
                
                Image(systemName:"lock.square.stack")
                    .padding(.leading, 15)
                
                if showPassword {
  
                    TextField("", text: $password)
                        .foregroundColor(Color(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)).opacity(0))
                        .font(.system(size: 20, weight: .semibold))
                        .frame(height: 50)
                        .autocapitalization(.sentences)
                        .overlay(
                            password.isEmpty ? Text("Password") : Text(""), alignment: .leading)
     
                }else{
                    
                    SecureField("", text: $password)
                        .font(Font.system(size: 17))
                        .frame(height: 50)
                        .overlay(
                            password.isEmpty ? Text("Password") : Text(""), alignment: .leading)
                    
                }
                
                Image(systemName:showPassword ? "eye.slash" : "eye")
                    .padding(.trailing, 15)
                    .onTapGesture {
                        scaleAnimation.toggle()
                        showPassword.toggle()
                    }
                
            }//End of HStack
            .foregroundColor(Color(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)), lineWidth: 3))
            .overlay(
                
                Text(showPassword ? "\(password)" : "")
                    .foregroundColor(Color(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)))
                    .font(.system(size: 20, weight: .semibold))
                    .autocapitalization(.sentences)
                    .padding(.leading, 41)
                    .scaleEffect(y: scaleAnimation ? 1 : 0)
                    .animation(.easeOut)
                , alignment: .leading)
            .padding(.horizontal, 20)
            
            Spacer()
        }//End of VSTack
        .background(Color(#colorLiteral(red: 0.07843137255, green: 0.1137254902, blue: 0.1490196078, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct SecureFieldAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldAnimation()
    }
}
