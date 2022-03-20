const express = require("express");
const router = express.Router();
const mysqlconnection = require("../database/db");
const auth = require("../middlewares/checkAuth")


router.post("/",auth,async (req, res) => {
    // var id = "";
    console.log(req.body);
   
    var date = new Date();
      // console.log("http://" + req.headers.host + "/" + req.file.path);
    try {
      let data = req.body;
  
          var sql = "INSERT INTO add_to_cart SET user_id=?,sp_id=?,quantity=?" ;
          mysqlconnection.query(
            sql,
            [
              data.user_id,
              data.sp_id,
              data.quantity,
 
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

  router.get("/:id", async (req, res) => {
    try {
      var sql = "SELECT * FROM add_to_cart INNER JOIN Shop_Product ON add_to_cart.sp_id = Shop_Product.sp_id where user_id=? ";
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
