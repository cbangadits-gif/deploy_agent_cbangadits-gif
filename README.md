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
