#!/bin/zsh

# Define the directory to scan and the markdown file to write to.
DIRECTORY_TO_SCAN="../DSKit/Sources/DSKit/Views"  # Update this path to your specific directory
OUTPUT_MARKDOWN_FILE="../Content/Views.md"

# Empty the markdown file if it exists, or create it if it doesn't
: > $OUTPUT_MARKDOWN_FILE

# Find all Swift files in the specified directory and subdirectories
files=($(find $DIRECTORY_TO_SCAN -type f -name "*.swift"))

# Custom sort function to sort specific files first and then the rest alphabetically
priority_files=(DSVStack.swift DSHStack.swift DSGrid.swift DSButton.swift DSText.swift DSHScroll.swift DSCoverFlow.swift DSImageView.swift)
sorted_files=()

# Adding priority files first in the specified order
for file in "${priority_files[@]}"; do
    for f in "${files[@]}"; do
        if [[ "$(basename $f)" == "$file" ]]; then
            sorted_files+=("$f")
        fi
    done
done

# Adding the rest of the files sorted alphabetically
for f in "${files[@]}"; do
    if [[ ! " ${sorted_files[@]} " =~ " ${f} " ]]; then
        sorted_files+=("$f")
    fi
done


# Process each file
for file in "${sorted_files[@]}"; do
    output_file="$OUTPUT_MARKDOWN_FILE"
    filename=$(basename "$file" .swift)

    # Extracting multiline comments, excluding the delimiters /* and */
    awk "/\/\*/,/\*\/$/ {
        if (!/\/\*/ && !/\*\/$/) print
    }" "$file" >> "$output_file"
    echo "#### Code example:" >> "$output_file"
    echo "Here is how you might set up it within your views:" >> "$output_file"
    echo "\`\`\`swift" >> "$output_file"

    # Extracting struct definitions
    awk "/struct Testable_.*: View \{/,/^\}$/ { print }" "$file" >> "$output_file"
    echo "\`\`\`" >> "$output_file"

    # Adding an image preview using the filename
    echo "Code example result:\n" >> "$output_file"
    echo "<table><tr><td><img src=\"../DSKitTests/__Snapshots__/DSKitTests/${filename}.1.png\" width=\"35%\"/></td></tr><table/>" >> "$output_file"
    echo "\n" >> "$output_file"  # Add another separator for readability
done


echo "Extraction complete. Content written to $OUTPUT_MARKDOWN_FILE"
