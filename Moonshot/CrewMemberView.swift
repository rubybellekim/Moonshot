//
//  Extensions.swift
//  Moonshot
//
//  Created by Ruby Kim on 2024-09-12.
//

import SwiftUI

struct CrewMemberView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        //section divider
        SectionDivider()
        
        Text("Crew")
            .font(.title.bold())
            .padding(.bottom, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView.init(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
        
    init(mission: Mission, crew: [CrewMember]) {
        self.mission = mission
        self.crew = crew
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let crew = missions[0].crew.map { member in
        CrewMember(role: member.role, astronaut: astronauts[member.name]!)
    }
    
    return CrewMemberView(mission: missions[0], crew: crew)
        .preferredColorScheme(.dark)
}
