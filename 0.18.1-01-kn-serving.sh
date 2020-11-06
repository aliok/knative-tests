#!/usr/bin/env bash

# taken from
# https://github.com/matzew/kn-box/blob/7cce62a8ffe28ca6e1ec770bc5a45667fe42f783/01-kn-serving.sh

set -e

# Turn colors in this script off by setting the NO_COLOR variable in your
# environment to any value:
#
# $ NO_COLOR=1 test.sh
NO_COLOR=${NO_COLOR:-""}
if [ -z "$NO_COLOR" ]; then
  header=$'\e[1;33m'
  reset=$'\e[0m'
else
  header=''
  reset=''
fi

serving_version="v0.18.1"
kourier_version="v0.18.0"

function header_text {
  echo "$header$*$reset"
}

header_text "Using Knative Serving Version:          ${serving_version}"
header_text "Using Kourier Version:                  ${kourier_version}"

header_text "Setting up Knative Serving"

 n=0
   until [ $n -ge 2 ]
   do
      kubectl apply --filename https://github.com/knative/serving/releases/download/${serving_version}/serving-core.yaml && break
      n=$[$n+1]
      sleep 5
   done

header_text "Waiting for Knative Serving to become ready"
kubectl wait deployment --all --timeout=-1s --for=condition=Available -n knative-serving

header_text "Setting up Kourier"
kubectl apply -f "https://github.com/knative/net-kourier/releases/download/${kourier_version}/kourier.yaml"

header_text "Waiting for Kourier to become ready"
kubectl wait deployment --all --timeout=-1s --for=condition=Available -n kourier-system

header_text "Configure Knative Serving to use the proper 'ingress.class' from Kourier"
kubectl patch configmap/config-network \
  -n knative-serving \
  --type merge \
  -p '{"data":{"clusteringress.class":"kourier.ingress.networking.knative.dev",
               "ingress.class":"kourier.ingress.networking.knative.dev"}}'
