//
//  AstronautView.swift
//  Moonshot
//
//  Created by Lucas Chae on 5/10/22.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    func missionCoutner(mission: [Mission], astronaut: Astronaut) -> Int {
        var missionCount = 0
        for mission in missions {
            mission.crew.map {member in
                if astronaut.id == member.name {
                    missionCount += 1
                }
            }
        }
        return missionCount
    }
    
    
    var body: some View {
        let FinalMissionCount = missionCoutner(mission: missions, astronaut: astronaut)
        
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
                Text("Mission count is \(FinalMissionCount)")

            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)

    }
    
    struct AstronautView_Previews: PreviewProvider {
        
        static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        static var previews: some View {
            AstronautView(astronaut: astronauts["armstrong"]!)
                .preferredColorScheme(.dark)
        }
    }
}
