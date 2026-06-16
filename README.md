# deploy_agent_cbangadits-gif

## How to run the script
bash setup_project.sh

## What it does
- Creates the attendance tracker project structure
- Configures attendance thresholds via sed
- Handles interruptions with SIGINT trap (archives and cleans up)
- Checks if Python3 is installed

## How to trigger the archive feature
- Run the script: bash setup_project.sh
- Press Ctrl+C during execution
- The script will automatically archive the project folder and delete the incomplete directory
## Author
cbangadits-gif
## Video Walkthrough
Part 1: https://www.loom.com/share/cd7dfbd73d8c42a29e2d74856ea9dc2b
Part 2: https://www.loom.com/share/e713a76d115246459bbac2b0b421820e