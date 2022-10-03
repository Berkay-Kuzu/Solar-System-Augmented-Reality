//
//  ViewController.swift
//  SolarSystemARKit
//
//  Created by Berkay Kuzu on 12.09.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let earth = createSphere(radius: 0.1, content: "earth.jpeg", vector: SCNVector3(0, 0.2, -1))
        
        let mars = createSphere(radius: 0.2, content: "mars.jpeg", vector: SCNVector3(0.5, 0.2, -1))
        
        let moon = createSphere(radius: 0.05, content: "moon.jpeg", vector: SCNVector3(1, 0.2, -1))
        
        let sun = createSphere(radius: 0.4, content: "sun.jpeg", vector: SCNVector3(1.5, 0.2, -1))
        
        sceneView.scene.rootNode.addChildNode(earth)
        sceneView.scene.rootNode.addChildNode(mars)
        sceneView.scene.rootNode.addChildNode(moon)
        sceneView.scene.rootNode.addChildNode(sun)
        
        sceneView.automaticallyUpdatesLighting = true

    }
    
    func createSphere(radius: CGFloat, content: String, vector: SCNVector3) -> SCNNode { // By creating a function like that, we can build different spheres.
        let mySphere = SCNSphere(radius: radius ) // radius is enough!!!
        
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content).png")
        
        mySphere.materials = [boxMaterial]
        
        let node = SCNNode()
        
        node.position = vector
        
        node.geometry = mySphere
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
