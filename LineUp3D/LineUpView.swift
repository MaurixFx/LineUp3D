//
//  LineUpView.swift
//  LineUp3D
//
//  Created by Mauricio Figueroa olivares on 2/25/19.
//  Copyright © 2019 Mauricio Figueroa olivares. All rights reserved.
//

import UIKit
import SceneKit


class LineUpView: UIViewController {
    
    //MARK:- Create UIView
    var viewContent: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    //MARK:- Create SCNView
    var sceneView: SCNView = {
        var scene = SCNView()
        return scene
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        addComponentsInView()
        setupConstraints()
        setupScene()
    }
    
    private func addComponentsInView() {
        view.addSubview(viewContent)
        viewContent.addSubview(sceneView)
    }
    
    private func setupConstraints() {
        viewContent.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: view.frame.height * 0.60)
        sceneView.anchor(top: viewContent.topAnchor, left: viewContent.leftAnchor, bottom: viewContent.bottomAnchor, right: viewContent.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func setupScene() {
        guard let scene = SCNScene(named: "art.scnassets/lineup.scn") else { return }
        sceneView.allowsCameraControl = false
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.black
        sceneView.scene = scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 0.2)
        sceneView.scene?.rootNode.addChildNode(cameraNode)
        sceneView.scene?.background.contents = UIImage(named: "rio.jpg")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
