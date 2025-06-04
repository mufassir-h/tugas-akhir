# Menggunakan image dasar Node.js versi LTS
FROM node:18-alpine

# Menentukan working directory di dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json
COPY package*.json ./

# Menginstall dependencies
RUN npm install

# Menyalin semua file proyek ke dalam container
COPY . .

# Mengekspos port yang digunakan oleh aplikasi (misalnya 3000)
EXPOSE 3000

# Menjalankan aplikasi
CMD ["npm", "start"]
