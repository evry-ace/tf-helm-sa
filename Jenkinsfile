@Library("ace") _

import no.ace.Terraform

properties([disableConcurrentBuilds()])

Map opts = [
  agent: 'jenkins-docker-3',
  dockerSet: false,
]

List<String> dockerArgs = [
  "-w /src",
  "-v ${env.WORKSPACE}:/src",
  "--entrypoint=''"
]


ace(opts) {
  stage("lint") {
    docker.image("hashicorp/terraform:0.11.13").inside(dockerArgs.join(" ")) {
      sh "terraform fmt -check=true"
    }
  }
}