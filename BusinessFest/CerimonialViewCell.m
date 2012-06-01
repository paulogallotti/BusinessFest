//
//  CerimonialViewCell.m
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "CerimonialViewCell.h"

@implementation CerimonialViewCell

@synthesize titleLabel, infoLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    [titleLabel release];
    [infoLabel release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
