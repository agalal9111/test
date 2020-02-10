pipeline {
    agent none
    stages {
        stage('SCM') {
            agent { dockerfile true }
            steps {
                 git 'https://github.com/agalal9111/test.git' 
            }
        }
}
}
