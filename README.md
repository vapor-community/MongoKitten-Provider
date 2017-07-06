# MongoKitten-Provider

![Swift](http://img.shields.io/badge/swift-3.0-brightgreen.svg)
[![CircleCI](https://circleci.com/gh/vapor-community/mongokitten-provider.svg?style=shield)](https://circleci.com/gh/vapor-community/mongokitten-provider)

![OpenKitten](http://openkitten.org/background-openkitten.svg)

## Requirements

- A MongoDB server (local or online) running MongoDB 2.6 or above. (MongoDB 3.2 or 3.4 is recommmended)
- Swift 3.1 or greater

Linux requries the `libssl-dev` library to be installed.

## Setting up MongoDB

Install MongoDB for [Ubuntu](https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/), [macOS](https://docs.mongodb.com/master/tutorial/install-mongodb-on-os-x/) or [any other supported Linux Distro](https://docs.mongodb.com/master/administration/install-on-linux/).

Alternatively; make use of a DAAS (Database-as-a-service) like [Atlas](https://cloud.mongodb.com), [MLab](https://mlab.com), [Bluemix](https://www.ibm.com/cloud-computing/bluemix/mongodb-hosting) or any other of the many services.

## Importing

Add this to your dependencies:

`.Package(url: "https://github.com/vapor-community/MongoKitten-Provider.git", majorVersion: 0, minor: 1)`

And `import MongoKittenProvider` in your project.

After that you can add the `MongoKittenProvider.Provider` to your list of providers.

`try config.addProvider(MongoKittenProvider.Provider.self)`

Your `mongo.json` can stay the same with MongoKitten provider.

```json
{
    "url": "mongodb://localhost/my-database"
}
```

If you need the MongoDB database object:

`try drop.assertMongoDB()` will get it.

## Learn

[Many articles on medium are listed here](https://www.reddit.com/r/swift/comments/65bvre/a_rapidly_growing_list_of_mongokittenswift_guides/) [and here](http://beta.openkitten.org).

[We host the MongoKitten documentation including dash docset here](http://mongokitten.openkitten.org/).
