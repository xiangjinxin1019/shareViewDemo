//
//  ViewController.m
//  ShareViewDemoe
//
//  Created by Nick Teng on 6/16/16.
//  Copyright © 2016 Nick Teng. All rights reserved.
//

#import "ViewController.h"
#import "ISWebBrowserShareView.h"
#import "ISWebBrowserShareObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    NSMutableArray *shareList = [NSMutableArray array];  // , ccTimeLineShareObject, ecard remove cctimeLine share object
    
    ISWebBrowserShareObject *wxSceneTimelineShareObject = [[ISWebBrowserShareObject alloc] initWithType:ISWebBrowserCellTypeWXSceneTimeline];
    [shareList addObject:wxSceneTimelineShareObject];

    ISWebBrowserShareObject *qqShareObject = [[ISWebBrowserShareObject alloc] initWithType:ISWebBrowserCellTypeQQ];
    [shareList addObject:qqShareObject];
    
    ISWebBrowserShareObject *emailShareObject = [[ISWebBrowserShareObject alloc] initWithType:ISWebBrowserCellTypeEmail];
    ISWebBrowserShareObject *copyURLObject = [[ISWebBrowserShareObject alloc] initWithType:ISWebBrowserCellTypeCopyUrl];
    [shareList addObjectsFromArray:@[emailShareObject, copyURLObject]];
    
    ISWebBrowserShareView *shareView = [[ISWebBrowserShareView alloc] initWithTitle:nil
                                                                  cancelButtonTitle:NSLocalizedString(@"i_wb_label_share_menu_cancel", @"Cancel") cancelBlock:NULL
                                                                          shareList:shareList
                                                                   shareButtonBlock:^(ISWebBrowserCellType type)
                                        {
                                            switch (type)
                                            {
                                                case ISWebBrowserCellTypeWXSceneTimeline :
//                                                    [self sendToWXSceneTimeline];
                                                    break;
                                                case ISWebBrowserCellTypeQQ :
//                                                    [self sendToQQ];
                                                    break;
                                                case ISWebBrowserCellTypeEmail :
//                                                    [self emailAction:nil];
                                                    break;
                                                case ISWebBrowserCellTypeCopyUrl :
//                                                    [self copyMyCardShareURL];
                                                    break;
                                                default :
                                                    break;
                                            }
                                        }
                                                                         actionList:shareList
                                                                  actionButtonBlock:nil];
    [self.view.window addSubview:shareView];
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, shareView);
    [shareView show];
}
@end
