//
//  PcapCellTableViewCell.m
//  shadowBoxDemo
//
//  Created by Paul Capili on 2/14/21.
//

#import "PcapCell.h"

@interface PcapCell()

@property (strong, nonatomic) IBOutlet UILabel *sampleLabel;
@property (strong, nonatomic) IBOutlet UIView *cellView;

@end

@implementation PcapCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
// Still need to figure out on how to apply the configurations below
//    self.layer.cornerRadius = 2.0;
//    self.layer.shadowColor = [UIColor colorWithRed: 157.0 / 255.0 green:157.0 / 255.0 blue:157.0 / 255.0 alpha:0.8].CGColor;
//    self.layer.shadowOpacity = 0.8;
//    self.layer.shadowRadius = 5.0;
//    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);

   
    self.sampleLabel.text = @"Sample Text";
    self.sampleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
