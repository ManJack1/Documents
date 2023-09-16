
#include <stdio.h>
#include <string.h>

struct Book {
    char title[50];
    char author[50];
    char subject[50];
    int book_id;
};  

void printBook(struct Book *book);

int main() {
    struct Book book1;
    struct Book book2;

    strcpy(book1.title, "C");
    strcpy(book1.author, "ManJack");
    strcpy(book1.subject, "programmer");
    book1.book_id = 1;

    strcpy(book2.title, "C++");
    strcpy(book2.author, "Alice");
    strcpy(book2.subject, "programming");
    book2.book_id = 2;

    printBook(&book1);
    printf("\n");  // Adding a newline between book outputs
    printBook(&book2);

    return 0;
}

void printBook(struct Book *book) {
    printf("Title: %s\n", book->title);
    printf("Author: %s\n", book->author);
    printf("Subject: %s\n", book->subject);
    printf("Book ID: %d\n", book->book_id);
}

