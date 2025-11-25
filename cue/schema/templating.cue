package schema


#ServiceTemplate: {
    servicename:      string
    servicenamespace: string

    #KubernetesService & {
        metadata: {
		    name:      servicename
		    namespace: servicenamespace
	    }
    }
}

#NamespaceTemplate: {
    namespacename: string

    #KubernetesNamespace & {
        metadata: {
            name: namespacename
        }
    }
}