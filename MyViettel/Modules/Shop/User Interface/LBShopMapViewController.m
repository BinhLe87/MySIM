//
//  LBShopMapViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 11/12/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShopMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>


@implementation LBShopMapViewController


- (void)viewWillAppear:(BOOL)animated {
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[_shop.latitude floatValue]
                                                            longitude:[_shop.longitude floatValue]
                                                                 zoom:15];
    GMSMapView *mapView = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    mapView.myLocationEnabled = YES;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake([_shop.latitude floatValue], [_shop.longitude floatValue]);
    marker.title = _shop.name;
    marker.snippet = _shop.address;
    marker.map = mapView;
    
    [self.view addSubview:mapView];
}




@end
