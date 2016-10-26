node {
	stage 'Git Checkout'
		git url: 'https://github.com/treselle-workbench/mojolicious_perl_poc.git'
	stage 'Build Docker Image'
		sh "sudo docker build -t mojolicious_perl ."
	stage 'Run Docker Container'
		sh "sudo docker run --name mojolicious_perl -p 3000:3000 -d mojolicious_perl"
}