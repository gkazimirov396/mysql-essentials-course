import express from 'express';
import helmet from 'helmet';
import morgan from 'morgan';

import pa3Routes from './routes/pa3.js';

const app = express();
const PORT = 5000;

app.use(helmet());
app.use(morgan('dev'));
app.use(express.json());

app.use('/pa3', pa3Routes);

app.use('*', (req, res) => res.status(404).send('Page not found!'));

app.listen(PORT, () =>
  console.log(`Server is running on http://localhost:${PORT}`)
);
