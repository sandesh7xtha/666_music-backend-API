const express = require("express");
const app = express();
const morgan = require("morgan");
// const mysql = require("mysql");
const cors = require("cors");
// const path = require("path");
const PORT = 4000;

//for path directory
global.appRoot = __dirname;
//for request parameter
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());
app.use(morgan("dev"));
app.use(cors());
app.use("/public/secondhandIMG", express.static("public/secondhandIMG"));
app.use("/public/newsIMG", express.static("public/newsIMG"));
app.use("/public/shopIMG", express.static("public/shopIMG"));
app.use("/public/advertisementIMG", express.static("public/advertisementIMG"));

//require all routes
const second_product_router = require("./routes/second_product");
const user_Router = require("./routes/userRoutes");
const shopping_Router = require("./routes/shopping");
const news_Router = require("./routes/news");
const report_Router = require("./routes/report");
const add_to_cart_Router = require("./routes/add_to_cart");
const comments_Router = require("./routes/comments");
const advertisement_Router = require("./routes/advertisement");


//use all routes
app.use("/secondProduct", second_product_router);
app.use("/user",user_Router );
app.use("/shopping", shopping_Router);
app.use("/news", news_Router);
app.use("/report", report_Router);
app.use("/addToCart", add_to_cart_Router);
app.use("/comments", comments_Router);
app.use("/advertisements", advertisement_Router);



app.listen(PORT, () => {
    console.log("Server start at port : " + PORT);
    //   console.log(dbConfig);
  });
  