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
  
  SCNLight *light = [[SCNLight alloc] init];
  light.type = SCNLightTypeOmni;
  
  SCNNode *lightNode = [[SCNNode alloc] init];
  lightNode.light = light;
  lightNode.position = SCNVector3Make(1.5, 1.5, 1.5);
  
  
  SCNBox *cubeGeometry = [SCNBox boxWithWidth:.8 height:.8 length:.8 chamferRadius:0.0];
  SCNNode *cubeNode = [SCNNode nodeWithGeometry:cubeGeometry];
  
  SCNLookAtConstraint *constraint = [SCNLookAtConstraint lookAtConstraintWithTarget:cubeNode];
  constraint.gimbalLockEnabled = YES;
  cameraNode.constraints = @[constraint];
  
  
  [scene.rootNode addChildNode:cameraNode];
  [scene.rootNode addChildNode:lightNode];
  [scene.rootNode addChildNode:cubeNode];
}

@end
