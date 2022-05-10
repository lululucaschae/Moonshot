////
////  MissionCrewsVierw.swift
////  Moonshot
////
////  Created by Lucas Chae on 5/10/22.
////
//
//import SwiftUI
//
//struct MissionCrewsView: View {
//    
//    let mission: Mission
//    
//    struct CrewMember {
//        let role: String
//        let name: Astronaut
//    }
//    
//    let crew: [CrewMember]
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(crew, id: \.role) { crewMember in
//                    NavigationLink {
//                        AstronautView(astronaut: crewMember.name)
//                    } label: {
//                        HStack {
//                            Image(crewMember.name.id)
//                                .resizable()
//                                .frame(width: 104, height: 72)
//                                .clipShape(Capsule())
//                                .overlay(
//                                    Capsule()
//                                        .strokeBorder(.white, lineWidth: 1)
//                                )
//
//                            VStack(alignment: .leading) {
//                                Text("Crew")
//                                    .font(.title.bold())
//                                    .padding(.bottom, 5)
//                                Text(crewMember.name.name)
//                                    .foregroundColor(.white)
//                                    .font(.headline)
//                                Text(crewMember.role)
//                                    .foregroundColor(.secondary)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                }
//            }
//        }
//    }
//    init(mission: Mission, astronauts: [String: Astronaut]) {
//    self.mission = mission
//    self.crew = mission.crew.map { member in
//        if let astronaut = astronauts[member.name] {
//            return CrewMember(role: member.role, name: astronaut)
//        } else {
//            fatalError("Missing \(member.name)")
//        }
//    }
//    }
//    
//}
//
//struct MissionCrewsView_Previews: PreviewProvider {
//    static let missions: [Mission] = Bundle.main.decode("missions.json")
//    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    static var previews: some View {
//        MissionCrewsView(mission: missions[0], astronauts: astronauts)
//    }
//}
