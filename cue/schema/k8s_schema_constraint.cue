package schema

#ImageTag: =~"^[^:]+:[a-zA-Z0-9._-]+$"

#NamingConvention: =~"^[a-z0-9-]+$"

#ResourceLimits: {
	cpu?:    string
	memory?: string
}

#ResourceRequests: {
	cpu?:    string
	memory?: string
}

#KubernetesNamespace: {
	apiVersion: "v1"
	kind:       "Namespace"
	metadata:
		name: string & #NamingConvention
	labels: {
		"app.kubernetes.io/name": metadata.name
	}
}

#KubernetesService: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      string & #NamingConvention
		namespace: string & #NamingConvention
		labels: {
			"app": metadata.name
		}
	}
	spec: {
		type: *"ClusterIP" | "NodePort" | "LoadBalancer" | "ExternalName"
		ports: [{
			port:       *80 | int
			targetPort: *80 | int
			protocol:   "TCP"
			name:       "http"
		}]
		selector: {
			"app": metadata.name
		}
	}
}

#KubernetesDeployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      string & #NamingConvention
		namespace: string & #NamingConvention | *"default"
	}
	spec: {
		replicas: int & >=1 & <=10
		selector: matchLabels: {
			app: string & #NamingConvention
		}
		template: {
			metadata: labels: {
				app: string & #NamingConvention
			}
			spec: containers: [...{
				name:  string & #NamingConvention
				image: string & #ImageTag & !~":latest$"
				resources?: {
					limits?:   #ResourceLimits
					requests?: #ResourceRequests
				}
				ports?: [...{
					containerPort: int & >=1 & <=65535
				}]
			}]
		}
	}
}
