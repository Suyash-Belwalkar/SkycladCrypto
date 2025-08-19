//
//  SegmentControlView 2.swift
//  SkycladCrypto
//
//  Created by Suyash on 19/08/25.
//


import SwiftUI

struct SegmentControlView2<ID: Identifiable, Content: View, Background: Shape>: View {
    let segments: [ID]
    @Binding var selected: ID
    var titleNormalColor: Color
    var titleSelectedColor: Color
    var bgColor: Color
    let animation: Animation
    @ViewBuilder var content: (ID) -> Content
    @ViewBuilder var background: () -> Background
    
    @Namespace private var namespace
    
    var body: some View {
        GeometryReader { bounds in
            HStack(spacing: 0) {
                ForEach(segments) { segment in
                    NewSegmentButtonView2(id: segment,
                                         selectedId: $selected,
                                         titleNormalColor: titleNormalColor,
                                         titleSelectedColor: titleSelectedColor,
                                         bgColor: bgColor,
                                         animation: animation,
                                         namespace: namespace) {
                        content(segment)
                    } background: {
                        background()
                    }
                    .frame(width: 50)
                }
            }
            .background {
                background()
                    .fill(Color.clear)
            }
        }
    }
}

fileprivate struct NewSegmentButtonView2<ID: Identifiable, Content: View, Background: Shape> : View {
    let id: ID
    @Binding var selectedId: ID
    var titleNormalColor: Color
    var titleSelectedColor: Color
    var bgColor : Color
    var animation: Animation
    var namespace: Namespace.ID
    @ViewBuilder var content: () -> Content
    @ViewBuilder var background: () -> Background
    
    
    var body: some View {
        GeometryReader { bounds in
            Button {
                withAnimation(animation) {
                    selectedId = id
                }
            } label: {
                content()
            }
            .frame(width: 80, height: 50)
            .scaleEffect(selectedId.id == id.id ? 1 : 0.8)
            .clipShape(background())
            .foregroundColor(selectedId.id == id.id ? .white : .white)
            .background(buttonBackground)
        }
    }
    
    @ViewBuilder private var buttonBackground: some View {
        if selectedId.id == id.id {
            background()
                .fill(Color(hex: "#1b1a1c"))
                .frame(width: 45, height: 40)
                .matchedGeometryEffect(id: "SelectedTab", in: namespace)
        }
    }
}

enum Segment2: Identifiable, CaseIterable {
    case  oneHour ,eigthHour,oneDay,oneWeek,oneMonth,sixMonth,oneYear
    
    var id: String {
        title
    }
    
    var title: String {
        switch self {
        case .oneHour:
            return "1h"
        case .eigthHour:
            return "8h"
        case .oneDay:
            return "1D"
        case .oneWeek:
            return "1W"
        case .oneMonth:
            return "1M"
        case .sixMonth:
            return "6M"
        case .oneYear:
            return "1Y"
        }
    }
    
    var icon: String {
        switch self {
        case .oneHour:
            return "1h"
        case .eigthHour:
            return "8h"
        case .oneDay:
            return "1D"
        case .oneWeek:
            return "1W"
        case .oneMonth:
            return "1M"
        case .sixMonth:
            return "6M"
        case .oneYear:
            return "1Y"
        }
    }
}

