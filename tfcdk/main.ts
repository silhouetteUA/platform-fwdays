import { App, TerraformStack } from "cdktf";
import * as docker from "@cdktf/provider-docker";
import { Construct } from "constructs";

class WordPressStack extends TerraformStack {
  constructor(scope: Construct, id: string, port: number) {
    super(scope, id);

    new docker.provider.DockerProvider(this, "docker", {});

    const network = new docker.network.Network(this, "network", {
      name: `wordpress-network-${id}`,
    });

    const mysqlImage = new docker.image.Image(this, "mysql-image", {
      name: "mysql:9.5.0",
      keepLocally: false,
    });

    const wordpressImage = new docker.image.Image(this, "wordpress-image", {
      name: "wordpress:latest",
      keepLocally: false,
    });

    const mysqlContainer = new docker.container.Container(this, "mysql-container", {
      name: `mysql-${id}`,
      image: mysqlImage.name,
      networksAdvanced: [{ name: network.name }],
      env: [
        "MYSQL_ROOT_PASSWORD=rootpass",
        "MYSQL_DATABASE=wordpress",
        "MYSQL_USER=wpuser",
        "MYSQL_PASSWORD=wppass",
      ],
      ports: [{ internal: 3306, external: port + 1000 }],
    });

    new docker.container.Container(this, "wordpress-container", {
      name: `wordpress-${id}`,
      image: wordpressImage.name,
      networksAdvanced: [{ name: network.name }],
      env: [
        `WORDPRESS_DB_HOST=${mysqlContainer.name}`,
        "WORDPRESS_DB_USER=wpuser",
        "WORDPRESS_DB_PASSWORD=wppass",
        "WORDPRESS_DB_NAME=wordpress",
      ],
      ports: [{ internal: 80, external: port }],
      dependsOn: [mysqlContainer],
    });
  }
}


class MultiStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id);
    new WordPressStack(app, "StackOne", 8081);
    new WordPressStack(app, "StackTwo", 8082);
  }
}

const app = new App();
new MultiStack(app, "multi-stack");
app.synth();