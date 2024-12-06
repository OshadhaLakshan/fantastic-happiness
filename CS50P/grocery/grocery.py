import sys

insert = dict()

def main():
    while True:
        try:
            item = get_in()
            insert_in(item)
        except EOFError:
            for item in sorted(insert):
                print(f"{insert[item]} {item}")
            sys.exit()

def get_in():
    return input().strip().upper()

def insert_in(item):
    if item in insert:
        insert[item] += 1
    else:
        insert[item] = 1

if __name__ == "__main__":
    main()
