---
title: "Preliminary Knowledge"
description: "Preliminary Knowledge"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 2
---

## {$page.title}

It's recommended that you have a fair amount of knowledge on [R.apex](https://github.com/Click-to-Cloud/R.apex), but it's not required.

Mapper.apex uses Func objects from R.apex, and a Func is actually a custom Apex object that mimics the behavior of a function.

Here is how your implement a custom Func.

```javascript
public class HelloWorldFunc extends Func {
    public HelloWorldFunc() {
        super(0); // specify the number of arguments the Func takes
    }

    // Provide custom implementation for a Func that takes 0 arguments.
    public override Object exec() {
        return 'Hello World';
    }
}
```

And then you instantiate, and invoke it.

```javascript
Func helloworld = new HelloWorldFunc();
String msg = (String)helloworld.run();
```

To get deeper with Func objects, please check [R.apex](https://github.com/Click-to-Cloud/R.apex).
