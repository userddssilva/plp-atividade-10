import threading
import time

n = 100000
m = 10000


def process():
	for _ in range(m):
		time.sleep(0)


def main():
	for _ in range(n):
		t1 = threading.Thread(target=process)
		t1.start()


if __name__ == '__main__':
	main()