import process from 'process';
import env from 'dotenv';

import mysql from 'mysql2';

env.config();

const pool = mysql.createPool({
  host: 'localhost',
  user: process.env.USER_NAME,
  database: 'hiking-trail',
  password: process.env.DB_PASS,
});

export const db = pool.promise();
