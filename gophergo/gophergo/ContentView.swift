//
//  ContentView.swift
//  gophergo
//
//  Created by Tommy Su on 3/12/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var count = Count()
    var found = FoundCount()
    
    var body: some View {
          ZStack(){
                ARViewContainer(count: count, found: found).edgesIgnoringSafeArea(.all)
            }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var count: Count
    @ObservedObject var found: FoundCount
    
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let sceneAnchor = try! Experience.loadPie()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(sceneAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        updateCounter(uiView: uiView)
    }
    
    private func updateCounter(uiView: ARView){
        //uiView.scene.anchors.removeAll()
        let anchor = AnchorEntity()
        
        let text = MeshResource.generateText("\(found.num) / \(count.num) ",
                                             extrusionDepth: 0.08,
                                             font: .systemFont(ofSize: 0.5, weight: .bold),
                                             containerFrame: .zero,
                                             alignment: .center)
        let shader = SimpleMaterial(color: .blue, isMetallic: true)
        let textEntity = ModelEntity(mesh: text, materials: [shader])
        
        textEntity.position.z -= 1.5
       // textEntity.setPosition(SIMD3<Float>(0.2, 0.2, 0.2), relativeTo: anchor)
        textEntity.setParent(anchor)
        uiView.scene.addAnchor(anchor)
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
