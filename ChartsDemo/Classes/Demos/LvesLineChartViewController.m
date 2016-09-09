//
//  LvesLineChartViewController.m
//  ChartsDemo
//
//  Created by LiXingLe on 16/5/27.
//  Copyright © 2016年 dcg. All rights reserved.
//

#import "LvesLineChartViewController.h"

@interface LvesLineChartViewController ()
@property (weak, nonatomic) IBOutlet LineChartView *lineChart;

@end

@implementation LvesLineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义折线图";
    
    ChartXAxis * xAxis =self.lineChart.xAxis;
    xAxis.labelPosition = ChartLimitLabelPositionLeftBottom;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.axisLineWidth = 0;
    [xAxis setLabelsToSkip:11];
    
    
    
    self.lineChart.leftAxis.axisLineWidth = 0;
    self.lineChart.rightAxis.enabled = NO;
    self.lineChart.drawGridBackgroundEnabled = NO;
    self.lineChart.doubleTapToZoomEnabled = NO;
    self.lineChart.backgroundColor = [UIColor grayColor];
    self.lineChart.doubleTapToZoomEnabled = false;  //双击缩放
    self.lineChart.legend.enabled = false;          //图例
    
    
    [self buildData];
    
    
}

-(void)buildData{
    int count =108;
    
    //X labels
    NSMutableArray *xValues = [NSMutableArray array];
    for (int index = 0; index < count ;index ++) {
        if (index%12 == 0) {
            [xValues addObject:[NSString stringWithFormat:@"%d",2007+index/12]];
        }else{
            [xValues addObject:[NSString stringWithFormat:@"%d/%d",2007+index/12,index%12]];
        }
    }
    
    //Line 1
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++)
    {
        double val = (double) (arc4random_uniform(20)) + 3;
        [yVals addObject:[[ChartDataEntry alloc] initWithValue:val xIndex:i]];
    }
    LineChartDataSet *set0 = [[LineChartDataSet alloc] initWithYVals:yVals label:@"折线图1"];
    set0.drawFilledEnabled = YES;
    set0.drawCirclesEnabled = YES;
    set0.circleRadius = 3.f;
    [set0 setColor:[UIColor orangeColor]];
    set0.fillColor = [UIColor orangeColor];
    set0.drawHorizontalHighlightIndicatorEnabled = NO;
    
    
    
    
    
    LineChartData *data = [[LineChartData alloc] initWithXVals:xValues dataSets:@[set0]];
    self.lineChart.data = data;
    

}



@end
