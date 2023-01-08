resource "aws_amplify_app" "b2c_frontend" {
  name = "b2c_frontend"
  repository = "https://github.com/srhoton/b2cdemostack"
  access_token = "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"
  enable_auto_branch_creation = true
  enable_branch_auto_deletion = true
  build_spec = <<-EOT
version: 1
applications:
  - frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn build 
      artifacts:
        baseDirectory: out
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
    appRoot: b2c-frontend
EOT
  
}
