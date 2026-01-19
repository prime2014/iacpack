package kubernetes.rules.io

import kubernetes.resources.io as k8s


#=============================================================================================================================#
#                                           POLICY FOR KUBERNETES DEPLOYMENTS                                                 #
#=============================================================================================================================#
deny contains msg if {
   k8s.deployment
   image := input.spec.containers[_].image
   not startswith(image, "ghcr.io/prime2014")
   msg :=sprintf("The image provided is not from an approved repository: %s", [image])
}



deny contains msg if {
    k8s.deployment
    priviledged := input.spec.containers.priviledged

}