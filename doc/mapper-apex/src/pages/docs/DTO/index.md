---
title: "Mapper.DTO"
description: "Mapper.DTO"
layout: "guide"
icon: "cloud"
weight: 4
---

###### {$page.description}

<article id="1">

## Mapper.DTO Reference

Mapper.DTO is a wrapper object for nested maps.

```javascript
Mapper.DTO d = new Mapper.DTO();
d.setObject('a.b.c', 'test');
Boolean flag = d.getBoolean('task.terminated');
```

</article>

<article id="2">

## Constructors

Here are the constructors.

| Constructor | Description |
| ----------- | ----------- |
| DTO() | Constrcutor to create an empty DTO |
| DTO(DTO) | Constructor to create an instance from another DTO |
| DTO(String) | Constructor to create an instance from a JSON string |
| DTO(Map&lt;String, Object&gt;) | Constructor to create an instance from a Map&lt;String, Object&gt; |
| DTO(SObject) | Constructor to create an instance from an SObject |
| DTO(Object) | Constrcutor to create an instance from an Object |

```javascript
Mapper.DTO d = new MapperDTO();
```

</article>

<article id="3">

## Query

Here are the query APIs.

| Method | Description |
| ----------- | ----------- |
| keySet() | Get the keys of the DTO |
| containsPath(List&lt;String&gt;) | Check if the DTO has the path |
| containsPath(String) | Check if the DTO has the path |

</article>

<article id="4">

## Conversion

Here are the methods to convert DTO to other objects.

| Method | Description |
| ----------- | ----------- |
| toMap() | Convert to Map&lt;String, Object&gt; |
| toJSON() | Convert to JSON string |
| toObject(Type) | Convert to Object of the given type |
| toSObject(Type) | Convert to SObject of the given type |

```javascript
Mapper.DTO d = new MapperDTO();
Map<String, Object> m = d.toMap();
```

</article>

<article id="5">

## Accessors

Here are the getters/setters for DTOs.

| Method | Description |
| ----------- | ----------- |
| setObject(List&lt;String&gt;, Object) | Set the value at the path |
| setObject(String, Object) | Set the value at the path |
| getObject(List&lt;String&gt;) | Get the value at the path |
| getObject(String) | Get the value at the path |
| setBoolean(List&lt;String&gt;, Object) | Set the value at the path |
| setBoolean(String, Object) | Set the value at the path |
| getBoolean(List&lt;String&gt;) | Get the value at the path |
| getBoolean(String) | Get the value at the path |
| setInteger(List&lt;String&gt;, Object) | Set the value at the path |
| setInteger(String, Object) | Set the value at the path |
| getInteger(List&lt;String&gt;) | Get the value at the path |
| getInteger(String) | Get the value at the path |
| setLong(List&lt;String&gt;, Object) | Set the value at the path |
| setLong(String, Object) | Set the value at the path |
| getLong(List&lt;String&gt;) | Get the value at the path |
| getLong(String) | Get the value at the path |
| setDouble(List&lt;String&gt;, Object) | Set the value at the path |
| setDouble(String, Object) | Set the value at the path |
| getDouble(List&lt;String&gt;) | Get the value at the path |
| getDouble(String) | Get the value at the path |
| setDecimal(List&lt;String&gt;, Object) | Set the value at the path |
| setDecimal(String, Object) | Set the value at the path |
| getDecimal(List&lt;String&gt;) | Get the value at the path |
| getDecimal(String) | Get the value at the path |
| setString(List&lt;String&gt;, Object) | Set the value at the path |
| setString(String, Object) | Set the value at the path |
| getString(List&lt;String&gt;) | Get the value at the path |
| getString(String) | Get the value at the path |
| setList(List&lt;String&gt;, Object) | Set the value at the path |
| setList(String, Object) | Set the value at the path |
| getList(List&lt;String&gt;) | Get the value at the path |
| getList(String) | Get the value at the path |
| setSet(List&lt;String&gt;, Object) | Set the value at the path |
| setSet(String, Object) | Set the value at the path |
| getSet(List&lt;String&gt;) | Get the value at the path |
| getSet(String) | Get the value at the path |
| setMap(List&lt;String&gt;, Object) | Set the value at the path |
| setMap(String, Object) | Set the value at the path |
| getMap(List&lt;String&gt;) | Get the value at the path |
| getMap(String) | Get the value at the path |
| setSObject(List&lt;String&gt;, Object) | Set the value at the path |
| setSObject(String, Object) | Set the value at the path |
| getSObject(List&lt;String&gt;) | Get the value at the path |
| getSObject(String) | Get the value at the path |
| setDate(List&lt;String&gt;, Object) | Set the value at the path |
| setDate(String, Object) | Set the value at the path |
| getDate(List&lt;String&gt;) | Get the value at the path |
| getDate(String) | Get the value at the path |
| setTime(List&lt;String&gt;, Object) | Set the value at the path |
| setTime(String, Object) | Set the value at the path |
| getTime(List&lt;String&gt;) | Get the value at the path |
| getTime(String) | Get the value at the path |
| setDatetime(List&lt;String&gt;, Object) | Set the value at the path |
| setDatetime(String, Object) | Set the value at the path |
| getDatetime(List&lt;String&gt;) | Get the value at the path |
| getDatetime(String) | Get the value at the path |
| setFunc(List&lt;String&gt;, Object) | Set the value at the path |
| setFunc(String, Object) | Set the value at the path |
| getFunc(List&lt;String&gt;) | Get the value at the path |
| getFunc(String) | Get the value at the path |

```javascript
Mapper.DTO d = new MapperDTO();
d.setInteger('age', 30);
```

</article>
