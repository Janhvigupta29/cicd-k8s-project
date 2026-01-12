#Use Node.js as base
FROM node:18-alpine

#Create app directory inside container
WORKDIR /app

#Copy dependency files
COPY package*.json ./

#Install dependencies
RUN npm install

#Copy rest of app code
COPY . .

#Expose app port
EXPOSE 3000

#Command to run app
CMD ["node", "index.js"]
