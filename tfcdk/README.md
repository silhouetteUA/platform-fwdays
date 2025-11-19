## **Part 1: Prerequisites**
# Step 1: Setup node

*Download and install Homebrew*   
```
curl -o- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
```

*Download and install Node.js:*   
```
brew install node@24
```

*Verify the Node.js version:*   
```
node -v
```
 
*Verify npm version:*   
```
npm -v
```


# Step 2: Setup Docker
# Step 3: Setup Terraform
# Step 4: Setup cdktf
```
npm install -g cdktf-cli
```

# Step 4: Check versions
```
terraform --version
cdktf --version
```

---

## **Part 2: Set Up the CDKTF Project**

### **Step 1: Initialize the Project**
```sh
mkdir cdktf-docker-wordpress && cd cdktf-docker-wordpress
cdktf init --template=typescript --local
```

### **Step 2: Install Required CDKTF Packages**
```sh
npm install @cdktf/provider-docker
```

---