//
//  GalleryTableViewCell.m
//  InterviewTest
//
//  Created by cuelogic on 15/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import "GalleryTableViewCell.h"
#import "GalleryCollectionViewCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

#define BASE_URL @"http://192.168.10.104/"

@implementation GalleryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _galleryCollectionView.delegate = self;
    _galleryCollectionView.dataSource = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma - mark UICollectionViewDatasource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imagesForCell.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *collectionCellIdentifier = @"GalleryImageCell";
    GalleryCollectionViewCell *collectionCell = [_galleryCollectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifier forIndexPath:indexPath];
    
    
    NSString *imageURL =[NSString stringWithFormat:@"%@/%@",BASE_URL,[[_imagesForCell objectAtIndex:indexPath.row] objectForKey:@"imgURL"]];
    
    [collectionCell.galleryImageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil];
    
    
    return collectionCell;
}


@end
