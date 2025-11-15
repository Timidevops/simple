pipeline {
    agent any

    tools {
        jdk 'JDK17'        // Configure in Manage Jenkins → Global Tool Configuration
        maven 'Maven3'     // Same there
    }

    environment {
        IMAGE        = "timidevops/userportal:1.1"
        KUBE_NAMESPACE = "default"
        KUBE_DEPLOYMENT = "tomcat"

        // Jenkins credentials IDs (set these up in Jenkins)
        DOCKERHUB      = credentials('dockerhub')          // username/password or token
        SONAR_TOKEN    = credentials('sonarqube-token')    // Secret text from SonarQube
        NEXUS           = credentials('nexus')       // username/password for Nexus (if needed)
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Timidevops/Userportal.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn -B clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube-server') {  // Name from Jenkins → Configure System → SonarQube
                    sh """
                    mvn -B clean verify sonar:sonar \
                      -Dsonar.projectKey=userportal \
                      -Dsonar.login=${SONAR_TOKEN}
                    """
                }
            }
        }

        stage('Quality Gate') {
            steps {
                script {
                    timeout(time: 5, unit: 'MINUTES') {
                        def qg = waitForQualityGate()
                        if (qg.status != 'OK') {
                            error "Pipeline aborted due to quality gate failure: ${qg.status}"
                        }
                    }
                }
            }
        }


        stage('Upload WAR to Nexus') {
            steps {
                echo "Uploading WAR to Nexus..."
                sh """
                mvn deploy \
                   -DaltDeploymentRepository=nexus::default::http://18.117.178.164:8081/repository/userportal-war-artifact/ \
                   -Dnexus.username=${NEXUS_USR} \
                   -Dnexus.password=${NEXUS_PSW}
                """
            }
        } 



        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${IMAGE}:${env.BUILD_NUMBER} .
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                sh """
                echo "${DOCKERHUB_PSW}" | docker login -u "${DOCKERHUB_USR}" --password-stdin
                docker push ${IMAGE}:${env.BUILD_NUMBER}
                docker tag ${IMAGE}:${env.BUILD_NUMBER} ${IMAGE}:latest
                docker push ${IMAGE}:latest
                """
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh """
                # Ensure kubeconfig is available at /var/lib/jenkins/.kube/config
                kubectl config get-contexts

                kubectl set image deployment/${KUBE_DEPLOYMENT} \
                  tomcat=${IMAGE}:${env.BUILD_NUMBER} \
                  -n ${KUBE_NAMESPACE}

                kubectl rollout status deployment/${KUBE_DEPLOYMENT} -n ${KUBE_NAMESPACE}
                """
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful: ${IMAGE}:${env.BUILD_NUMBER} is live in ${KUBE_NAMESPACE}"
        }
        failure {
            echo "❌ Pipeline failed. Check the stage logs."
        }
    }
}
