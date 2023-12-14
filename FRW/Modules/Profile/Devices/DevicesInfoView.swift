//
//  DevicesInfoView.swift
//  FRW
//
//  Created by cat on 2023/10/30.
//

import MapKit
import SwiftUI

extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

struct DevicesInfoView: RouteableView {
    var info: DeviceInfoModel
    
    var title: String {
        return "device_info".localized
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    Map(coordinateRegion: .constant(region()), annotationItems: annotations()) {
                        MapAnnotation(coordinate: $0) {
                            Image("map_pin_1")
                                .frame(width: 40, height: 51)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 136)
                    .cornerRadius(16)
                    Color.clear
                        .frame(height: 8)
                    Text(info.showName())
                        .font(.inter(size: 16, weight: .bold))
                        .foregroundColor(Color.Theme.Text.black8)
                        .frame(height: 24)
                    Color.clear
                        .frame(height: 24)
                    
                    HStack(spacing: 0) {
                        Text("device_info".localized)
                            .font(.inter(size: 14, weight: .bold))
                            .foregroundColor(Color.Theme.Text.black3)
                        Spacer()
                    }
                    
                    Color.clear
                        .frame(height: 8)
                    
                    VStack {
                        DeviceInfoItem(title: "application_tag".localized, detail: info.showApp())
                        Divider()
                            .background(Color.Theme.Line.line)
                            .padding(.vertical, 16)
                        DeviceInfoItem(title: "ip_address_tag".localized, detail: info.showIP())
                        Divider()
                            .background(Color.Theme.Line.line)
                            .padding(.vertical, 16)
                        DeviceInfoItem(title: "location".localized, detail: info.showLocation())
                        Divider()
                            .background(Color.Theme.Line.line)
                            .padding(.vertical, 16)
                        DeviceInfoItem(title: "entry_date_tag".localized, detail: info.showDate())
                    }
                    .padding(.all, 16)
                    .background(.Theme.Background.grey)
                    .cornerRadius(16)
                }
                .padding(.horizontal, 18)
                .frame(maxHeight: .infinity)
            }
            
            Spacer()
            
//            VStack {
//                Button {
//
//                } label: {
//                    Text("revoke_device".localized)
//                        .font(.inter(size: 16,weight: .semibold))
//                        .foregroundStyle(Color.Theme.Text.white9)
//                }
//                .frame(height: 54)
//                .frame(maxWidth: .infinity)
//                .background(Color.Theme.Accent.red)
//                .cornerRadius(16)
//            }
//            .padding(.horizontal, 18)
        }
        
        .applyRouteable(self)
    }
    
    func region() -> MKCoordinateRegion {
        let region = MKCoordinateRegion(center: info.coordinate(), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        return region
    }
    
    func annotations() -> [CLLocationCoordinate2D] {
        return [
            info.coordinate()
        ]
    }
}

//#Preview {
//    DevicesInfoView(info: DeviceInfoModel.empty())
//}
