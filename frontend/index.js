import express from 'express';
import path from 'path';
import axios from 'axios';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const URL = process.env.BACKEND_URL || 'http://localhost:5000/api';


// Set EJS as view engine
app.set('view engine', 'ejs');

// Serve static files
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', async (req, res) => {
  try {
    const response = await axios.get(URL);
   
    res.render('index',  { data: response.data.data });
  } catch (error) {
    console.error(error);
    res.status(500).send('Error fetching data');
  }
});

app.listen(3000, "0.0.0.0",() => {
  console.log("server is running on port 3000");
});

