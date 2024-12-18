import csv
import sys


def read_csv(filename):
    data = []
    with open(filename, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            row_data = {key: int(value) if key != 'name' else value for key, value in row.items()}
            data.append(row_data)
    return data


def main():

    # Check for command-line usage
    if len(sys.argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        return

    csv_filename = sys.argv[1]
    dna_filename = sys.argv[2]

    # Read database file into a variable
    individuals = read_csv(csv_filename)

    # Read DNA sequence file into a variable
    with open(dna_filename, 'r') as file:
        dna_sequence = file.read().strip()

    str_sequences = list(individuals[0].keys())[1:]

    # Find longest match of each STR in DNA sequence
    dna_str_counts = {str_seq: longest_match(dna_sequence, str_seq) for str_seq in str_sequences}

    # Check database for matching profiles
    for individual in individuals:
        match = True
        for str_seq in str_sequences:
            if individual[str_seq] != dna_str_counts[str_seq]:
                match = False
                break
        if match:
            print(individual['name'])
            return

    print("No match")


def longest_match(sequence, subsequence):
    # Returns length of longest run of subsequence in sequence.
    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


if __name__ == "__main__":
    main()
