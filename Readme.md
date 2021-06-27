# Cloud Resume Project

This project is intended to demonstrate all of my cloud skills and while also displaying my resume. This project also gave me a platfrom to practice some devops tools 

This project includes the following technologies.
* AWS S3
* AWS Cloudfront
* AWS Route 53
* Github Actions


Azure has been connected to my DNS name

## Devops tools



```
name: Upload Website

on:
  push:
    branches:
    - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: jakejarvis/s3-sync-action@master
      with:
        args: --acl public-read --follow-symlinks --delete
      env:
        AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_REGION: 'us-west-2'   # optional: defaults to us-east-1
        
    - name: invalidate
      uses: chetan/invalidate-cloudfront-action@master
      env:
        DISTRIBUTION: ${{ secrets.DISTRIBUTION }}
        PATHS: '/index.html'
        AWS_REGION: 'us-east-1'
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```