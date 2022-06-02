#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

enum STATE { START, VALUE, END, ERROR };

typedef struct {
	char name[20];
	char surname[20];
	char sex[8];
	char position[20];
	unsigned int salary;
} info;

int main(int argc, char** argv) {

	FILE* f = fopen("data.csv", "r");

	char salary_tmp[8];
	info* array = (info*)malloc(sizeof(info));		

	enum STATE state = START;				
	char buffer[1024];									
	int string, i, j, param = 0, k = 0, n = 0;
	int column = 0;
	int count = 0;
	char key[20];

	if (f == NULL) {
		return 1;
	}

	//Парсинг файла
	while (!feof(f)) {		

		string = fread(buffer, 1, 1024, f);

		for (i = 0; i < string; i++) {

			if (state == ERROR)
				break;

			switch (state) {								
			case START:
				if (buffer[i] == '\"') {
					state = VALUE;
					break;
				}
				else {
					state = ERROR;
					break;
				}

			case VALUE:
				if (buffer[i] == '\"') {
					state = END;
					break;
				}

				switch (param) {
				case 0:
					array[n].name[k] = buffer[i];
					break;
				case 1:
					array[n].surname[k] = buffer[i];
					break;
				case 2:
					array[n].sex[k] = buffer[i];
					break;
				case 3:
					array[n].position[k] = buffer[i];
					break;
				case 4:
					salary_tmp[k] = buffer[i];
					break;
				}
				if (param == 4) {
					array[n].salary = atoi(salary_tmp);
				}
				k++;


				break;
			case END:
				if (buffer[i] == ',') {
					state = START;
					param++;
					k = 0;
					break;
				}
				else
					if (buffer[i] == '\n') {
						state = START;
						n++;
						array = (info*)realloc(array, (n + 1) * sizeof(info));
						param = 0;
						k = 0;
						memset(&array[n], 0, sizeof(info));
						memset(salary_tmp, 0, 8 * sizeof(char));
						break;
					}
					else {
						state = ERROR;
						break;
					}

			case ERROR:
				break;
			}
		}
	} //

	//Ввод категории и параметра
	printf("Enter the category of median salary. \n1 - name\n2 - surname\n3 - sex\n4 - position\nInput: ");
	while ((column < 1) || (column > 4))
		scanf("%d", &column);

	printf("Enter key of the category. \nFor example, if category is name then key might be John.\nInput: ");
	scanf("%s", key);

	//Функция обмена элементов массива
	#define swap(a,b) { info tmp = a; a = b; b = tmp; }

	//Инициализация ссылки на категорию и сдвига (используем адреса вместо индексов элемента)
	char *ptr = NULL;
	int offset = 68 + sizeof(int);

	switch (column) {
	case 1:
		ptr = array->name;
		break;
	case 2:
		ptr = array->surname;
		break;
	case 3: 
		ptr = array->sex;
		break;
	case 4: 
		ptr = array->position;
		break;
	}


	//Метод Вирта для нахождения медианы
	i = 0;
	while (strcmp((char*)(ptr + i * offset), key) != 0)
		i++;
	int l = i;

	i = n - 1;
	while (strcmp((char*)(ptr + i*offset), key) != 0)
		i--;
	int m = i;

	for (i = l; i <= m; i++) {
		if (strcmp((char*)(ptr + i * offset), key) == 0)
			count++;
	}

	int kt = ((count & 1) ? (count / 2) : ((count / 2) - 1));

	count = 0;

	for (i = 0; i < m; i++) {
		if (strcmp((char*)(ptr + i * offset), key) == 0) {
			count++;
			if (count - 1 == kt) {
				kt = i;
				break;
			}
		}

	}

	int lower, upper;

	while (l < m) {
		info tmp = array[kt];
		lower = l;
		upper = m;
		do {
			while (array[lower].salary < tmp.salary) {
				i = lower + 1;
				while (strcmp((char*)(ptr + i * offset), key) != 0)
					i++;
				lower = i;
			}
			while (tmp.salary < array[upper].salary) {
				i = upper - 1;
				while (strcmp((char*)(ptr + i * offset), key) != 0)
					i--;
				upper = i;
			}
			if (lower <= upper) {
				swap(array[lower], array[upper]);
				i = lower + 1;
				while (strcmp((char*)(ptr + i * offset), key) != 0)
					i++;
				lower = i;
				i = upper - 1;
				while (strcmp((char*)(ptr + i * offset), key) != 0)
					i--;
				upper = i;
			}
		} while (lower <= upper);

		if (upper < kt)
			l = lower;
		if (kt < lower)
			m = upper;
	}

	printf("Median salary of all %s is %d.", key, array[kt].salary);

	free(array);
	return 0;
}