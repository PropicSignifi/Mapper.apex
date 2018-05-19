# Mapper.apex
Mapper.apex is a library to help converting one object to another.

## Why Mapper.apex?
The primary purpose of Mapper.apex is to ease the pain of converting between custom DTO objects and SObjects. Furthermore, Mapper.apex gives you more power when converting the objects, as well as a helpful Mapper.DTO object to easily manipulate nested Map objects.

## Dependencies
Mapper.apex has a dependency over [R.apex](https://github.com/Click-to-Cloud/R.apex/). Please include it before including Mapper.apex.

## Examples
### Simple Conversion
We can convert an Account to a custom AccountDTO like this:

```java
Account acc = ...;
Mapper m = new Mapper()
    .mapField('name', 'Name')
    .mapField('description', 'Description')
    .toObject(AccountDTO.class);
AccountDTO dto = (AccountDTO)m.run(acc);
// Create AccountDTO with fields 'name' and 'description'
```

### Reversed Conversion
We can easily convert the AccountDTO back to Account.

```java
Mapper reversed = m.reverseToSObject(Account.class);
Account acc = (Account)reversed.run(dto);
// Map the AccountDTO back to Account
```

### Value Conversion
We can transform the values when converting the objects.

```java
Mapper m = new Mapper()
    .mapField('name', 'Name', R.prepend.apply('Mr. '))
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(acc);
// Create a map containing 'name' with the value prepended with 'Mr. '
```

### Multiple Fields Conversion
We can transform the values from multiple fields when converting the objects.

```java
Mapper m = new Mapper()
    .mapField('desc', 'Name', 'Description', R.concat)
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(acc);
// Create a map containing 'desc' with the value of 'Name'
// and 'Description' values concatenated
```

### Nested Fields Conversion
We can transform the values of nested fields when converting the objects.

```java
Mapper m = new Mapper()
    .mapField('person.name', 'Account.Name')
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(src);
// Create a map with nested maps, 'person => name' with the value
// of 'Account => Name' from the source map
```

### Multiple Objects Conversion
We can transform the values from multiple objects when converting the objects.

```java
Mapper m = new Mapper()
    .inputAs('src1', 'src2')
    .mapField('name', 'src1.Name')
    .mapField('desc', 'src2.Description')
    .toMap();
Map<String, Object> data = (Map<String, Object>)m.run(src1, src2);
// Create a map containing 'name' and 'desc' with values
// from two source objects
```

### Mapper.DTO
We can use Mapper.DTO objects to manipulate nested maps.

```java
Mapper.DTO d = new Mapper.DTO();
d.setList('person.children', new List<Object>{});
Integer salary = d.getInteger('person.job.salary');
```
