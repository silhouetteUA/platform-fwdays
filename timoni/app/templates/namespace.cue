package templates

import (
	corev1 "k8s.io/api/core/v1"
)

// #Namespace template compatible with your #Config
#Namespace: corev1.#Namespace & {
	#config: #Config

	apiVersion: "v1"
	kind:       "Namespace"

	metadata: {
		name: #config.metadata.namespace

		if #config.metadata.labels != _|_ {
			labels: #config.metadata.labels
		}

		if #config.metadata.annotations != _|_ {
			annotations: #config.metadata.annotations
		}
	}
}
