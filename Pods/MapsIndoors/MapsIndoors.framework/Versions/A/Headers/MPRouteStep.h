//
//  MPRouteAction.h
//  Indoor
//
//  Created by Daniel Nielsen on 12/2/13.
//  Copyright (c) 2017 MapsPeople A/S. All rights reserved.
//

#define kSTRAIGHT_MANEUVER @"Straight"
#define kLEFT_UP_MANEUVER @"Left"
#define kLEFT_DOWN_MANEUVER @"LeftDown"
#define kLEFT_MANEUVER @"Left"
#define kRIGHT_UP_MANEUVER @"RightUp"
#define kRIGHT_DOWN_MANEUVER @"RightDown"
#define kRIGHT_MANEUVER @"Right"
#define kU_TURN_MANEUVER @"UTurn"
#define kDOWN_MANEUVER @"Down"
#define kUP_MANEUVER @"Up"
#define kSTART_MANEUVER @"Start"
#define kDESTINATION_MANEUVER @"Destination"

enum MPRouteActionType {
    STRAIGHT_COMPASS_HEADING_ACTION = 1,
    TURN_ACTION = 6,
    Z_LEVEL_ACTION = 3,
    DESTINATION_ACTION = 5,
    START_ACTION = 4
};


enum MPRouteActionDirection {
    LEFT_DIRECTION = 270,
    RIGHT_DIRECTION = 90,
    LEFT_SHARP_DIRECTION = 225,
    RIGHT_SHARP_DIRECTION = 135,
    LEFT_OBTUSE_DIRECTION = 315,
    RIGHT_OBTUSE_DIRECTION = 45,
    U_TURN_DIRECTION = 180,
    UP_DIRECTION = 1,
    DOWN_DIRECTION = 0
};

#import <JSONModel/JSONModel.h>
#import "MPPoint.h"
#import "MPRouteProperty.h"
#import "MPRouteCoordinate.h"
#import "MPEncodedPolyline.h"
#import "MPTransitDetails.h"

@protocol MPRouteCoordinate
@end
/**
 * Route step empty protocol specification.
 */
@protocol MPRouteStep
@end

@interface MPRouteStep : JSONModel

@property NSString<Optional>* travel_mode;
@property MPRouteCoordinate<Optional>* end_location;
@property MPRouteCoordinate<Optional>* start_location;
@property NSNumber<Optional>* distance;
@property NSNumber<Optional>* duration;
@property NSString<Optional>* maneuver;
@property MPEncodedPolyline<Optional>* polyline;
@property NSMutableArray<MPRouteCoordinate, Optional>* geometry;
@property NSString<Optional>* html_instructions;
@property NSString<Optional>* highway;
@property NSString<Optional>* routeContext;
@property NSMutableArray<MPRouteStep, Optional>* steps;
@property MPTransitDetails<Optional>* transit_details;

- (MPPoint*)getActionPoint;
- (NSNumber*)getStartFloorName;


@end
