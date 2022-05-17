INSTALL_DIR="$(HOME)/.reposgit"
SCRIPTNAME="reposgit"

all:
	@echo "Please run 'make install'"

install:
	@mkdir -p $(INSTALL_DIR)
	@chmod u+x,g+x $(SCRIPTNAME).sh
	@cp $(SCRIPTNAME).sh $(INSTALL_DIR)
	@echo ""
	@echo "alias reposgit='$(INSTALL_DIR)/$(SCRIPTNAME).sh'" >> ~/.bashrc
	source ~/.bashrc 
	@echo "Reposgit has been installed successfully."
	@echo ""
	@echo 'USAGE:'
	@echo ""
	@echo '1 · Open the terminal in the directory where you want to create the repository.'
	@echo "2 · Write 'repostgit' to get started."
	@echo ""
	@echo 'COMMANDS:'
	@echo ""
	@echo 'reposgit    · Start program'
	@echo 'reposgit -h · Help command'
	@echo 'reposgit -r · Delete user settings'
	@echo ''

.PHONY: all install