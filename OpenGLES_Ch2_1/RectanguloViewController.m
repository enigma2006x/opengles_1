//
//  RectanguloViewController.m
//  OpenGLES_Ch2_1
//
//  Created by Antonio Trejo on 2/11/13.
//
//

#import "RectanguloViewController.h"

@interface RectanguloViewController ()

@end

@implementation RectanguloViewController

@synthesize baseEffect;


typedef struct{
    GLKVector4 postionCoords;
} SceneVertex;

static const SceneVertex vertices[] =
{
    {{-0.5, -0.5, 0.0}},
    {{0.5, -0.5, 0.0}},
    {{-0.5, 0.5, 0.0}},
    {{0.5, 0.5, 0.0}},
    {{0.5, -0.5, 0.0}},
    {{-0.5, 0.5, 0.0}},
};


- (void)viewDidLoad
{
    [super viewDidLoad];

    GLKView *view = (GLKView *) self.view;
    
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];
    
    
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    
    self.baseEffect.constantColor = GLKVector4Make(1.0f,
                                                   0,
                                                   0.85f,
                                                   1.0f);
    
    
    glClearColor(0.0f, 0.67f, 0.88f, 1.0f);
    
    glGenBuffers(1, &vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
    
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.baseEffect prepareToDraw];
    
    // Clear Frame Buffer (erase previous drawing)
    glClear(GL_COLOR_BUFFER_BIT);
    
    // Enable use of positions from bound vertex buffer
    glEnableVertexAttribArray(      // STEP 4
                              GLKVertexAttribPosition);
    
    glVertexAttribPointer(          // STEP 5
                          GLKVertexAttribPosition,
                          3,                   // three components per vertex
                          GL_FLOAT,            // data is floating point
                          GL_FALSE,            // no fixed point scaling
                          sizeof(SceneVertex), // no gaps in data
                          NULL);               // NULL tells GPU to start at
    // beginning of bound buffer
    
    // Draw triangles using the first three vertices in the
    // currently bound vertex buffer
    glDrawArrays(GL_TRIANGLES,      // STEP 6
                 0,  // Start with first vertex in currently bound buffer
                 6); // Use three vertices from currently bound buffer
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
