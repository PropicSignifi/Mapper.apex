/**
 * MIT License
 *
 * Copyright (c) 2018 Click to Cloud Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 **/
@isTest
private class MapperTest {
    @isTest
    private static void instanceTest() {
        Mapper.DTO d = new Mapper.DTO();
        System.assert(d.data != null);

        d = new Mapper.DTO(new Mapper.DTO());
        System.assert(d.data != null);
    }

    @isTest
    private static void mapConversionTest() {
        Map<String, Object> data = new Map<String, Object>{ 'name' => 'value' };
        Mapper.DTO d = new Mapper.DTO(data);
        Map<String, Object> newData = d.toMap();

        System.assertEquals(newData, data);
    }

    @isTest
    private static void sObjectConversionTest() {
        Account data = new Account(Description='desc');
        Mapper.DTO d = new Mapper.DTO(data);
        Account newData = (Account)d.toSObject(Account.class);

        System.assertEquals(newData, data);
    }

    @isTest
    private static void objectConversionTest() {
        TestObject data = new TestObject('name', 'value');
        Mapper.DTO d = new Mapper.DTO(data);
        TestObject newData = (TestObject)d.toObject(TestObject.class);

        System.assertEquals(newData, data);
    }

    @isTest
    private static void setAndgetObjectTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setObject('a.b.c', 'value');

        System.assert(d.getObject('a') != null);
        System.assert(d.getObject('b') == null);
        System.assert(d.getObject('a.b') != null);
        System.assert(d.getObject('a.c') == null);
        System.assertEquals('value', d.getObject('a.b.c'));
        System.assert(d.getObject('a.b.c.d') == null);
    }

    @isTest
    private static void setAndGetBooleanTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setBoolean('a.b.c', true);

        System.assertEquals(true, d.getBoolean('a.b.c'));
    }

    @isTest
    private static void setAndGetIntegerTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setInteger('a.b.c', 2);

        System.assertEquals(2, d.getInteger('a.b.c'));
    }

    @isTest
    private static void setAndGetLongTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setLong('a.b.c', 2);

        System.assertEquals(2, d.getLong('a.b.c'));
    }

    @isTest
    private static void setAndGetDoubleTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setDouble('a.b.c', 2);

        System.assertEquals(2, d.getDouble('a.b.c'));
    }

    @isTest
    private static void setAndGetDecimalTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setDecimal('a.b.c', 2);

        System.assertEquals(2, d.getDecimal('a.b.c'));
    }

    @isTest
    private static void setAndGetStringTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setString('a.b.c', 'test');

        System.assertEquals('test', d.getString('a.b.c'));
    }

    @isTest
    private static void setAndGetListTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setList('a.b.c', new List<String>{ 'test' });

        System.assertEquals(new List<String>{ 'test' }, d.getList('a.b.c'));
    }

    @isTest
    private static void setAndGetSetTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setSet('a.b.c', new Set<String>{ 'test' });

        System.assertEquals(new Set<String>{ 'test' }, d.getSet('a.b.c'));
    }

    @isTest
    private static void setAndGetMapTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setMap('a.b.c', new Map<String, Object>{ 'name' => 'value' });

        System.assertEquals(new Map<String, Object>{ 'name' => 'value' }, d.getMap('a.b.c'));
    }

    @isTest
    private static void setAndGetSObjectTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setSObject('a.b.c', new Account(Description='desc'));

        System.assertEquals(new Account(Description='desc'), d.getSObject('a.b.c'));
    }

    @isTest
    private static void setAndGetDateTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setDate('a.b.c', Date.newInstance(2018, 1, 1));

        System.assertEquals(Date.newInstance(2018, 1, 1), d.getDate('a.b.c'));
    }

    @isTest
    private static void setAndGetTimeTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setTime('a.b.c', Time.newInstance(10, 0, 0, 0));

        System.assertEquals(Time.newInstance(10, 0, 0, 0), d.getTime('a.b.c'));
    }

    @isTest
    private static void setAndGetDatetimeTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setDatetime('a.b.c', Datetime.newInstance(2018, 10, 1, 0, 0, 0));

        System.assertEquals(Datetime.newInstance(2018, 10, 1, 0, 0, 0), d.getDatetime('a.b.c'));
    }

    @isTest
    private static void setAndGetFuncTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setFunc('a.b.c', R.identity);

        System.assertEquals(R.identity, d.getFunc('a.b.c'));
    }

    @isTest
    private static void defaultMapperTest() {
        Mapper m = new Mapper();
        Mapper.DTO d = (Mapper.DTO)m.run(new Account());
        System.assert(d.keySet().isEmpty());
    }

    @isTest
    private static void containsPathTest() {
        Mapper.DTO d = new Mapper.DTO();
        d.setObject('a.b.c', 12);
        System.assertEquals(true, d.containsPath('a.b'));
        System.assertEquals(false, d.containsPath('a.d'));
    }

    @isTest
    private static void simpleMappingTest() {
        Map<String, Object> src = new Map<String, Object>{ 'name' => 'value' };
        Mapper m = new Mapper().mapField('key', 'name').toMap();
        System.assertEquals(new Map<String, Object>{ 'key' => 'value' }, m.run(src));
    }

    @isTest
    private static void ignoreNullMappingTest() {
        Map<String, Object> src = new Map<String, Object>{ 'name1' => 'value1', 'name2' => null };
        Mapper m = new Mapper(Mapper.IGNORE_NULLS)
            .mapField('key1', 'name1')
            .mapField('key2', 'name2')
            .mapField('key3', 'name3')
            .toMap();

        System.assertEquals(new Map<String, Object>{ 'key1' => 'value1', 'key2' => null }, m.run(src));
    }

    @isTest
    private static void conversionMappingTest() {
        Map<String, Object> src = new Map<String, Object>{ 'name' => 'value' };
        Mapper m = new Mapper().mapField('key', 'name', R.append.apply('$')).toMap();
        System.assertEquals(new Map<String, Object>{ 'key' => 'value$' }, m.run(src));
    }

    @isTest
    private static void multipleMappingTest() {
        Map<String, Object> src1 = new Map<String, Object>{ 'a' => 'c' };
        Map<String, Object> src2 = new Map<String, Object>{ 'b' => 'd' };
        Mapper m = new Mapper().inputAs('src1', 'src2').mapField('x', 'src1.a').mapField('y', 'src2.b').toMap();
        System.assertEquals(new Map<String, Object>{ 'x' => 'c', 'y' => 'd' }, m.run(src1, src2));
    }

    @isTest
    private static void nestedMappingTest() {
        Map<String, Object> src = new Map<String, Object>{ 'name' => 'value' };
        Mapper m = new Mapper().mapField('a.b', 'name');
        Mapper.DTO d = (Mapper.DTO)m.run(src);
        System.assertEquals('value', d.getString('a.b'));
    }

    @isTest
    private static void batchMappingTest() {
        Map<String, Object> src = new Map<String, Object>{
            'a' => 1,
            'b' => 2,
            'c' => 3
        };

        Mapper m = new Mapper().mapFields(new Map<String, Object>{
            'x' => new Mapper.FieldMapper('a', R.identity),
            'y' => 'b',
            'c' => R.inc
        }).toMap();

        System.assertEquals(new Map<String, Object>{
            'x' => 1,
            'y' => 2,
            'c' => (Decimal)4
        }, m.run(src));
    }

    @isTest
    private static void reverseToTest() {
        Map<String, Object> src = new Map<String, Object>{
            'a' => 1,
            'b' => 2
        };

        Mapper m = new Mapper()
            .mapField('x', 'a')
            .mapField('y', 'b')
            .toMap();

        Map<String, Object> dest = (Map<String, Object>)m.run(src);

        Mapper reversed = m.reverseToMap();
        Map<String, Object> src1 = (Map<String, Object>)reversed.run(dest);

        System.assertEquals(src, src1);
    }

    private class TestObject {
        public String name;
        public String value;

        public TestObject(String name, String value) {
            this.name = name;
            this.value = value;
        }

        public Integer hashCode() {
            return (name == null ? 0 : name.hashCode()) + (value == null ? 0 : value.hashCode());
        }

        public Boolean equals(Object other) {
            return other instanceof TestObject && ((TestObject)other).name == this.name &&
                ((TestObject)other).value == this.value;
        }
    }
}
