pipeline {
  agent any
  stages {
    stage('test with cookstyle') {
      steps {
        chef_cookbook_cookstyle(installation: '/usr/bin/cookstyle')
      }
    }
  }
}