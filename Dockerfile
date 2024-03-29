# Use the light version of the image that contains just the latest binary
FROM brennaman3/aksdeploy:latest

# The app folder will contain all our files
WORKDIR /app

# Put all your configration files in the same folder as the Dockerfile
COPY . /app