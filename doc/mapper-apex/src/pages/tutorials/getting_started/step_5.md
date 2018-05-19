---
title: "Mapper.DTO"
description: "Mapper.DTO"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 5
---

## {$page.title}

Mapper.DTO comes along with Mapper.apex to handle the nested map issue. Often when we manipulate maps nested in maps,
things get complicated, as we need to check null, create empty map and handle all these trivial logic.

In Mapper.apex, it is fairly easy.

```javascript
Mapper.DTO d = new Mapper.DTO();
d.setList('person.children', new List<Object>{});
Integer salary = d.getInteger('person.job.salary');
```

Internally Mapper.DTO maintains the nested map for us, and exposes handly APIs to access the data.
