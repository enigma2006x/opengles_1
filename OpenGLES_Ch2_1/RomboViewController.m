//
//  RomboViewController.m
//  OpenGLES_Ch2_1
//
//  Created by Antonio Trejo on 2/11/13.
//
//

#import "RomboViewController.h"

typedef struct{
    
    GLKVector3 positionCoords;
    
}SceneVertex;

static const SceneVertex vertices[] =
{
    //Triangulo superior
    {{-0.5f, 0.0f, 0.0f}},
    {{0.5f, 0.0f, 0.0f}},
    {{0.0f, 0.5f, 0.0f}},
    //Triangulo inferior
    {{-0.5f, 0.0f, 0.0f}},
    {{0.5f, 0.0f, 0.0f}},
    {{0.0f, -0.5f, 0.0f}}
};


@interface RomboViewController ()

@end

@implementation RomboViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GLKView *view = (GLKView *) self.view;
    
    NSAssert([view isKindOfClass:[GLKView class]], @"View controller's view is not a GLKView");
    
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];
    
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(1.0, 1.0, 1.0, 1.0);
    
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    
    glGenBuffers(1, &vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
    
	// Do any additional setup after loading the view.
}

- (void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
    [self.baseEffect prepareToDraw];
    
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(SceneVertex), NULL);
    
    glDrawArrays(GL_TRIANGLES, 0, 6);
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
