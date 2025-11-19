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

---

## **Part 4: Deploy the WordPress Stacks**

### **Step 1: Install CDKTF Dependencies**
```sh
npm install
```

### **Step 2: Generate Terraform Configuration**
```sh
cdktf synth
```

### **Step 3: Deploy Both Stacks**
```sh
cdktf deploy StackOne StackTwo --auto-approve
```

---

## **Part 5: Verification**

### **1. Check Running Containers**
```sh
docker ps
```
You should see two WordPress containers and two MySQL containers running.

### **2. Access WordPress**
Open your browser and navigate to:
- **StackOne:** [http://localhost:8081](http://localhost:8081)
- **StackTwo:** [http://localhost:8082](http://localhost:8082)

### **3. Destroy the Deployment**
Once you're done, clean up the environment:
```sh
cdktf destroy StackOne StackTwo --auto-approve
```

---
