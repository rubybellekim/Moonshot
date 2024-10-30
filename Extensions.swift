//
//  Extensions.swift
//  Moonshot
//
//  Created by Ruby Kim on 2024-09-12.
//

import Foundation
import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct SectionDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}
