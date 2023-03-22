const mongoose = require('mongoose');
require('dotenv').config({ path: `.env.${process.env.NODE_ENV}` })
const connectDB = async () => {
  const conn = await mongoose.connect(
    `${process.env.MONGO_URL}`,
      {
      useNewUrlParser: true,
      useFindAndModify:false,
      useCreateIndex:true,
      useUnifiedTopology: true
      }
    );

  console.log(`MongoDB connected: ${conn.connection.host}`);
}

module.exports = connectDB;