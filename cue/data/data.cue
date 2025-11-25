package app

import my "my-platform.com/k8s-validation/schema"

ns: my.#KubernetesNamespace & {
	metadata: {
		name: "production"
	}
}

service: my.#KubernetesService & {
	metadata: {
		name:      "nginx"
		namespace: ns.metadata.name
	}
}

deployment: my.#KubernetesDeployment & {
	metadata: {
		name:      "nginx-deployment"
		namespace: ns.metadata.name
	}
	spec: {
		replicas: 3
		selector: matchLabels: {
			app: "nginx"
		}
		template: {
			metadata: labels: {
				app: "nginx"
			}
			spec: containers: [{
				name:  "nginx"
				image: "nginx:1.14.2"
				resources: {
					limits: {
						cpu:    "2"
						memory: "4Gi"
					}
				}
				ports: [{
					containerPort: 80
				}]
			}]
		}
	}
}
