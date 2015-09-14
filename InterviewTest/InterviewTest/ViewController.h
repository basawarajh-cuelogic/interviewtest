//
//  ViewController.h
//  InterviewTest
//
//  Created by cuelogic on 14/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgvw_Gallery;
@property (weak, nonatomic) IBOutlet UITableView *tbl_Images;

@end

