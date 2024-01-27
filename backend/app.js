require("dotenv").config();
import apiRouter from './routes/api';
import staffRouter from './routes/staff';
import express from 'express';
import logger from 'morgan';
import fileUpload from 'express-fileupload';
import bodyParser from 'body-parser';
import cors from 'cors';
import path from 'path';

const app = express() // setup express application

app.use(logger('dev')); // log requests to the console

// Parse incoming requests data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(fileUpload());

app.use(cors());
app.use(apiRouter);
app.use('/staff', staffRouter); 

app.use("/public", express.static(path.join(__dirname, 'public')));

// Define the directory where your uploaded file are stored
app.use('/upload', (req, res, next) => {
    express.static(path.join(__dirname, 'upload'))(req, res, (err) => {
      if (err) {
        // Handle the error or send a 404 response
        res.status(404).send('Not Found');
      } else {
        next();
      }
    });
  });

app.listen(process.env.PORT, (err) => {
    if (err) return console.log(`con not listen to port: ${process.env.PORT}`);
    console.log(`server is listening to port: ${process.env.PORT}/`);
});