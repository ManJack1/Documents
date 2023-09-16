## 题目一：有序表的插入

设顺序表中的数据元素是按值非递减有序排列的，试编写一算法，将x插入到顺序表的适当位置上，以保持顺序表的有序性。

### 函数接口定义：

```c
void ListInsertSort(SqList *L, DataType x);
```

其中 `L` 和 `x` 都是用户传入的参数。 `L` 表示顺序表， `x` 是要插入的元素。

### 裁判测试程序样例：

```c
#include"stdio.h" 
#define LISTSIZE 100
typedef int DataType;
typedef struct{    
    DataType items[LISTSIZE];    
    int length;
}SqList;

/* 本题要求函数 */
void ListInsertSort(SqList *L, DataType x);

int InitList(SqList *L)
{/*L为指向顺序表的指针*/
    L->length=0;
    return 1;
}

int ListLength(SqList L)
{/*L为顺序表*/
    return L.length;
}

int ListInsert(SqList *L,int pos,DataType item)
{/*L为指向顺序表的指针,pos为插入位置,item为待插入的数据元素*/
    int i;
    if(L->length>=LISTSIZE){
        printf("顺序表已满，无法进行插入操作！");return 0;}
    if(pos<=0 || pos>L->length+1){
        printf("插入位置不合法，其取值范围应该是[1,length+1]");
        return 0;    }
    for(i=L->length-1; i>=pos-1; i--)    /*移动数据元素*/ 
        L->items[i+1]=L->items[i];
    L->items[pos-1]=item;        /*插入*/
    L->length++;            /*表长增一*/
    return 1; } 

int TraverseList(SqList L)
{/*L为顺序表*/
    int i;
    for(i=0;i<L.length;i++) printf("%d ",L.items[i]);
    printf("\n");
    return 1;
} 

void main()
{
  int i,input,x;
  SqList L1;           //定义顺序表
  InitList(&L1);       //初始化建空表
  for(i=0;;i++)
  {
       scanf("%d",&input);
       if(input==-1)break;
       ListInsert(&L1, i+1, input);   //插入数据
   }
  scanf("%d",&x);
  ListInsertSort(&L1, x);        // 本题要求函数在主函数中的调用
 TraverseList(L1);                //遍历

}

/* 请在这里填写答案 */
```

### 输入样例：

在这里给出一组输入。例如：

```in
1 3 6 7 8 9 -1
3
```

### 输出样例：

在这里给出相应的输出。例如：

```out
1 3 3 6 7 8 9 
```

## 题目2 查找并打印顺序表中的最大值及其下标【有题解视频】

**6-2 查找并打印顺序表中的最大值及其下标【有题解视频】**

分数 8

全屏浏览题目切换布局

作者 CUIT通信DS课程组

单位 成都信息工程大学

本题要求实现一个函数，可查找并打印某顺序表中的最大值及其下标。例如顺序表3，-5，0，9，-4中，最大值为9，在该函数中打印9，并换行打印其下标3。该函数无返回值。

### 函数接口定义：

```c
在这里描述函数接口。例如：
void print_max_value_pos(Sqlist *L);
```

在这里解释接口参数。例如：其中 `L` 是用户传入的参数。 `L` 为指向顺序表的指针；函数无返回。

### 裁判测试程序样例：

```c
#include <stdio.h>

typedef int Datatype;                        // 定义具体数据类型
    
#define LISTSIZE 100                        // LISTSIZE 表示顺序表可能的最大数据元素数目

/****** 顺序表存储结构 ******/
typedef struct
{
    Datatype items[LISTSIZE];
    int length;
}Sqlist;

/****** 初始化顺序表 ******/
int Initlist(Sqlist *L)                // L为指向顺序表的指针
{
    L->length = 0;            
    return 1;
}

/****** 输入5个整数到顺序表 ******/
void input(Sqlist *L)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        scanf("%d", &L->items[i]);
        L->length++;
    }
}

/****** 查找最大值，打印最大值及其下标******/
void print_max_value_pos(Sqlist *L);

int main()
{
    Sqlist list;                        // 顺序表
    Initlist (&list);                    // 初始化顺序表
    input(&list);
    print_max_value_pos(&list);
}

/* 请在这里填写答案 */
```

### 输入样例：

在这里给出一组输入。例如：

```in
3 -5 0 9 -4
```

### 输出样例：

在这里给出相应的输出。例如：

```out
9
3
```

## 题目3:拼接两个顺序表【有题解视频】

**6-3 拼接两个顺序表【有题解视频】**

分数 10

全屏浏览题目切换布局

作者 CUIT通信DS课程组

单位 成都信息工程大学

A、B两个顺序表，实现算法ListJoin() ，将B表中的元素直接存入A表的后面，并将A中数据元素依次打印出来的功能。

### 函数接口定义：

```c
在这里描述函数接口。例如：
void ListJoin(List A,List B);
```

其中 `A` 和 `B` 都是用户传入的参数，即两个待合并的顺序表，其中B拼接在A之后。

### 裁判测试程序样例：

```c
#include <stdio.h>
typedef  int ElemType;
#define  NumSize   100

typedef struct 
{
    ElemType dat[NumSize]; //顺序表定义
    int      num;          //表中数据的多少
} List;


void initList(List *L) //初始化顺序表
{
    L->num=0;
}

int LengthList(List L) //求顺序表的长度
{
    return(L.num);
}
//在顺序表中的第n个位置后面插入一个数据
int InsertList(List *L,int n,ElemType x)
{
    int i,j;
    j=L->num;//求表中数据元素的个数
    if(j<n)
    {
        printf("插入位置不合法\n");
        return 0;//插入失败返回0
    }    
    if(n>=NumSize)
    { 
        printf("插入位置不合法\n");
        return 0;
    }    
    for(i=j; i>n;i--)
    {
        L->dat[i] =L->dat[i-1]; //将第n个后的元素依次后移一位 
    }    
    L->dat[i] = x; //插入数据x
    L->num ++;//顺序表总长度加1
    return (1); //插入成功败返回1
}
int DispList(List L)//遍历顺序表中元素
{
    int i,j;
    j=LengthList(L);//求表中数据元素的个数
    printf("表中元素是：");
    for(i=0;i<j;i++) 
    {
        printf("%d ",L.dat[i]); //显示表中元素
    }    
    return 0;
}

int main(void){
    List A,B;
    int i,j;
    ElemType x;

    initList(&A);
    initList(&B);            
    // 输入A表数据
    i = 0;
    while(1)
    {
        scanf("%d",&x);
        if (x == -1) break;            
        InsertList(&A,i,x);
        ++i;        
    }
    
    // 输入B表数据
    i = 0;
    while (1)
    {
        scanf("%d",&x);
        if (x == -1) break;
        InsertList(&B, i, x);
        ++i;        
    }
 ListJoin(A,B);
    return 0;
}
/* 请在这里填写答案 */
```

### 输入样例：

在这里给出一组输入。例如：

```in
2 3 1 7 9 -1
1 7 0 -1
```

### 输出样例：

在这里给出相应的输出。例如：

```out
表中元素是：2 3 1 7 9 1 7 0 
```

## 题目4:用头插法创建单链表

**6-4 用头插法创建单链表**

分数 7

全屏浏览题目切换布局

作者 朱晓龙

单位 西安邮电大学

Creat_LinkList()函数是使用头插法建立一个带头节点的单链表。函数须返回单链表的头指针，空链表须返回NULL。

### 函数接口定义：

```c++
LinkList Creat_LinkList();
```

LinkList是函数返回的头指针类型。

### 裁判测试程序样例：

```c++
#define FLAG  -1
#include <stdio.h>
#include <malloc.h>
typedef int datatype;
typedef struct node
{
    datatype data;
    struct node *next;
}LNode, *LinkList;

LinkList Creat_LinkList();


void Print_LinkList(LinkList L);/*这里忽略函数实现部分  */


int main()
{
    LinkList L;
        

    L = Creat_LinkList();
    if(L == NULL)
    { 
        printf("L=NULL,error!"); 
        return 0;  
    }

    Print_LinkList( L );

    return 0;
}
/* 请在这里填写答案 */
```

### 输入样例：

在这里给出一组输入。例如：

```in
1 2 3 4 5 -1
```

### 输出样例：

在这里给出相应的输出。例如：

```out
     5     4     3     2     1
```

## 题目5:单链表统计奇数个数

**6-5 单链表统计奇数个数**

分数 7

全屏浏览题目切换布局

作者 DS课程组

单位 临沂大学

本题要求实现一个函数，返回带头结点的单链表中奇数的个数。

### 函数接口定义：

```c++
int OddNumber(LinkList L);
```

L是带头结点的单链表的头指针，函数OddNumber返回L中奇数的个数。如果单链表为空，返回0。

其中LinkList结构定义如下：

```c++
typedef struct LNode
{
    ElemType data;
    struct LNode *next;
}LNode,*LinkList;
```

### 裁判测试程序样例：

```c++
#include <stdio.h>
#include <stdlib.h>

typedef int ElemType;
typedef struct LNode
{
    ElemType data;
    struct LNode *next;
}LNode, *LinkList;

LinkList Create();/* 细节在此不表 */

int OddNumber(LinkList L);
int main()
{
    LinkList L, p;
    L = Create();
    printf("Odd number is %d.\n", OddNumber(L));
    return 0;
}
/* 你的代码将被嵌在这里 */
```

### 输入格式：

输入数据为1行，给出以-1结束的单链表元素（-1不属于单链表元素），所有数据之间用空格分隔。

### 输入样例：

```in
6 -3 4 -5 3 -1
```

### 输出样例：

```out
Odd number is 3.
```

## 题目6:单链表中数据逆置

**6-6 单链表中数据逆置**

分数 6

全屏浏览题目切换布局

作者 朱晓龙

单位 西安邮电大学

已知单链表H,写一个算法将其逆置。如单链表数据为1 2 3 4 5 6 7 8 9 10，逆置后的数据为：10 9 8 7 6 5 4 3 2 1。

### 函数接口定义：

```c++
void reverse(LinkList H);
```

`H` 是用户传入的参数，单链表的头指针。 LinkList的说明如下所示：

```
typedef int datatype;
typedef struct node
{
    datatype data;
    struct node *next;
}LNode, *LinkList;
```

### 裁判测试程序样例：

```c++
#include <stdio.h>
#include <malloc.h>
#define FLAG  -1
typedef int datatype;
typedef struct node
{
    datatype data;
    struct node *next;
}LNode, *LinkList;

void reverse(LinkList H);

LinkList Creat_LinkList();/*这里忽略函数实现细节*/


void Print_LinkList(LinkList L);/*这里忽略函数实现细节*/


int main()
{

     LinkList L;
    L = Creat_LinkList();
    reverse( L );
    Print_LinkList( L );
    
  return 0;

}

/* 你的答案将被嵌到这里 */
void reverse(LinkList H)
{
    ......
}
```

### 输入样例：

在这里给出一组头插法建立单链表的输入。例如：

```in
1 2 3 4 5 6 7 8 9 10 -1
```

### 输出样例：

在这里给出相应的输出。例如：

```out
     1     2     3     4     5     6     7     8     9    10
```