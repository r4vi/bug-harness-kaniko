build:
	docker run -v .:/workspace harness/kaniko:latest --dockerfile "./Dockerfile" --context /workspace --no-push | tee build.log 
	grep -q 'a+b.patch' build.log && echo "a+b.patch copied" || echo "a+b.patch not copied"

build_google:
	docker run -v .:/workspace gcr.io/kaniko-project/executor:latest --dockerfile "./Dockerfile" --context /workspace --no-push | tee build.log 
	grep -q 'a+b.patch' build.log && echo "a+b.patch copied" || echo "a+b.patch not copied"