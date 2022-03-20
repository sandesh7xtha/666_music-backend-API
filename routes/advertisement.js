const express = require("express");
const router = express.Router();
const mysqlconnection = require("../database/db");
const path = require("path");
const multer = require("multer");

//for image upload
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, "public/advertisementIMG");
    },
    filename: (req, file, cb) => {
      cb(null, Date.now() + path.extname(file.originalname));
    },
  });
  
  const filefilter = (req, file, cb) => {
    if (
      file.mimetype == "image/jpeg" ||
      file.mimetype == "image/png" ||
      file.mimetype == "image/jpg"
    ) {
      cb(null, true);
    } else {
      cb(null, false);
    }
  };
  
  const upload = multer({ storage: storage, fileFilter: filefilter });

  router.post("/", upload.single("image"),async (req, res) => {
    // var id = "";
    console.log(req.body);
    console.log("hello");
    var date = new Date();
    var postedDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
      // console.log("http://" + req.headers.host + "/" + req.file.path);
    try {
      let data = req.body;
  
          var sql = "INSERT INTO advertisement SET image=?,title=?,description=?,date =?" ;
          mysqlconnection.query(
            sql,
            [
              "http://" + req.headers.host + "/" + req.file.path,
              data.title,
              data.description,
              postedDate, 
            ],
            (err, rows, fields) => {
              if (!err) {
                return res.status(200).json({
                  status: "ok",
                  data: data,
                });
              } else console.log(err);
            }
          );
       
      
    } catch (err) {
      res.json({
        message: err,
      });
    }
  });


  router.get("/", async (req, res) => {
    try {
      var sql = "SELECT * FROM advertisement";
      const output = mysqlconnection.query(sql, (err, result) => {
        if (!err) {
          res.status(200).json({
            status: "ok",
            data: result,
          });
          console.log(result.length);
          // console.log(output);
        } else console.log(err);
      });
    } catch (err) {
      res.json({
        message: err,
      });
    }
  });

  
  router.delete("/DeleteProduct/:id", async (req, res) => {
    try {
      var sql = "DELETE FROM advertisement WHERE adv_id=?";
      const output = mysqlconnection.query(sql,[req.params.id], (err, result) => {
        if (!err) {
          res.status(200).json({
            status: "ok",
            data: result,
          });
          console.log(result.length);
          // console.log(output);
        } else console.log(err);
      });
    } catch (err) {
      res.json({
        message: err,
      });
    }
  });
  


  module.exports = router;