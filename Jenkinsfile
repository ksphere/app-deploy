pipeline {
  agent any
  stages {
    stage('test_cookbook') {
      steps {
        chef_cookbook_cookstyle(installation: '/usr/bin/cookstyle')
      }
    }
  }
}