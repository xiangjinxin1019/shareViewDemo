//
//  ISWebBrowserShareObject.m
//  CamCard
//
//  Created by Johnson Zhang on 15/4/29.
//
//

#import "ISWebBrowserShareObject.h"

@implementation ISWebBrowserShareObject

- (instancetype) initWithType:(ISWebBrowserCellType) type
{
    return [self initWithType:type title:nil image:nil target:nil action:nil];
}

- (instancetype) initWithType:(ISWebBrowserCellType) type target:(id) target action:(SEL) action
{
    return [self initWithType:type title:nil image:nil target:target action:action];
}

- (instancetype) initWithType:(ISWebBrowserCellType) type title:(NSString *) title image:(UIImage *) image target:(id) target action:(SEL) action
{
    self = [super init];
    if (self)
    {
        _type = type;
        _title = title;
        _image = image;
        _target = target;
        _action = action;
    }
    
    return self;
}

@end
