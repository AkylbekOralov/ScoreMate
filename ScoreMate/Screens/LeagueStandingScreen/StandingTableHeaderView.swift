//
//  StandingTableHeaderView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

enum StandingHeaderTooltip: String {
    case matchesPlayed = "Matches Played"
    case goals = "Goals Scored / Goals Against"
    case points = "Points"
}

struct StandingTableHeaderView: View {
    @Binding var activeTooltip: StandingHeaderTooltip?
    @State private var tooltipSize: CGSize = .zero
    
    private let tooltipArrowWidth: CGFloat = 12
    private let tooltipCornerRadius: CGFloat = 10
    
    private let rankWidth: CGFloat = 25
    private let teamTrailingPadding: CGFloat = Paddings.x1
    private let matchesWidth: CGFloat = 25
    private let matchesTrailingPadding: CGFloat = Paddings.x2
    private let goalsWidth: CGFloat = 54
    private let goalsTrailingPadding: CGFloat = Paddings.x2
    private let pointsWidth: CGFloat = 25
    private let tooltipHorizontalMargin: CGFloat = Paddings.x4
    
    var line: some View {
        Rectangle()
            .fill(SmColors.tableDivider.swiftUIColor)
            .frame(height: 1)
    }
    
    private func toggleTooltip(_ tooltip: StandingHeaderTooltip) {
        withAnimation(.easeInOut(duration: 0.18)) {
            activeTooltip = activeTooltip == tooltip ? nil : tooltip
        }
    }
    
    private func tooltipTargetCenterX(totalWidth: CGFloat) -> CGFloat {
        let horizontalPadding = Paddings.x4
        let contentWidth = max(totalWidth - (horizontalPadding * 2), 0)
        let teamWidth = max(
            contentWidth
            - rankWidth
            - teamTrailingPadding
            - matchesWidth
            - matchesTrailingPadding
            - goalsWidth
            - goalsTrailingPadding
            - pointsWidth,
            0
        )
        
        let rankOffset = rankWidth + teamTrailingPadding + teamWidth
        let matchesCenter = horizontalPadding + rankOffset + (matchesWidth / 2)
        let goalsCenter = matchesCenter + (matchesWidth / 2) + matchesTrailingPadding + (goalsWidth / 2)
        let pointsCenter = goalsCenter + (goalsWidth / 2) + goalsTrailingPadding + (pointsWidth / 2)
        
        switch activeTooltip {
        case .matchesPlayed:
            return matchesCenter
        case .goals:
            return goalsCenter
        case .points:
            return pointsCenter
        case nil:
            return 0
        }
    }
    
    private func tooltipCenterX(totalWidth: CGFloat) -> CGFloat {
        let unclampedCenter = tooltipTargetCenterX(totalWidth: totalWidth)
        let minCenter = (tooltipSize.width / 2) + tooltipHorizontalMargin
        let maxCenter = totalWidth - (tooltipSize.width / 2) - tooltipHorizontalMargin
        
        guard minCenter <= maxCenter else {
            return totalWidth / 2
        }
        
        return min(max(unclampedCenter, minCenter), maxCenter)
    }
    
    private func tooltipArrowOffset(totalWidth: CGFloat) -> CGFloat {
        let targetCenter = tooltipTargetCenterX(totalWidth: totalWidth)
        let bubbleCenter = tooltipCenterX(totalWidth: totalWidth)
        let maxOffset = max((tooltipSize.width / 2) - tooltipCornerRadius - (tooltipArrowWidth / 2), 0)
        
        return min(max(targetCenter - bubbleCenter, -maxOffset), maxOffset)
    }
    
    var body: some View {
        VStack(spacing: Paddings.x2) {
            line
            
            HStack(spacing: 0) {
                Text("#")
                    .frame(width: rankWidth, alignment: .leading)
                    .padding(.trailing, Paddings.x1)
                Text("Team")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, Paddings.x1)
                Button {
                    toggleTooltip(.matchesPlayed)
                } label: {
                    Text("M")
                        .frame(width: matchesWidth, alignment: .center)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .padding(.trailing, Paddings.x2)
                
                Button {
                    toggleTooltip(.goals)
                } label: {
                    Text("GS/GA")
                        .frame(width: goalsWidth, alignment: .center)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .padding(.trailing, Paddings.x2)
                
                Button {
                    toggleTooltip(.points)
                } label: {
                    Text("P")
                        .frame(width: pointsWidth, alignment: .center)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
            .font(.system(size: FontSizes.body, weight: .medium))
            .foregroundColor(SmColors.secondaryText.swiftUIColor)
            .padding(.horizontal, Paddings.x4)
            
            line
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.18)) {
                activeTooltip = nil
            }
        }
        .overlay(alignment: .topLeading) {
            if let activeTooltip {
                GeometryReader { proxy in
                    StandingHeaderTooltipView(
                        text: activeTooltip.rawValue,
                        arrowOffset: tooltipArrowOffset(totalWidth: proxy.size.width)
                    )
                        .measureSize($tooltipSize)
                        .position(
                            x: tooltipCenterX(totalWidth: proxy.size.width),
                            y: -8
                        )
                        .transition(.asymmetric(
                            insertion: .opacity.combined(with: .scale(scale: 0.96, anchor: .bottom)),
                            removal: .opacity.combined(with: .scale(scale: 0.96, anchor: .bottom))
                        ))
                }
                .allowsHitTesting(false)
            }
        }
        .animation(.easeInOut(duration: 0.18), value: activeTooltip)
    }
}

private struct StandingHeaderTooltipView: View {
    let text: String
    let arrowOffset: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Text(text)
                .font(.system(size: FontSizes.caption, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, Paddings.x3)
                .padding(.vertical, Paddings.x2)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black.opacity(0.9))
                )
            
            Triangle()
                .fill(Color.black.opacity(0.9))
                .frame(width: 12, height: 6)
                .offset(x: arrowOffset)
        }
        .fixedSize()
    }
}

private struct ViewSizeKey: PreferenceKey {
    static let defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

private extension View {
    func measureSize(_ size: Binding<CGSize>) -> some View {
        background(
            GeometryReader { proxy in
                Color.clear
                    .preference(key: ViewSizeKey.self, value: proxy.size)
            }
        )
        .onPreferenceChange(ViewSizeKey.self) { newSize in
            size.wrappedValue = newSize
        }
    }
}

private struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    VStack {
        StandingTableHeaderView(activeTooltip: .constant(nil))
        Spacer()
    }
}
