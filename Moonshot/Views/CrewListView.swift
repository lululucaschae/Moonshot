//
//  CrewListView.swift
//  Moonshot
//
//  Created by Lucas Chae on 5/11/22.
//

import SwiftUI


struct CrewListView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(astronauts.keys.sorted(), id: \.self) {key in
                        NavigationLink {
                            AstronautView(astronaut: astronauts[key]!)
                        } label: {
                            VStack {
                                Image(astronauts[key]!.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(astronauts[key]!.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
//                                        .foregroundColor(.white.opacity(0.5))
                              
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Crews")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}




struct CrewListView_Previews: PreviewProvider {
    static var previews: some View {
        CrewListView()
    }
}
