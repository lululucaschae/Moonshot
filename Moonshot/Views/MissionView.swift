//
//  MissionView.swift
//  Moonshot
//
//  Created by Lucas Chae on 5/10/22.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    

    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    Text("Launched: \(mission.formattedLaunchDate)")
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
                
                MissionCrewsView(mission: mission, astronauts: astronauts)

            }
            
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        
    }

}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
