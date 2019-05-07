pipeline {
  agent any
  stages {
    stage('cookstyle_test') {
      steps {
        chef_cookbook_cookstyle(installation: '/usr/bin/cookstyle')
      }
    }
  }
}