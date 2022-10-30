# This will only install the dev kit for a single hyp session
alias "hyp=ruby ${PWD}/dev-kit/dev_kit.rb"

YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'
echo -e "${YELLOW}hyp installed for this session${NC}"

echo -e "\tTip: To install hyp permanently, add the following to your .bashrc/.zshrc"
echo -e "\t${CYAN}alias hyp='ruby ${PWD}/dev-kit/dev_kit.rb'${NC}"