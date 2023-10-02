

## OOA的概念

### 对象的概念

#### 筛选正确的对象 
筛选对象依据:
1.冗余: 对象的属性和行为不能有冗余
2.无关: 对象的属性和行为必须是相关的，不能有无关的属性和行为
3.笼统: 对象的属性和行为不能过于笼统
4.属性: 对象的属性必须是名词,
5.实现: 对象的行为必须是动词,并且是可实现的.

#### 确认关联
1.初步确认关联：ObjectA和ObjectB之间的关联是什么？是一对一？一对多？还是多对多？
2.需求陈述中隐含的关联: 从需求陈述中找出隐含的关联.
3.根据问题域中的关联: 从问题域中找出隐含的关联.

#### 筛选删除
1.与已删去的object有关的关联也要删除

example：删除了一个学生对象，那么与学生对象有关的成绩对象也要删除

2.与问题无关的关联也要删除或者在实现阶段考虑的关联也要删除

example：学生对象和成绩对象之间的关联在问题域中是不存在的，那么在OOA阶段就要删除

3.瞬时时间定义: 从一个对象到另一个对象的关联是瞬时的，那么在OOA阶段就要删除

example: 学生对象和成绩对象之间的关联是瞬时的，那么在OOA阶段就要删除

4.三元关联：分解成两个二元关联

example: 学生对象和成绩对象之间的关联是三元关联，那么在OOA阶段就要分解成两个二元关联

5.派生关联定义: 派生关联定义为一种特殊的关联，它是从一个对象派生出另一个对象的关联

example: 学生对象和成绩对象之间的关联是派生关联，那么在OOA阶段就要删除

#### 完善

1.正确命名: 对象的命名必须是名词，而且是单数形式

2.分解：对象的属性和行为必须是相关的，不能有无关的属性和行为

3.补充：发现遗漏的属性和行为及时补充

4标明阶数：在对象的属性和行为中标明阶数，阶数表示对象的属性和行为的重要性

#### 划分主题
1.主题的概念及其用途

2.主题的特点:
- 一个主题内部的对象类型是相同的
- 一个主题内部的对象之间的关联是相同的

3.



