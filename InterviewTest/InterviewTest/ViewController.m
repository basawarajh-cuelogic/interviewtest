//
//  ViewController.m
//  InterviewTest
//
//  Created by cuelogic on 14/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import "ViewController.h"
#import "APIRequester.h"
#import "GalleryTableViewCell.h"

@interface ViewController ()
{
    APIRequester *apiRequesterObj;
   __block NSDictionary *imagesDict;
    NSInteger sectionIndex;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tbl_Images.delegate = self;
    _tbl_Images.dataSource = self;
    
    [self getImagesFromServer];
    
    sectionIndex = 0;
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
            /* */
            imagesDict=[NSJSONSerialization JSONObjectWithData:dataResponse options:NSJSONReadingAllowFragments error:nil];
            
            [_tbl_Images reloadData];
            
        }

    } withRequestSeriealizer:kRequestSerializerJson];
}

#pragma -  UITableViewDataSource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return imagesDict.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 25)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, headerView.frame.size.width, 25)];
    label.text = [[imagesDict allKeys][section] uppercaseString];
    label.textColor = [UIColor blackColor];
    headerView.backgroundColor = [UIColor lightGrayColor];
    [headerView addSubview:label];
    
    return headerView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"GalleryTableCell";
    
    GalleryTableViewCell *cell = [_tbl_Images dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell==nil) {
        cell = [[GalleryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.imagesForCell = [imagesDict objectForKey:[imagesDict allKeys][indexPath.section]];
    [cell.galleryCollectionView reloadData];
    

    
    return cell;
}


@end
