pipeline {
    agent any
    environment {
        HARBOR_CREDS = credentials('jenkins-harbor-creds')
		K8S_CONFIG = credentials('jenkins-k8s-config')
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
				sh "docker login -u ${HARBOR_CREDS_USR} -p ${HARBOR_CREDS_PSW} ${params.HARBOR_HOST}"
				sh "docker build -t ${params.HARBOR_HOST}/${params.DOCKER_IMAGE}:${GIT_TAG} ."
				sh "docker push ${params.HARBOR_HOST}/${params.DOCKER_IMAGE}:${GIT_TAG}"
				sh "docker rmi ${params.HARBOR_HOST}/${params.DOCKER_IMAGE}:${GIT_TAG}"
            }
            
        }
        stage('Kubernetes Deploy') {
            when { 
                allOf {
                    expression { env.GIT_TAG != null }
                }
            }
            agent any
            steps {
                sh "mkdir -p ~/.kube"
                sh "echo ${K8S_CONFIG} | base64 -d > ~/.kube/config"
                sh "sed -e 's#{IMAGE_URL}#${params.HARBOR_HOST}/${params.DOCKER_IMAGE}#g;s#{IMAGE_TAG}#${GIT_TAG}#g;s#{APP_NAME}#${params.APP_NAME}#g;s#{SPRING_PROFILE}#k8s-test#g' k8s-deployment.tpl > k8s-deployment.yml"
                sh "kubectl apply -f k8s-deployment.yml --namespace=${params.K8S_NAMESPACE}"
            }
            
        }
    }
}