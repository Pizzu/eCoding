//
//  ContentView.swift
//  eCoding
//
//  Created by Luca Lo Forte on 6/5/21.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State private var email : String = ""
    @State private var editingEmailTextfield : Bool = false
    @State private var emailIconBounce : Bool = false
    @State private var password : String = ""
    @State private var editingPasswordTextfield : Bool = false
    @State private var passwordIconBounce : Bool = false
    
    private var generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Image("background-3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            content
        }
    }
    
    var content : some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Sign up")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Text("Access to 120+ hours of courses, tutorials and livestreams")
                    .font(.subheadline)
                    .foregroundColor(Color.white.opacity(0.7))
                
                HStack(spacing: 12) {
                    TextfieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextfield)
                        .scaleEffect(self.emailIconBounce ? 1.2 : 1)
                
                    TextField("Email", text: $email) { isEditing in
                        self.editingEmailTextfield = isEditing
                        self.editingPasswordTextfield = false
                        self.generator.selectionChanged()
                        if isEditing {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                self.emailIconBounce = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                    self.emailIconBounce = false
                                }
                            }
                        }
                    }
                    .colorScheme(.dark)
                    .foregroundColor(Color.white.opacity(0.7))
                    .autocapitalization(.none)
                    .textContentType(.emailAddress)
                    
                }
                .frame(height: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1)
                        .blendMode(.overlay)
                )
                .background(
                    Color("secondaryBackground")
                        .cornerRadius(16)
                        .opacity(0.8)
                )
                
                HStack(spacing: 12) {
                    TextfieldIcon(iconName: "key.fill", currentlyEditing: $editingPasswordTextfield)
                        .scaleEffect(self.passwordIconBounce ? 1.2 : 1)
                    
                    SecureField("Password", text: $password) 
                        .colorScheme(.dark)
                        .foregroundColor(Color.white.opacity(0.7))
                        .autocapitalization(.none)
                        .textContentType(.password)
                }
                .frame(height: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 1)
                        .blendMode(.overlay)
                )
                .background(
                    Color("secondaryBackground")
                        .cornerRadius(16)
                        .opacity(0.8)
                )
                .onTapGesture {
                    self.editingPasswordTextfield = true
                    self.editingEmailTextfield = false
                    self.generator.selectionChanged()
                    if editingPasswordTextfield {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                            self.passwordIconBounce = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                self.passwordIconBounce = false
                            }
                        }
                    }
                }
                
                GradientButton()
                
                Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy")
                    .font(.footnote)
                    .foregroundColor(Color.white.opacity(0.7))
            
                Divider()
                    .background(Color.white.opacity(0.3))
                
                Button(action: {
                    print("Flip card")
                }, label: {
                    HStack(spacing: 4.0) {
                        Text("Already have an account?")
                            .font(.footnote)
                            .foregroundColor(Color.white.opacity(0.7))
                        GradientText(text: "Sign In")
                            .font(Font.footnote.bold())
                    }
                })
            }
            .padding(20)
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white.opacity(0.3))
                .background(Color("secondaryBackground").opacity(0.5))
                .background(VisualEffectBlur(blurStyle: .systemMaterialDark))
                .shadow(color: Color("shadowColor").opacity(0.5), radius: 16, x: 0.0, y: 30)
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
