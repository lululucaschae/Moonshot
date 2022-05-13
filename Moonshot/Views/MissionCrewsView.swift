//
//  MissionCrewsVierw.swift
//  Moonshot
//
//  Created by Lucas Chae on 5/10/22.
//

import SwiftUI

struct MissionCrewsView: View {
    
    let mission: Mission
    
    struct CrewMember {
        let role: String
        let individualCrew: Astronaut
    }
    
    let allMissionCrews: [CrewMember]
    
   
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(allMissionCrews, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.individualCrew)
                    } label: {
                        HStack {
                            Image(crewMember.individualCrew.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text("Crew")
                                    .font(.title.bold())
                                    .padding(.bottom, 5)
                                Text(crewMember.individualCrew.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        // Loop through the "crew" part of the selected mission
        self.allMissionCrews = mission.crew.map { member in
            // For every crew, look up their name in the astronaut dictionary, and store it as Astronaut
            if let astronaut = astronauts[member.name] {
                // And return that astronuat as 2   qfdfgxc  an instance of a CrewMember
                return CrewMember(role: member.role, individualCrew: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
   
    
    
}

struct MissionCrewsView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionCrewsView(mission: missions[0], astronauts: astronauts)
    }
}
