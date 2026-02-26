# Flutter Sliver Commerce

A Daraz-style product listing application built with Flutter demonstrating single-scroll architecture, sliver-based layout, and gesture coordination.
This project focuses on scroll ownership and gesture correctness, not UI design.

# Features

 Collapsible header (banner + search area)
 Sticky TabBar after collapse
 Multiple product tabs
 Horizontal swipe + tap tab navigation
 Exactly ONE vertical scrollable
 Pull-to-refresh from any tab
 Scroll position preserved while switching tabs
 Login + User Profile screen
 Clean architecture separation

# Architecture Goal

This project solves a common complex mobile UI problem:

How to combine collapsing headers, sticky tabs, and tabbed lists without scroll conflicts.

# Architecture Overview
NestedScrollView
->SliverAppBar (Collapsible Header)
->SliverPersistentHeader (Sticky TabBar)
 ->TabBarView (Horizontal Navigation)
 ->ListView (Products)
 
Vertical Scroll Ownership
NestedScrollView owns the ONLY vertical scroll
Inner lists do not create independent scroll behavior.
This guarantees:

No scroll jitter
No gesture conflict
Stable UX

# Project Structure
# lib/

## main.dart
## core/
  -- network/
    dio_client.dart
  -- routes/   
    app_routes.dart
## data/
   -- models/
   -- repository/
      api_repository.dart
## modules/
  -- login/
     login_controller.dart
     login_screen.dart
 -- home/
      home_controller.dart
      home_screen.dart
 -- profile/
         profile_controller.dart
         profile_screen.dart
# API Used

Fake Store API: https://fakestoreapi.com/
-- Used for: Authentication, Products, User profile

# Run Instructions
- git clone https://github.com/yourname/flutter_sliver_commerce.git
- cd flutter_sliver_commerce
- flutter pub get
- flutter run
# Scroll & Gesture Design Explanation
1 Horizontal Swipe Implementation
Horizontal navigation is implemented using:
TabBarView internally uses a PageView. 
Responds only to horizontal gestures Does not interfere with vertical scrolling Allows swipe + tap navigation
Result:
 Predictable gesture behavior.
 
2 Vertical Scroll Ownership
Only one widget controls vertical scrolling.

3 Pull-to-Refresh Strategy RefreshIndicator wraps the NestedScrollView. Because all tabs share one scroll position Refresh works from any tab.

4 Sticky TabBar Behavior Implemented using: SliverPersistentHeader(pinned: true)

When the header collapses:TabBar remains visible Navigation always accessible

# Why Slivers?
Slivers allow:Partial layout rendering Scroll-aware UI Native collapsing behavior. This approach mirrors real production commerce apps like Daraz, Amazon, and Shopee.

# Evaluation Focus Addressed

- Single-scroll architecture
- Gesture coordination
- Sticky navigation
- Clean separation of responsibilities
- Explanation of engineering decisions

# Author
Giyas Uddin
Mobile Application Developer
Medical System Company Ltd. (Medisys)
