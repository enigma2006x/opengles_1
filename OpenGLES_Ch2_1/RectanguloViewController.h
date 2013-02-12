//
//  RectanguloViewController.h
//  OpenGLES_Ch2_1
//
//  Created by Antonio Trejo on 2/11/13.
//
//

#import <GLKit/GLKit.h>

@interface RectanguloViewController : GLKViewController{
    
    GLuint vertexBufferID;
    
}

@property (nonatomic, strong) GLKBaseEffect *baseEffect;

@end
