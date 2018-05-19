---
title: "Mapping"
description: "Mapping"
layout: "guide"
icon: "flash"
weight: 1
---

###### {$page.description}

<article id="1">

## Problem of Mapping

We often meet situations like this:

- Convert between SObjects and custom DTO objects
- Convert between Maps and SObjects
- Convert between JSON strings and custom objects
- Convert between custom objects

These are fairly common, and we all know how to handle them. Mapper.apex is here just to
make things easier and more straightforward.

</article>

<article id="2">

## What Mapper.apex can do?

Mapper.apex is designed to build a functional API to handle conversions between any of these objects:

- JSON string
- Map&lt;String, Object&gt;
- SObject
- Object
- Mapper.DTO

Fundamentally, a Mapper is a Func, so it naturally integrates well with [R.apex](https://github.com/Click-to-Cloud/R.apex/).

</article>

<article id="3">

## How Mapper.apex does this?

We notice that conversions between objects all focus on conversions between object fields. So the root of this
problem is to model object field conversions. Mapper.apex supports the following field conversions:

- Convert from one field of one object to another field of another object(Pattern A)
- Convert from multiple fields of one object to another field of another object(Pattern B)
- Convert from multiple fields of multiple objects to another field of another object(Pattern C)

And by iterating field conversions, object conversions are done.

</article>

<article id="4">

## Field Mapper

A Field Mapper is an object that converts one field of one object to another field of another object. Below is the key factors of a Field Mapper.

| Factor | Description |
| ------ | ----------- |
| Field Name | The name of the field that the FieldMapper will convert the value to |
| Keys | A list of keys, each of which specify one field of the source objects to convert from |
| Transformer | A Func that accepts the values from the keys of the source objects, and transform them into the value of the destination field |

```javascript
new Mapper()
    .mapField('name', new Mapper.FieldMapper(new List<String>{ 'Name' }, R.identity));
```

In the code above, we add one field mapper to the mapper. This field mapper will get the field value of 'Name' from the source object,
and use `R.identity` to process the value, and then set the final value to the fielf of `name` of the converted object.

</article>

<article id="5">

## Inputs and Outputs

A Mapper automatically accepts any of the 5 types below:

- JSON string
- Map&lt;String, Object&gt;
- SObject
- Object
- Mapper.DTO

However, we need to specify which type we want to convert to.

```javascript
new Mapper()
    .mapField('name', 'Name')
    .toMap();
```

This code creates a Mapper that will finally convert the object into a map.

</article>

<article id="6">

## Field Mapper Key

A Field Mapper Key is a path that specifies the exact field name of the object that we want to get the value from.

Field Mapper keys can be nested.

```javascript
new Mapper()
    mapField('name', 'Account.Name');
```

Here we have a `.` separated string that acts as the Field Mapper Key, which specifies the `Name` field of the object,
under the field `Account` of the source object.

</article>

<article id="7">

## Pattern A

Most of the time, we convert the fields on a one-to-one basis like this.

```javascript
Map<String, Object> src = new Map<String, Object>{
    'a' => 1,
    'b' => 2
};

Mapper m = new Mapper()
    .mapField('x', 'a')
    .mapField('y', 'b')
    .toMap();

Map<String, Object> dest = (Map<String, Object>)m.run(src);
```

`a: 1, b: 2` is converted to `x: 1, y: 2`. Each of the field is mapped to another
unique field.

</article>

<article id="8">

## Pattern B

Sometimes, we need more than one field to calculate the new field we want.

```javascript
Map<String, Object> src = new Map<String, Object>{
    'a' => 1,
    'b' => 2
};

Mapper m = new Mapper()
    .mapField('sum', 'a', 'b', R.add)
    .mapField('product', 'a', 'b', R.multiply)
    .toMap();

Map<String, Object> dest = (Map<String, Object>)m.run(src);
```

`a: 1, b: 2` is converted to `sum: 3, product: 2`. Both `a` and `b` fields are used to
calculate the new `sum` and `product` fields.

</article>

<article id="9">

## Pattern C

Very rarely, we would even use more than one objects to convert into one object.

```javascript
Map<String, Object> src1 = new Map<String, Object>{
    'a' => 1,
    'b' => 2
};

Map<String, Object> src2 = new Map<String, Object>{
    'a' => 3,
    'b' => 4
};

Mapper m = new Mapper()
    .inputAs('src1', 'src2')
    .mapField('sum', 'src1.a', 'src2.a', R.add)
    .mapField('product', 'src2.b', 'src2.b', R.multiply)
    .toMap();

Map<String, Object> dest = (Map<String, Object>)m.run(src1, src2);
```

The result is `sum: 4, product: 8`.

We use `inputAs` to rename the source objects so that we can reference them in the Field Mapper Key expressions, like `src1.a`.

Then we prefix the normal Field Mapper Key to get the value from the specific source objects.

</article>
