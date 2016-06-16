//
//  ISWebBrowserShareObject.h
//  CamCard
//
//  Created by Johnson Zhang on 15/4/29.
//
//

#import <Foundation/Foundation.h>
#import "ISWebBrowserShareCollectionViewCell.h"

@interface ISWebBrowserShareObject : NSObject

@property (nonatomic, assign) ISWebBrowserCellType type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;

- (instancetype) initWithType:(ISWebBrowserCellType) type;
- (instancetype) initWithType:(ISWebBrowserCellType) type target:(id) target action:(SEL) action;
- (instancetype) initWithType:(ISWebBrowserCellType) type title:(NSString *) title image:(UIImage *) image target:(id) target action:(SEL) action;

@end
