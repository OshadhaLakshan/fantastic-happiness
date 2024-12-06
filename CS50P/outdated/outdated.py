mnths = {
    "January": "01",
    "February": "02",
    "March": "03",
    "April": "04",
    "May": "05",
    "June": "06",
    "July": "07",
    "August": "08",
    "September": "09",
    "October": "10",
    "November": "11",
    "December": "12"
}

def main():
    while True:
        try:
            date = input("Date: ").strip()
            formatted_date = format_date(date)
            if formatted_date:
                print(formatted_date)
                break
        except ValueError as e:
            print(e)
        except EOFError:
            break

def format_date(date):
    if "/" in date:
        month, day, year = date.split("/")
        month = month.zfill(2)
        day = day.zfill(2)
        if 1 <= int(month) <= 12 and 1 <= int(day) <= 31:
            return f"{year}-{month}-{day}"
        else:
            raise ValueError("Invalid date format. Please try again.")
    elif ", " in date:
        dayy, year = date.split(", ")
        mnth, day = dayy.split(" ")
        day = day.zfill(2)
        if mnth in mnths:
            month = mnths[mnth]
            if 1 <= int(month) <= 12 and 1 <= int(day) <= 31:
                return f"{year}-{month}-{day}"
            else:
                raise ValueError("Invalid date format. Please try again.")
        else:
            raise ValueError("Invalid month. Please try again.")
    else:
        raise ValueError("Invalid date format. Please try again.")

if __name__ == "__main__":
    main()
