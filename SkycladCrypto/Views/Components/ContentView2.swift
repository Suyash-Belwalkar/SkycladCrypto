//
//  ContentView1 2.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//


import SwiftUI

struct ContentView2: View {
    @State private var selectedSegment1: Segment2 = .oneHour
    @State private var selectedSegment2: Segment2 = .oneHour
    @State var animation: Animation = .default
    @State var themeColor: Color = .primary
    
    var body: some View {
        GeometryReader { bounds in
            SegmentControlView2(segments: Segment2.allCases,
                                       selected: $selectedSegment2,
                                        titleNormalColor: themeColor,
                                       titleSelectedColor: .white,
                                        bgColor: Color.black,
                                       animation: animation) { segment in
                        Text("\(segment.title)")
                            .padding(.horizontal, 20)
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
    ContentView2()
}
