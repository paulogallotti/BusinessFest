//
//  ProgramacaoCell.m
//  BusinessFest
//
//  Created by Paulo Gallotti Rodrigues on 5/31/12.
//  Copyright (c) 2012 Vogall. All rights reserved.
//

#import "ProgramacaoCell.h"

@implementation ProgramacaoCell

@synthesize timeLabel, eventLabel;

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
    [timeLabel release];
    [eventLabel release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
