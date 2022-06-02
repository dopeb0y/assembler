#include "list.h"
#include <stdlib.h>

int test() {
	list* lst = NULL;

	lst = add(1, lst);

	//Должен вернуть !NULL
	if (add(2, lst) == NULL)
		return 1;

	//Должен вернуть !NULL
	if (search(2, lst) == NULL)
		return 2;

	delete(2, lst);

	//Должен вернуть NULL
	if (search(2, lst) != NULL)
		return 3;

	return 0;
}

int main(int argc, char** argv) {
	int r = test();
	return r;
}