const express = require("express");
const router = express.Router();
const mysqlconnection = require("../database/db");
const auth = require("../middlewares/checkAuth")

router.post("/",auth, async (req, res) => {
  // var id = "";
  console.log(req.body);

  var date = new Date();
  var postedDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();

  // console.log("http://" + req.headers.host + "/" + req.file.path);
  try {
    let data = req.body;

    var sql = "INSERT INTO comment_shp SET message=?,user_id=?,shp_id=?,date=?";
    mysqlconnection.query(
      sql,

      [data.message, data.user_id, data.shp_id,postedDate,],

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
    var sql = "SELECT * FROM comment_shp JOIN user ON comment_shp.user_id = user.id JOIN secondhand_product ON comment_shp.shp_id = secondhand_product.shp_id WHERE secondhand_product.shp_id=? ORDER BY cmt_id DESC;";
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



router.post("/commentShop", async (req, res) => {
  // var id = "";
  console.log(req.body);

  var date = new Date();
  var postedDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();

  // console.log("http://" + req.headers.host + "/" + req.file.path);
  try {
    let data = req.body;

    var sql = "INSERT INTO comment_sp SET message=?,user_id=?,sp_id=?,date=?";
    mysqlconnection.query(
      sql,

      [data.message, data.user_id, data.sp_id,postedDate,],

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


router.get("/commentShop/:id", async (req, res) => {
  try {
    var sql = "SELECT * FROM comment_sp JOIN user ON comment_sp.user_id = user.id JOIN shop_product ON comment_sp.sp_id = shop_product.sp_id WHERE shop_product.sp_id=? ORDER BY cmt_id DESC;";
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
