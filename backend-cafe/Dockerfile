# Usamos Node.js oficial (versión LTS recomendada)
FROM node:18

# Crear directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json si existe
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del backend (incluyendo public con Flutter Web)
COPY . .

# Exponer el puerto de tu backend
EXPOSE 8080

# Comando para iniciar la app
CMD ["npm", "start"]
