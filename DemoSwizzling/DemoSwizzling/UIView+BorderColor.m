//
//  UIView+BorderColor.m
//  DemoSwizzling
//
//  Created by Rafael Aguilar Martín on 03/03/13.
//  Copyright (c) 2013 Rafael Aguilar Martín. All rights reserved.
//

#import "UIView+BorderColor.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

void MethodSwizzle(Class c, SEL origSEL, SEL overrideSEL)
{
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method overrideMethod = class_getInstanceMethod(c, overrideSEL);
    
    // Intercambiamos las implementaciones
    method_exchangeImplementations(origMethod, overrideMethod);
}

@implementation UIView (BorderColor)

// initWithNibName:bundle: llamará a initWithCoder: para instanciar tu vista desde el xib

- (id)swizzled_initWithCoder:(NSCoder *)decoder
{
    // Llamamos al original
    id result = [self swizzled_initWithCoder:decoder];
    
    // Nos aseguramos que tenemos UIView (responde al mensaje layer)
    if ([result respondsToSelector:@selector(layer)]) {
        // Obtenemos la capa de esta vista
        CALayer *layer = [result layer];
        layer.borderWidth = 2;
        layer.borderColor = [[UIColor redColor] CGColor];
    }
    
    // Devolvemos la UIView modificada
    return result;
}

+ (void)load
{
    // "+ load" se invoca cada vez que una clase o categoría es añadida al runtime
    // Se llama antes incluso que la función "main"
    MethodSwizzle(self, @selector(initWithCoder:), @selector(swizzled_initWithCoder:));
}

@end
