---
title: "Methods"
description: "Methods of Mapper"
layout: "guide"
icon: "code-file"
weight: 2
---

###### {$page.description}

<article id="1">

## Methods Reference

Here is the full reference for Mapper.

</article>

<article id="2">

## Rename Input Objects

We use below methods to rename input objects, so that we can reference them in the Field Mapper Key expressions.

| Method | Description |
| ------ | ----------- |
| inputAs(List&lt;String&gt;) | Rename to the name list |
| inputAs(String, String) | Rename to the two names |
| inputAs(String, String, String) | Rename to the three names |

Example:

```javascript
new Mapper()
    .inputAs('src1', src2)
    .mapField('x', 'src1.x')
    .mapField('y', 'src2.y')
    .toMap();
```

If there is only one source object, we don't need to use `inputAs`.

</article>

<article id="3">

## Map Fields

We have various methods to add field mappings to the Mapper.

| Method | Description |
| ------ | ----------- |
| mapField(String, Mapper.FieldMapper) | Map the field using the field mapper |
| mapField(String, List&lt;String&gt;, Func) | Map the field using a list of keys and transformer |
| mapField(String, String, String, Func) | Map the field using two keys and a transformer |
| mapField(String, String, Func) | Map the field using one key and the transformer |
| mapField(String, Func) | Map the field using only the transformer, the field name unchanged |
| mapField(String, String) | Map the field using only the key, the field value unchanged |
| mapField(String) | Map the field using the same field name, the field value unchanged |
| mapFields(Map&lt;String, Object&gt;) | Map the fields using the field mappers |

Example:

```javascript
new Mapper()
    .mapFields(new Map<String, Object>{
        'x' => new Mapper.FieldMapper('a', R.identity),
        'y' => 'b',
        'c' => R.identity
    });
```

When using `mapFields`, the values in the field mapper map can be:

- FieldMapper, which will be used to map the field
- String, the Field Mapper key
- Func, the transformer to process the value

</article>

<article id="4">

## Reverse Mapper

For mappers that contain only one-to-one field mappers and do not have any names set from `inputAs`,
we can easily create their reverse mappers.

```javascript
Mapper reversed = m.reverseToMap();
```

Here we have a list of methods to specify the exact type of object the reversed mapper converts to.

| Method | Description |
| ------ | ----------- |
| reverseTo(String, Type) | Specify the type and objectType that the reversed mapper converts to |
| reverseTo(String) | Specify the type that the reversed mapper converts to |
| reverseToJSON() | Reversed mapper will convert to JSON string |
| reverseToMap() | Reversed mapper will convert to Map&lt;String, Object&gt; |
| reverseToObject(Type) | Reversed mapper will convert to Object with the given type |
| reverseToSObject(Type) | Reversed mapper will convert to SObject with the given type |
| reverseToDTO() | Reversed mapper will convert to Mapper.DTO |

</article>

<article id="5">

## Specify Convert To

We need to specify which type the mapper will convert the object to.

```javascript
new Mapper()
    .mapField('name', 'Name')
    .toObject(AccountDTO.class);
```

Here is a list of methods that we can use:

| Method | Description |
| ------ | ----------- |
| to(String, Type) | Convert to the type and objectType |
| to(String) | Convert to the type |
| toJSON() | Convert to JSON string |
| toMap() | Convert to Map&lt;String, Object&gt; |
| toDTO() | Convert to Mapper.DTO |
| toObject(Type) | Convert to Object with the given type |
| toSObject(Type) | Convert to SObject with the given type |

</article>
