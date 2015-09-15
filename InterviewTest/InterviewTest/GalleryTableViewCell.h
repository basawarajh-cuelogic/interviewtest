//
//  GalleryTableViewCell.h
//  InterviewTest
//
//  Created by cuelogic on 15/09/15.
//  Copyright (c) 2015 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *galleryCollectionView;
@property (strong, nonatomic) NSArray *imagesForCell;
@end
