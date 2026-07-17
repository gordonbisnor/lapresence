const { environment } = require('@rails/webpacker')

// Prevent OpenSSL 3 errors on modern Node by avoiding md4
environment.config.merge({
  output: {
    hashFunction: 'sha256',
  },
})

module.exports = environment
