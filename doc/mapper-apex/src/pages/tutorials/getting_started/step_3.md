---
title: "Common Mapping"
description: "Common Mapping"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 3
---

## {$page.title}

We can do simple mappings like this:

```javascript
Account acc = ...;
Mapper m = new Mapper()
    .mapField('name', 'Name')
    .mapField('description', 'Description')
    .toObject(AccountDTO.class);
AccountDTO dto = (AccountDTO)m.run(acc);
// Create AccountDTO with fields 'name' and 'description'
```

This piece of code converts an SObject(Account) with 'Name' to a custom class AccountDTO with 'name'.

The value of 'Name' from Account is simply copied to 'name' in AccountDTO.

And we can easily reverse the mapping.

```javascript
Mapper reversed = m.reverseToSObject(Account.class);
Account acc = (Account)reversed.run(dto);
// Map the AccountDTO back to Account
```

The pair of mappers help us to convert between two objects.
