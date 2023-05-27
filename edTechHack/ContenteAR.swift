//
//  ARView.swift
//  edTechHack
//
//  Created by Marcelo Araujo on 26/05/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewContainer>) -> ViewController {
        let controller = ViewController()
        return controller
    }

    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<ARViewContainer>) {}
}

class ViewController: UIViewController, ARSessionDelegate {
    
    var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create ARView with the frame of the entire screen
        arView = ARView(frame: view.bounds)
        arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(arView)
        
        arView.session.delegate = self
        
        setupARView()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        arView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK: - Setup Methods
    
    func setupARView() {
        arView.automaticallyConfigureSession = false
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing = .automatic
        arView.session.run(configuration)
    }
    
    //MARK: - Object Placement
    
    @objc
    func handleTap(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: arView)
        
        let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let firstResult = results.first {
            let anchor = ARAnchor(name: "van", transform: firstResult.worldTransform)
            arView.session.add(anchor: anchor)
        } else {
            print("Object placement failed - couldn't find surface")
        }
    }
    
    func placeObject(named entityName: String, for anchor: ARAnchor) {
        let entity = try! ModelEntity.loadModel(named: entityName)
        
        entity.generateCollisionShapes(recursive: true)
        arView.installGestures([.rotation, .translation], for: entity)
        
        let anchorEntity = AnchorEntity(anchor: anchor)
        anchorEntity.addChild(entity)
        arView.scene.addAnchor(anchorEntity)
    }

    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            if let anchorName = anchor.name, anchorName == "van" {
                placeObject(named: anchorName, for: anchor)
            }
        }
    }
}

struct ContenteAR: View {
    var body: some View {
        ARViewContainer()
    }
}
