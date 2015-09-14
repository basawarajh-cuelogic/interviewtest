//
//  ViewController.m
//  InterviewTest
//
//  Created by cuelogic on 14/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import "ViewController.h"
#import "APIRequester.h"

@interface ViewController ()
{
    APIRequester *apiRequesterObj;
    NSDictionary *
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self getImagesFromServer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Get Gallery Images From Server
-(void)getImagesFromServer
{
    if (apiRequesterObj==nil) {
        apiRequesterObj = [[APIRequester alloc] init];
    }
    
    [apiRequesterObj startWithDelegate:nil withPostParameters:nil httpMethod:kTagHttpMethodGet withURL:@"" withTimeOutValue:10 withImageData:nil withCompletionBlock:^(id dataResponse) {
        if (dataResponse!=nil)
        {
            NSArray *arrResponseObj;
            /* */
            arrResponseObj=[NSJSONSerialization JSONObjectWithData:dataResponse options:NSJSONReadingAllowFragments error:nil];
            
        }

    } withRequestSeriealizer:kRequestSerializerJson];
}

#pragma -  UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ;
}


@end
