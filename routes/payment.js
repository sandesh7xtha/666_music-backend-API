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

router.post("/history", async (req, res) => {
  // var id = "";
  console.log(req.body);

  var date = new Date();
  // console.log("http://" + req.headers.host + "/" + req.file.path);
  try {
    let data = req.body;

    var sql = "INSERT INTO history SET payment_id =?,sp_id =?,quantity=?";
    mysqlconnection.query(
      sql,
      [data.payment_id, data.sp_id, data.quantity],
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
    var sql =
      "SELECT * FROM history join payment on payment.payment_id=history.payment_id join shop_product on shop_product.sp_id=history.sp_id";
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

router.get("/paymentData/:id", async (req, res) => {
  try {
    let data = req.body;
    console.log(data);
    var sql = "SELECT * FROM payment  where user_id=?";
    const output = mysqlconnection.query(
      sql,
      [req.params.id],
      (err, result) => {
        if (!err) {
          res.status(200).json({
            status: "ok",
            data: result,
          });
          console.log(result.length);
          // console.log(output);
        } else console.log(err);
      }
    );
  } catch (err) {
    res.json({
      message: err,
    });
  }
});

router.get("/history/:payment_id", async (req, res) => {
  try {
    var sql =
      "SELECT * ,payment.date AS datePayment FROM history join payment on payment.payment_id=history.payment_id join shop_product on shop_product.sp_id=history.sp_id where payment.payment_id=?";
    const output = mysqlconnection.query(
      sql,
      [req.params.payment_id],
      (err, result) => {
        if (!err) {
          res.status(200).json({
            status: "ok",
            data: result,
          });
          console.log(result.length);
          // console.log(output);
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
