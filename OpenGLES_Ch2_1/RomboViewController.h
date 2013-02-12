//
//  RomboViewController.h
//  OpenGLES_Ch2_1
//
//  Created by Antonio Trejo on 2/11/13.
//
//

#import <GLKit/GLKit.h>

@interface RomboViewController : GLKViewController{
    
    GLuint vertexBufferID;
    
}

@property (strong, nonatomic) GLKBaseEffect *baseEffect;



@end
