//
//  MissionView.swift
//  Moonshot
//
//  Created by Ruby Kim on 2024-08-27.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {
                        width, axis in width * 0.6
                    }
                
                VStack(alignment: .center) {
                    Text(mission.formattedLaunchDate)
                        .font(Font.system(size: 23, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding()
                        .overlay {
                            LinearGradient(
                                colors: [.gray, .teal, .blue],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .mask(
                                Text(mission.formattedLaunchDate)
                                    .font(Font.system(size: 23, weight: .bold))
                                    .multilineTextAlignment(.center)
                            )
                    }
                }
                
                VStack(alignment: .leading) {
                    
                    //section divider
                    SectionDivider()
                    
                    //Divider()
                      //this is barely seen
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)

                    CrewMemberView(mission: mission, crew: crew)
                }
                .padding(.horizontal)

            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
