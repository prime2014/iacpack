package kubernetes.resources.io


#===================================================================================#
#                 A LIST OF KUBERNETES RESOURCES TO BE SAFEGUARDED                  #
#===================================================================================#
deployment if {
    input.kind == "Deployment"
}

statefulset if {
    input.kind == "Statefulset"
}

configmap if {
    input.kind == "ConfigMap"
}

ingress if {
    input.kind == "Ingress"
}

hpa if {
    input.kind == "HorizontalPodAutoscaler"
}





