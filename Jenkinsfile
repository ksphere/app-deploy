pipeline {
  agent any
  stages {
    stage('test with cookstyle') {
      steps {
        chef_cookbook_cookstyle(installation: '/usr/bin/cookstyle')
      }
    }
    stage('test with foodcritic') {
      steps {
        chef_cookbook_foodcritic(installation: '/usr/local/bin/foodcritic')
      }
    }
    stage('') {
      steps {
        dir(path: '/root/Koenig-org/chef-repo') {
          sh 'knife ssh node1 "chef-client"'
        }

      }
    }
  }
}