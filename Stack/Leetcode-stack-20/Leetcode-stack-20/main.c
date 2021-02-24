//
//  main.c
//  Leetcode-stack-20
//
//  Created by 杜正妮 on 2021/2/25.
//

#include <stdio.h>
#include <stdbool.h>
#include <string.h>
bool isValid(char *s);
struct Node
{
    char c;
    struct Node *next;
};

struct Node start1 = {
    '\0',
    NULL
};
struct Node *start = &start1;
void push(struct Node *node)
{
   struct Node *head = start;
    while (head->next != NULL) {
        head = head->next;
    }
    head->next = node;
    node->next = NULL;
}

struct Node* pop()
{
    struct Node *head = start;
    while (head->next != NULL&&head->next->next != NULL) {
        head = head->next;
    }
    struct Node* ret = head->next;
    head->next = NULL;
    return ret;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    char *s="([])";
    bool isvalid = isValid(s);
    printf("%s%s\n",s,isvalid?"有效":"无效");
    return 0;
}

bool isValid(char *s)
{
    if (strlen(s)%2 == 1) {
        return false;
    }
    int i=0;
    do {
        if (s[i] == '(' || s[i] == '[' || s[i] == '{') {
            struct Node d = {s[i],NULL};
            push(&d);
        }else{
            struct Node *d = pop();
            if (d->c == ')' || d->c == '}' || d->c == ']') {
                
            }else{
                push(d);
            }
        }
        i++;
    } while (i<strlen(s));
    if (pop() == NULL) {
        return true;
    }
    return false;
}


