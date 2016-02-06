//
//  ViewController.m
//  SceneKit Demo
//
//  Created by Jared Halpern on 11/23/15.
//  Copyright © 2015 Jared Halpern. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *sceneView = [[SCNView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:sceneView];
    
    SCNScene *scene = [[SCNScene alloc] init];
    sceneView.scene = scene;
    
    
    SCNCamera *camera = [[SCNCamera alloc] init];
    SCNNode *cameraNode = [[SCNNode alloc] init];
    cameraNode.camera = camera;
    cameraNode.position = SCNVector3Make(-3.0, 3.0, 3.0);
    
    SCNBox *cubeGeometry = [SCNBox boxWithWidth:1.0 height:1.0 length:1.0 chamferRadius:0.0];
    SCNNode *cubeNode = [SCNNode nodeWithGeometry:cubeGeometry];
    
    SCNLight *ambientLight = [SCNLight light];
    ambientLight.type = SCNLightTypeAmbient;
    ambientLight.color = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
    cameraNode.light = ambientLight;
    
    SCNLight *light = [SCNLight light];
    light.type = SCNLightTypeSpot;
    light.spotInnerAngle = 30.0;
    light.spotOuterAngle = 80.0;
    light.castsShadow = YES;
    
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = light;
    lightNode.position = SCNVector3Make(2.0, 1.5, 1.5);
    SCNLookAtConstraint *constraint = [SCNLookAtConstraint lookAtConstraintWithTarget:cubeNode];
    constraint.gimbalLockEnabled = YES;
    cameraNode.constraints = @[constraint];
    lightNode.constraints = @[constraint];
    
    // plane underneath
    
    SCNPlane *planeGeometry = [SCNPlane planeWithWidth:100. height:100.];
    SCNNode *planeNode = [SCNNode nodeWithGeometry:planeGeometry];
    planeNode.eulerAngles = SCNVector3Make(GLKMathDegreesToRadians(-90.0), 0, 0);
    planeNode.position = SCNVector3Make(0, -0.5, 0);
    
    // Materials
    
    SCNMaterial *redMaterial = [[SCNMaterial alloc] init];
    redMaterial.diffuse.contents = [UIColor redColor];
    cubeGeometry.materials = @[redMaterial];
    
    SCNMaterial *greenMaterial = [[SCNMaterial alloc] init];
    greenMaterial.diffuse.contents = [UIColor greenColor];
    planeGeometry.materials = @[greenMaterial];
    
    
    [scene.rootNode addChildNode:cameraNode];
    [scene.rootNode addChildNode:lightNode];
    [scene.rootNode addChildNode:cubeNode];
    [scene.rootNode addChildNode:planeNode];
    
    
}

@end
