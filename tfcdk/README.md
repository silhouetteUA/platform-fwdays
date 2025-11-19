# Step 1: Setup node

*Download and install Homebrew*
curl -o- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

*Download and install Node.js:*
brew install node@24

*Verify the Node.js version:*
node -v # Should print "v24.11.1".

*Verify npm version:*
npm -v # Should print "11.6.2".

# Step 2: Setup Docker
# Step 3: Setup Terraform
# Step 4: Setup cdktf

npm install -g cdktf-cli 

# Step 4: Check versions
```
terraform --version
cdktf --version
```