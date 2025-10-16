//
//  Flights.swift
//  Soar
//
//  Created by kartikay on 13/10/25.
//

import SwiftUI

struct Flights: View {

    @State private var searchText = ""
    @State private var isExpanded = false
    @State private var selectedCard: Int? = nil
    @Namespace private var animation

    let mockFlights = [
        FlightData(id: 0, flightNumber: "IGO 2033", airline: "IndiGo", fromCode: "DEL", fromCity: "Delhi", toCode: "BOM", toCity: "Mumbai", departure: "10:30", arrival: "12:45", duration: "2h 15m", date: "16 June 2024", color: Color(red: 0.2, green: 0.4, blue: 0.9)),
        FlightData(id: 1, flightNumber: "AI 865", airline: "Air India", fromCode: "BLR", fromCity: "Bengaluru", toCode: "DEL", toCity: "Delhi", departure: "14:15", arrival: "17:00", duration: "2h 45m", date: "17 June 2024", color: Color(red: 0.8, green: 0.2, blue: 0.3)),
        FlightData(id: 2, flightNumber: "UK 997", airline: "Vistara", fromCode: "NYC", fromCity: "New York", toCode: "SFO", toCity: "San Francisco", departure: "08:00", arrival: "13:30", duration: "5h 30m", date: "18 June 2024", color: Color(red: 0.5, green: 0.2, blue: 0.7)),
        FlightData(id: 3, flightNumber: "EK 505", airline: "Emirates", fromCode: "DXB", fromCity: "Dubai", toCode: "BOM", toCity: "Mumbai", departure: "03:30", arrival: "08:15", duration: "3h 15m", date: "19 June 2024", color: Color(red: 0.1, green: 0.6, blue: 0.5)),
        FlightData(id: 4, flightNumber: "SQ 423", airline: "Singapore Airlines", fromCode: "SIN", fromCity: "Singapore", toCode: "DEL", toCity: "Delhi", departure: "23:55", arrival: "03:30", duration: "5h 35m", date: "20 June 2024", color: Color(red: 0.9, green: 0.5, blue: 0.2)),
        FlightData(id: 5, flightNumber: "LH 760", airline: "Lufthansa", fromCode: "FRA", fromCity: "Frankfurt", toCode: "DEL", toCity: "Delhi", departure: "13:45", arrival: "01:25", duration: "7h 40m", date: "21 June 2024", color: Color(red: 0.2, green: 0.3, blue: 0.7)),
        FlightData(id: 6, flightNumber: "BA 198", airline: "British Airways", fromCode: "DEL", fromCity: "Delhi", toCode: "LHR", toCity: "London", departure: "02:10", arrival: "06:45", duration: "9h 5m", date: "21 June 2024", color: Color(red: 0.3, green: 0.5, blue: 0.9)),
        FlightData(id: 7, flightNumber: "QR 571", airline: "Qatar Airways", fromCode: "DOH", fromCity: "Doha", toCode: "DEL", toCity: "Delhi", departure: "19:25", arrival: "01:00", duration: "3h 5m", date: "22 June 2024", color: Color(red: 0.2, green: 0.6, blue: 0.8)),
        FlightData(id: 8, flightNumber: "TG 316", airline: "Thai Airways", fromCode: "BKK", fromCity: "Bangkok", toCode: "BOM", toCity: "Mumbai", departure: "11:30", arrival: "14:45", duration: "4h 45m", date: "23 June 2024", color: Color(red: 0.8, green: 0.3, blue: 0.4)),
        FlightData(id: 9, flightNumber: "CX 696", airline: "Cathay Pacific", fromCode: "HKG", fromCity: "Hong Kong", toCode: "BLR", toCity: "Bengaluru", departure: "21:00", arrival: "01:05", duration: "5h 35m", date: "24 June 2024", color: Color(red: 0.2, green: 0.5, blue: 0.7)),
        FlightData(id: 10, flightNumber: "AF 225", airline: "Air France", fromCode: "CDG", fromCity: "Paris", toCode: "DEL", toCity: "Delhi", departure: "10:15", arrival: "22:45", duration: "8h 30m", date: "25 June 2024", color: Color(red: 0.3, green: 0.4, blue: 0.8)),
        FlightData(id: 11, flightNumber: "AA 101", airline: "American Airlines", fromCode: "JFK", fromCity: "New York", toCode: "LAX", toCity: "Los Angeles", departure: "07:00", arrival: "10:15", duration: "5h 15m", date: "26 June 2024", color: Color(red: 0.6, green: 0.2, blue: 0.4)),
        FlightData(id: 12, flightNumber: "QF 10", airline: "Qantas", fromCode: "LHR", fromCity: "London", toCode: "MEL", toCity: "Melbourne", departure: "21:55", arrival: "17:30", duration: "21h 35m", date: "27 June 2024", color: Color(red: 0.9, green: 0.3, blue: 0.2)),
        FlightData(id: 13, flightNumber: "SU 233", airline: "Aeroflot", fromCode: "SVO", fromCity: "Moscow", toCode: "DEL", toCity: "Delhi", departure: "18:45", arrival: "03:15", duration: "6h 0m", date: "28 June 2024", color: Color(red: 0.3, green: 0.3, blue: 0.6)),
        FlightData(id: 14, flightNumber: "TK 720", airline: "Turkish Airlines", fromCode: "IST", fromCity: "Istanbul", toCode: "BOM", toCity: "Mumbai", departure: "19:30", arrival: "04:25", duration: "6h 25m", date: "29 June 2024", color: Color(red: 0.1, green: 0.5, blue: 0.7))
    ]

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            if isExpanded {
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            isExpanded = false
                            selectedCard = nil
                        }
                    }
            }

            VStack(spacing: 0) {
                HStack {
                    Text("My flights")
                        .font(.system(size: 34, weight: .bold, design: .rounded))

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 30))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search flight number", text: $searchText)
                        .textFieldStyle(.plain)
                }
                .padding(14)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding(.top, 8)

                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .top) {
                        let flightsToShow = isExpanded ? mockFlights : Array(mockFlights.prefix(4))

                        ForEach(Array(flightsToShow.enumerated()), id: \.element.id) { index, flight in
                            FlightCard(
                                flight: flight,
                                index: index,
                                totalCards: isExpanded ? mockFlights.count : min(4, mockFlights.count),
                                isExpanded: isExpanded,
                                isSelected: selectedCard == index,
                                onTap: {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                                        if !isExpanded {
                                            isExpanded = true
                                            selectedCard = index
                                        } else if selectedCard == index {
                                            isExpanded = false
                                            selectedCard = nil
                                        } else {
                                            selectedCard = index
                                        }
                                    }
                                }
                            )
                        }

                        if !isExpanded && mockFlights.count > 4 {
                            VStack {
                                Spacer()
                                HStack {
                                    Text("+\(mockFlights.count - 4) more")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white.opacity(0.7))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 4)
                                        .background(Color.black.opacity(0.3))
                                        .cornerRadius(12)
                                }
                                .padding(.bottom, 8)
                            }
                            .frame(height: 80)
                            .offset(y: CGFloat(3) * 15 + 40)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.bottom, isExpanded ? CGFloat(mockFlights.count) * 85 : 80)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
