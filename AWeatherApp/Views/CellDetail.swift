//
//  CellDetail.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import SwiftUI


struct CellDetail: View {
  
            
            // MARK: - Properties
            let title: String
            let detail: String
            
            // MARK: - Body
            var body: some View {
                VStack(alignment: .leading) {
                    Text(title).font(.body).fontWeight(.light)
                    Text(detail).bold()
                }
                Divider()
            }
        }
