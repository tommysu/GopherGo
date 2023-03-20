//
//  foodcounterresult.swift
//  gophergo
//
//  Created by Tommy Su on 3/16/23.
//

import Foundation
import SwiftUI
import RealityKit

struct foodcounterresult: UIViewRepresentable{
    @ObservedObject var count: Count
    @ObservedObject var found: FoundCount
    
    func makeUIView(context: Context) -> ARView {
        return ARView(frame: .zero)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        updateCounter(uiView: uiView)
    }
    
    private func updateCounter(uiView: ARView){
        //uiView.scene.anchors.removeAll()
        let anchor = AnchorEntity()
        
        let text = MeshResource.generateText("FoundCount.num / Count.num ",
                                             extrusionDepth: 0.08,
                                             font: .systemFont(ofSize: 0.5, weight: .bold))
        let shader = SimpleMaterial(color: .blue, isMetallic: true)
        let textEntity = ModelEntity(mesh: text, materials: [shader])
        
        textEntity.position.z -= 1.5
        textEntity.setParent(anchor)
        uiView.scene.addAnchor(anchor)
    }
    
}
