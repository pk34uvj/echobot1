python3 -m venv .venv

# Define the path to your virtual environment's activate file
# Adjust ".venv/bin/activate" if your venv has a different name or path
ACTIVATE_FILE=".venv/bin/activate"

# Check if the activate file exists
if [ ! -f "$ACTIVATE_FILE" ]; then
    echo "Error: Virtual environment activate file not found at $ACTIVATE_FILE"
    echo "Please make sure your virtual environment is created."
    exit 1
fi

# Prompt the user for the key value
printf "Enter the key value you want to export: "
read -r user_key

# Check if the user entered anything
if [ -z "$user_key" ]; then
    echo "Error: Key cannot be empty."
    exit 1
fi

# Define the variable name and export line
VAR_NAME="BOT_API_KEY"
EXPORT_LINE="export $VAR_NAME=\"$user_key\""

# Check if the export command already exists in the activate file
if grep -q "export $VAR_NAME=" "$ACTIVATE_FILE"; then
    echo "The variable '$VAR_NAME' already exists in $ACTIVATE_FILE. Skipping addition."
else
    # Append the export command to the end of the activate file
    echo "" >> "$ACTIVATE_FILE"
    echo "# Added automatically" >> "$ACTIVATE_FILE"
    echo "$EXPORT_LINE" >> "$ACTIVATE_FILE"
    echo "Successfully added export command to $ACTIVATE_FILE!"
fi

source $ACTIVATE_FILE
pip install -r ./requirements.txt