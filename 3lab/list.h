#pragma once
#ifndef ___LIST___
#define ___LIST___

typedef struct {
	int value;
	struct list* next;
	struct list* prev;
} list;

list* add(int value, list* element);
list* search(int value, list* lst);
void delete(int value, list* lst);

#endif