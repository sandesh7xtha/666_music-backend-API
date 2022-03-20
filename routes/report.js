const express = require("express");
const router = express.Router();
const mysqlconnection = require("../database/db");
const auth = require("../middlewares/checkAuth")


router.post("/",auth,async (req, res) => {
    // var id = "";
    console.log(req.body);
   
    var date = new Date();
    var postedDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
      // console.log("http://" + req.headers.host + "/" + req.file.path);
    try {
      let data = req.body;
  
          var sql = "INSERT INTO report SET user_id=?,shp_id=?,message=?,date=?" ;
          mysqlconnection.query(
            sql,
            [
              data.user_id,
              data.shp_id,
              data.message,
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
      var sql = "SELECT * FROM report";
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

  router.delete("/DeleteReport/:id", async (req, res) => {
    try {
      var sql = "DELETE FROM report WHERE shp_id=?";
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
