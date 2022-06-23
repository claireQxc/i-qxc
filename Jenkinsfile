pipeline {
    agent any
    environment {
        HARBOR_CREDS = credentials('jenkins-harbor-creds')
        GIT_TAG = sh(returnStdout: true,script: 'git describe --tags --always').trim()
    }
    parameters {
        string(name: 'HARBOR_HOST', defaultValue: 'hub.i-qxc.com', description: 'harbor仓库地址')
        string(name: 'DOCKER_IMAGE', defaultValue: 'web/simple-web', description: 'docker镜像名')
        string(name: 'APP_NAME', defaultValue: 'simple-web', description: 'k8s中标签名')
        string(name: 'K8S_NAMESPACE', defaultValue: 'jenkins', description: 'namespace')
    }
    stages {
        stage('Build') {
            when { expression { env.GIT_TAG != null } }
            agent any
            steps {
				nodejs(nodeJSInstallationName: 'node18') {
					sh 'pwd'
					sh 'node -v && npm -v'
					sh '''npm install --registry=https://registry.npm.taobao.org
					'''
					sh '''npm run build
					'''
				}
            }
        }
        stage('Docker Build') {
            when { 
                allOf {
                    expression { env.GIT_TAG != null }
                }
            }
            agent any
            steps {
				docker.withRegistry('hub.i-qxc.com', 'jenkins-harbor-creds') {
					sh "docker build -t ${params.HARBOR_HOST}/${params.DOCKER_IMAGE}:${GIT_TAG} ."
					sh "docker push ${params.HARBOR_HOST}/${params.DOCKER_IMAGE}:${GIT_TAG}"
					sh "docker rmi ${params.HARBOR_HOST}/${params.DOCKER_IMAGE}:${GIT_TAG}"
				}
            }
            
        }
        
    }
}