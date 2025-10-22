
pipeline {
    agent{
        label 'AGENT-1'
    }
    options{
        timeout(time: 30,unit: 'MINUTES')
        disableConcurrentBuilds()
   //     ansiColor('xterm')
    }
     environment{
    //     def appVersion = ''  # instead of using here for global we have env to use for safer option 
           region = 'us-east-1'
           username = 'vasanthreddy135'
           component = 'nodejs'
     } 
    parameters{
        booleanParam(name: 'deploy',defaultValue: false, description: 'The defalut wont triggle until it is true')
    }
    stages{
        stage('version'){
            steps{
                script{
                    def packageJson = readJSON file: 'package.json'
                    def appVersion = packageJson.version
                    echo "the app version is : ${appVersion}"

                    env.APP_VERSION = appVersion  
                }
            }
        }
        stage('Install Dependencies'){
            steps{
                sh """
                    echo "the app version is : $APP_VERSION"
                    npm install
                    ls -ltr
                
                """
            }
        }
        stage('Build'){
            steps{
                sh """
                zip -q -r backend-${APP_VERSION}.zip * -x JenkinsFile -x backend-${APP_VERSION}.zip
                ls -ltr
                """
            }
        }
        stage('Docker Build'){
            steps{
                sh """
                echo "Building docker image"
                   docker build -t /${username}/${component}:${APP_VERSION} .
                echo "Pushing docker image"
                   docker push /${username}/${component}:${APP_VERSION}
                """
            }
        }
        stage('Deploy'){
            when{
                expression{
                    params.deploy 
                }
            }
            steps{
                script{
                        def params = [
                            string(name: 'app_VERSION', value: "${APP_VERSION}" )
                        ]
                        build job: 'deploy', parameters: params, wait: false
                }
            } 
        }       
    }
 
        post{
            always {
                echo ' i always say hello'
                deleteDir()
            }
            success{
                echo 'success'
            }
            failure{
                echo 'failure'
            }
        }
    
}
