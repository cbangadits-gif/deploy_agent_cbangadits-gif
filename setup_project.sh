#!/bin/bash

# Process Management - Signal Trap
cleanup() {
    echo "Script interrupted! Archiving project..."
    tar -czf attendance_tracker_${input}_archive.tar.gz attendance_tracker_$input
    rm -rf attendance_tracker_$input
    echo "Archive created and directory deleted."
    exit 1
}

trap cleanup SIGINT

# Get project name
echo "Enter the project name:"
read input

# Validate input is not empty
while [ -z "$input" ]; do
    echo "Error: Project name cannot be empty. Please try again:"
    read input
done

# Create directory structure
mkdir -p attendance_tracker_$input/Helpers
mkdir -p attendance_tracker_$input/reports

# Create the files
touch attendance_tracker_$input/attendance_checker.py
touch attendance_tracker_$input/Helpers/assets.csv
cat > attendance_tracker_$input/Helpers/config.json << 'EOF'
{
  "warning": 75,
  "failure": 50
}
EOF
touch attendance_tracker_$input/reports/reports.log

echo "Project structure created successfully!"

# Dynamic configuration
echo "Do you want to update attendance thresholds? (yes/no)"
read answer

if [ "$answer" == "yes" ]; then
    echo "Enter Warning threshold (default 75):"
    read warning
    while ! [[ "$warning" =~ ^[0-9]+$ ]]; do
        echo "Error: Please enter a valid number:"
        read warning
    done

    echo "Enter Failure threshold (default 50):"
    read failure
    while ! [[ "$failure" =~ ^[0-9]+$ ]]; do
        echo "Error: Please enter a valid number:"
        read failure
    done

    sed -i "s/\"warning\": 75/\"warning\": $warning/" attendance_tracker_$input/Helpers/config.json
    sed -i "s/\"failure\": 50/\"failure\": $failure/" attendance_tracker_$input/Helpers/config.json
    echo "Thresholds updated successfully!"
fi

# Environment Validation - Health Check
echo "Running health check..."
if command -v python3 &> /dev/null; then
    echo "Python3 is installed: $(python3 --version)"
else
    echo "WARNING: Python3 is not installed!"
fi

echo "Setup complete!"
