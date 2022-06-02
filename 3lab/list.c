#define _CRT_SECURE_NO_WARNINGS
#include "list.h"
#include <stdio.h>
#include <stdlib.h>

list* add(int value, list* element) {
	if (element != NULL) {
		list* new = (list*)malloc(sizeof(list));
		if (new == NULL)
			return NULL;

		if (element->value == NULL) {
			element->value = value;
			element->next = NULL;
			element->prev = NULL;
			return element;
		}

		while (element->next != NULL)
			element = element->next;
		element->next = new;
		new->value = value;
		new->next = NULL;
		new->prev = element;

		return new;
	}
	else {
		list* new = (list*)malloc(sizeof(list));
		if (new == NULL)
			return NULL;

		new->value = value;
		new->next = NULL;
		new->prev = NULL;
		return new;
	}
}

list* search(int value, list* lst) {
	if (lst == NULL) {
		fprintf(stderr, "Error: this list is empty or doesn't exist\n");
		return NULL;
	}
	else {
		list* cur = lst;
		while (cur != NULL) {
			if (cur->value == value) 
				return cur;
			else {
				cur = cur->next;
			}
		}
		fprintf(stderr, "Element %d wasn't found", value);
		return NULL;
		}
}

void delete(int value, list* lst) {
	if (lst == NULL) {
		fprintf(stderr, "Error: this list is empty or doesn't exist\n");
		return NULL;
	}
	else {
		list* cur = search(value, lst);
		if (cur != NULL) {
			list* before = cur->prev;;
			list* after = cur->next;
			if (before != NULL) 
				before->next = cur->next;
			else
				after->prev = NULL;
			if (after != NULL)
				after->prev = cur->prev;
			else
				before->next = NULL;
			free(cur);
			return;
		}
		fprintf(stderr, "Element %d wasn't found", value);
		return;
	}
}