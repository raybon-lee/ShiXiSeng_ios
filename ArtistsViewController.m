//
//  ArtistsViewController.m
//  YSLContainerViewControllerDemo
//
//  Created by yamaguchi on 2015/03/25.
//  Copyright (c) 2015年 h.yamaguchi. All rights reserved.
//

#import "ArtistsViewController.h"
#import "ArtistsCell.h"
#import "DetailViewController.h"

@interface ArtistsViewController ()

@property (nonatomic, strong) NSMutableArray *artistsArray;

@end

@implementation ArtistsViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"ArtistsViewController viewWillAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistsArray = [@[@"test1",
                       @"test2",
                       @"test3",
                       @"test4",
                       @"test5",
                       @"test6"
                       ] mutableCopy];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ArtistsCell" bundle:nil] forCellReuseIdentifier:@"ArtistsCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _artistsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ArtistsCell";
    ArtistsCell *cell = (ArtistsCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.artWorkImageView.image = [UIImage imageNamed:_artistsArray[indexPath.row]];
    cell.artisttNameLabel.text = [NSString stringWithFormat:@"好文推的内容 %ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailVC = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
