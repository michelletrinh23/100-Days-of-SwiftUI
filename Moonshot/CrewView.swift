//
//  CrewView.swift
//  Moonshot
//
//  Created by Michelle Trinh on 8/3/23.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct CrewView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
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
}

struct CrewView_Previews: PreviewProvider {
    static let crew = CrewMember(role: "Astronaut", astronaut: Astronaut(id: "123", name: "Neil", description: "Smart"))
    static let crew2 = CrewMember(role: "Chef", astronaut: Astronaut(id: "234", name: "Joyce", description: "Smart"))
    
    static var previews: some View {
        CrewView(crew: [crew, crew2])
    }
}
 
