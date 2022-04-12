const express = require("express");
const router = express.Router();
const mysqlconnection = require("../database/db");
const auth = require("../middlewares/checkAuth");

router.post("/", async (req, res) => {
  // var id = "";
  console.log(req.body);

  var date = new Date();
  var postedDate =
    date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
  // console.log("http://" + req.headers.host + "/" + req.file.path);
  try {
    let data = req.body;

    var sql =
      "INSERT INTO payment SET payment_id =?,fullName =?,address =?,contactNumber =?,city=?,province  =?,zip  =?,totalAmount  =?,date   =?,user_id   =?";
    mysqlconnection.query(
      sql,
      [
        data.payment_id,
        data.fullName,
        data.address,
        data.contactNumber,
        data.city,
        data.province,
        data.zip,
        data.totalAmount,
        postedDate,
        data.user_id,
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

module.exports = router;
