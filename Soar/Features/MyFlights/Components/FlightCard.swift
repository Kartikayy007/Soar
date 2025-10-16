//
//  FlightCard.swift
//  Soar
//
//  Created by kartikay on 16/10/25.
//

import SwiftUI

struct FlightCard: View {
    let flight: FlightData
    let index: Int
    let totalCards: Int
    let isExpanded: Bool
    let isSelected: Bool
    let onTap: () -> Void

    private var cardOffset: CGSize {
        if isExpanded {
            let spacing: CGFloat = 85
            return CGSize(width: 0, height: CGFloat(index) * spacing)
        } else {
            let baseOffset = CGFloat(index) * 15
            return CGSize(width: 0, height: baseOffset)
        }
    }

    private var cardRotation: Double {
        if isExpanded {
            let rotationAngles: [Double] = [-0.5, 0.8, -0.3, 0.6, -0.7, 0.4, -0.6, 0.5, -0.4, 0.7, -0.8, 0.3, -0.5, 0.6, -0.4]
            return index < rotationAngles.count ? rotationAngles[index] : Double(index % 2 == 0 ? -0.5 : 0.5)
        } else {
            let maxRotation: Double = 2.5
            let middleIndex = Double(totalCards - 1) / 2
            let normalizedIndex = (Double(index) - middleIndex) / middleIndex
            return normalizedIndex * maxRotation
        }
    }

    private var cardScale: CGFloat {
        if isExpanded && !isSelected {
            return 0.98
        } else if isSelected {
            return 1.01
        }
        return 1.0 - (CGFloat(index) * 0.015)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .fill(
                    LinearGradient(
                        colors: [
                            flight.color,
                            flight.color.opacity(0.95),
                            flight.color.opacity(0.9)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            RoundedRectangle(cornerRadius: 14)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.2),
                            Color.clear
                        ],
                        startPoint: .top,
                        endPoint: .center
                    )
                )
                .blendMode(.overlay)

            HStack(spacing: 0) {
                Circle()
                    .fill(Color(.systemBackground))
                    .frame(width: 20, height: 20)
                    .offset(x: -10)

                Spacer()

                Circle()
                    .fill(Color(.systemBackground))
                    .frame(width: 20, height: 20)
                    .offset(x: 10)
            }

            VStack(spacing: 0) {
                Text(flight.flightNumber)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.top, 10)

                Spacer()

                HStack(spacing: 16) {
                    Text(flight.fromCode)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)

                    HStack(spacing: 3) {
                        Rectangle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 15, height: 1)

                        Image(systemName: "airplane")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))

                        

                        Rectangle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 15, height: 1)
                    }

                    Text(flight.toCode)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                }

                HStack(spacing: 0) {
                    Text(flight.departure)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                        .frame(width: 40, alignment: .center)

                    Spacer()
                        .frame(width: 30)

                    Text(flight.duration)
                        .font(.system(size: 9, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.2))
                        )

                    Spacer()
                        .frame(width: 30)

                    Text(flight.arrival)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                        .frame(width: 40, alignment: .center)
                }
                .padding(.top, 2)

                Spacer()

                Text(flight.date)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.bottom, 10)
            }
        }
        .frame(height: 80)
        .padding(.horizontal, 20)
        .offset(cardOffset)
        .rotationEffect(.degrees(cardRotation))
        .scaleEffect(cardScale)
        .zIndex(isSelected ? 100 : Double(totalCards - index))
        .shadow(
            color: Color.black.opacity(isSelected ? 0.25 : 0.12),
            radius: isSelected ? 15 : 8,
            x: 0,
            y: isSelected ? 8 : 4
        )
        .onTapGesture(perform: onTap)
        .animation(.spring(response: 0.4, dampingFraction: 0.75), value: isExpanded)
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: isSelected)
    }

    func getAirlineIcon(_ airline: String) -> String {
        switch airline {
        case "IndiGo":
            return "airplane.circle"
        case "Air India":
            return "airplane"
        case "Vistara":
            return "airplane.circle.fill"
        case "Emirates":
            return "airplane.departure"
        case "Singapore Airlines":
            return "airplane.arrival"
        default:
            return "airplane"
        }
    }
}


struct FlightData {
    let id: Int
    let flightNumber: String
    let airline: String
    let fromCode: String
    let fromCity: String
    let toCode: String
    let toCity: String
    let departure: String
    let arrival: String
    let duration: String
    let date: String
    let color: Color
}
