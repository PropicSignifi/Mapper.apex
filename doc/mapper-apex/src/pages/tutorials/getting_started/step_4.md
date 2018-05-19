---
title: "Conversions"
description: "Conversions"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 4
---

## {$page.title}

During the mapping, we can also transform the values.

```javascript
Mapper m = new Mapper()
    .mapField('name', 'Name', R.prepend.apply('Mr. '))
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(acc);
// Create a map containing 'name' with the value prepended with 'Mr. '
```

In this example, we transform the value of 'Name' by prepending 'Mr. ', and then set it to field 'name'.

We can go further than simply one field. Converting value from multiple fields is also supported.

```javascript
Mapper m = new Mapper()
    .mapField('desc', 'Name', 'Description', R.concat)
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(acc);
// Create a map containing 'desc' with the value of 'Name'
// and 'Description' values concatenated
```

Here we concatenate the values of 'Name' and 'Description' and then set it to the field 'desc'.

Besides, we can easily access values in nested fields.

```javascript
Mapper m = new Mapper()
    .mapField('person.name', 'Account.Name')
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(src);
// Create a map with nested maps, 'person => name' with the value
// of 'Account => Name' from the source map
```

We get the value from nested fields 'Account.Name' and then set it to a nested field 'person.name'.

The hidden power is that we can even convert multiple objects into one.

```javascript
Mapper m = new Mapper()
    .inputAs('src1', 'src2')
    .mapField('name', 'src1.Name')
    .mapField('desc', 'src2.Description')
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(src1, src2);
// Create a map containing 'name' and 'desc' with values
// from two source objects
```

In this example, we convert from `src1` and `src2` into `data`, by picking `Name` of `src1` and `Description` of `src2`.
