//
//  ContentView.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//


//
//  ContentView.swift
//  SegmentControl
//
//  Created by Pratik on 03/10/22.
//

import SwiftUI

struct ContentView1: View {
    @State private var selectedSegment1: Segment = .inr
    @State private var selectedSegment2: Segment = .inr
    @State var animation: Animation = .default
    @State var themeColor: Color = .primary
    
    var body: some View {
        GeometryReader { bounds in
                    SegmentControlView(segments: Segment.allCases,
                                       selected: $selectedSegment2,
                                       titleNormalColor: .white,
                                       titleSelectedColor: .white,
                                       bgColor: .black,
                                       animation: animation) { segment in
                        Image( segment.icon)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundStyle(.white)
                    } background: {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                    }
                    .frame(width: 100, height: 40 )
        }
    }
}

#Preview{
    ContentView1()
}
