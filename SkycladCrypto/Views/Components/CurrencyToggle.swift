//
//  CurrencyToggle.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//

import SwiftUI

struct CustomDollarToggle: View {
    @State private var isToggled: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            // Your exact toggle from the design
            DollarToggleView(isOn: $isToggled)
            
            // Example usage
            VStack(alignment: .leading, spacing: 16) {
                Text("Settings")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    Text("Currency Toggle")
                        .font(.body)
                    
                    Spacer()
                    
                    DollarToggleView(isOn: $isToggled)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
        }
        .padding()
    }
}

struct DollarToggleView: View {
    @Binding var isOn: Bool
    
    private let toggleWidth: CGFloat = 80
    private let toggleHeight: CGFloat = 40
    private let capsuleWidth: CGFloat = 49
    private let capsuleHeight: CGFloat = 40
    
    var body: some View {
        ZStack {
            // Gray background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.3))
                .frame(width: toggleWidth, height: toggleHeight)
            
            // Dollar sign icons
            HStack {
                Text("$")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isOn ? Color.gray.opacity(0.5) : Color.white)
                
                Spacer()
                
                Text("$")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isOn ? Color.white : Color.gray.opacity(0.5))
            }
            .padding(.horizontal, 12)
            .frame(width: toggleWidth)
            
            // Black capsule selector
            HStack {
                if isOn {
                    Spacer()
                }
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.black)
                    .frame(width: capsuleWidth, height: capsuleHeight)
                
                if !isOn {
                    Spacer()
                }
            }
            .padding(.horizontal, 4)
            .frame(width: toggleWidth)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.25)) {
                isOn.toggle()
            }
        }
    }
}

// Preview
struct CustomDollarToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomDollarToggle()
            .preferredColorScheme(.dark)
    }
}
