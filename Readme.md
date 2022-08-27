# Cloud Resume Project
[![Deploy to ECR](https://github.com/jstrebeck/Cloud-Resume-Project/actions/workflows/main.yml/badge.svg)](https://github.com/jstrebeck/Cloud-Resume-Project/actions/workflows/main.yml)

You can see the final live version here: [strebeck.net](https://www.strebeck.net)

The cloud resume challenge is a project to demonstrate cloud skills while also creating a showcase for your resume.  This project also gave me a platform to practice some DevOps tools. The inspiration and ideas are loosely based on the requirements of [the cloud resume project](https://forrestbrazeal.com/2020/04/23/the-cloud-resume-challenge/) written by Forrest Brazeal over on his site.


This project includes the following technologies.
* AWS S3
* AWS Cloudfront
* AWS Route 53
* Github Actions


## Devops tools

As I was creating the webpage and updating certain aspects it became increasingly inconvenient to push to Github, update files in S3, and invalidate data within the CloudFront cache. Github actions was chosen for this project since I was already pushing all my code there. Below is the workflow used when code is committed to this repository. 

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
