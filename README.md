# Coordinator

![Language](https://img.shields.io/badge/language-Swift%204.2-orange.svg)
![Supported platforms](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

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
- Make network remote calls
- Be a `Delegate` for `ViewModel`s/`UIViewController`s

## Requirements
- Xcode 10.0+
- Swift 4.2+
- iOS 8.0+

## Credits
- [Soroush Khanlou](https://github.com/khanlou) (for his original `Coordinator` proposal)
  - [The Coordinator](http://khanlou.com/2015/01/the-coordinator/)
  - [Presenting Coordinators](https://vimeo.com/144116310) 📹
  - [Coordinators Redux](http://khanlou.com/2015/10/coordinators-redux/)
  - [Migrating To Coordinators](http://khanlou.com/2017/04/migrating-to-coordinators/)
  - [Model Mutation In Coordinators](http://khanlou.com/2017/05/model-mutation-in-coordinators/)
  - [Back Buttons and Coordinators](http://khanlou.com/2017/05/back-buttons-and-coordinators/)
- [Martin Fowler](https://github.com/martinfowler) (for his original `Application Controller` concept)
  - [Application Controller](https://martinfowler.com/eaaCatalog/applicationController.html)
