pipeline {
  agent any
  stages {
    stage('test with cookstyle') {
      steps {
        ws(dir: '/opt/Koenig-org/chef-repo/cookbooks/example123/')
      }
    }
    stage('test with foodcritic') {
      steps {
        chef_cookbook_foodcritic(installation: '/usr/local/bin/foodcritic')
      }
    }
    stage('error') {
      steps {
        dir(path: '/opt/Koenig-org/chef-repo') {
          sh 'knife ssh node1 --ssh-user root --ssh-password redhat  "chef-client"'
        }

      }
    }
  }
}