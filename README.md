# Coordinator

![Language](https://img.shields.io/badge/language-Swift%204.2-orange.svg)
![Supported platforms](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/giulio92/Coordinator/blob/master/LICENSE)

## Concepts
A `Coordinator` is an object that manages iOS applications navigation flow while keeping `UIViewController`s separate and independent.

By itself a `Coordinator` can only hold references to others `Coordinator`s and to his parent coordinator (if available), to gain navigation flow management it must be paired with a `UINavigationController` or `UITabBarController`.

Choose one of the two `protocol`s based on your navigation flow needs:
- `NavCoordinator`  
Holding a `UINavigationController`

- `TabCoordinator`  
Holding a `UITabBarController`

### What a `Coordinator` should do
- Present `Coordinator`s
- Push a `UIViewController`/`UINavigationController`/`UTabBarController` of another `Coordinator`
- Create `Couple`s object
- Be invisible to `UIViewController`s and only known by `ViewModel`s

### What a `Coordinator` should not do
- Perform anything other than navigation (i.e. network calls)

## Requirements
- Xcode 10.0+
- Swift 4.2+
- iOS 8.0+

## Credits
- [Soroush Khanlou](https://github.com/khanlou) (for his original `Coordinator` proposal)
  - [The Coordinator](http://khanlou.com/2015/01/the-coordinator/) (January 20, 2015)
  - [Coordinators Redux](http://khanlou.com/2015/10/coordinators-redux/) (October 05, 2015)
  - [Presenting Coordinators](https://vimeo.com/144116310) 📹 (October 30, 2015)
  - [Migrating To Coordinators](http://khanlou.com/2017/04/migrating-to-coordinators/) (April 25, 2017)
  - [Model Mutation In Coordinators](http://khanlou.com/2017/05/model-mutation-in-coordinators/) (May 02, 2017)
  - [Back Buttons and Coordinators](http://khanlou.com/2017/05/back-buttons-and-coordinators/) (May 08, 2017)
- [Martin Fowler](https://github.com/martinfowler) (for his original `Application Controller` concept)
  - [Application Controller](https://martinfowler.com/eaaCatalog/applicationController.html)
