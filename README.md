# Coordinator

### Concepts

A `Coordinator` is an object that manages iOS applications navigation flow

**What a `Coordinator` should do**
- Present `Coordinator`s
- Push a `UIViewController`/`UINavigationController`/`UTabBarController` of another `Coordinator`
- Create `Couple`s object
- Be invisible to `UIViewController`s and only known by `ViewModel`s

**What a `Coordinator` should not do**
- Make network remote calls
- Be a `Delegate` for `ViewModel`s/`UIViewController`s

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
