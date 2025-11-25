package app

import my "my-platform.com/k8s-validation/schema"

services_bulk: {
    one: my.#ServiceTemplate &  {
        servicename: "serviceone"
        servicenamespace:"nsserviceone"
    }
    two: my.#ServiceTemplate &  {
        servicename: "servicetwo"
        servicenamespace:"nsservicetwo"
    }
}

namespace_bulk: {
    ns1: my.#NamespaceTemplate & {
        namespacename: "nsbulk1"
    }
    ns2: my.#NamespaceTemplate & {
        namespacename: "nsbulk2"
    }
}