const express = require("express");
const router = express.Router();
const mysqlconnection = require("../database/db");
const path = require("path");
const multer = require("multer");
const auth = require("../middlewares/checkAuth");

//for image upload
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "public/shopIMG");
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

//post allqueries
router.post("/", upload.single("image"), async (req, res) => {
  // var id = "";
  console.log(req.body);
  console.log("hello");
  var date = new Date();
  var postedDate =
    date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
  // console.log("http://" + req.headers.host + "/" + req.file.path);
  try {
    let data = req.body;

    var sql =
      "INSERT INTO Shop_Product SET title =?, image=?,description  = ?,category =?,price =?,stock=?,date =?,discount=?";
    mysqlconnection.query(
      sql,
      [
        data.title,
        "http://" + req.headers.host + "/" + req.file.path,
        data.description,
        data.category,
        data.price,
        data.stock,
        postedDate,
        data.discount,
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

router.patch("/", async (req, res) => {
  // var id = "";
  // console.log("http://" + req.headers.host + "/" + req.file.path);
  try {
    let data = req.body;

    var sql =
      "UPDATE Shop_Product SET title =?,description  = ?,category =?,price =?,stock=? WHERE sp_id=? ";
    mysqlconnection.query(
      sql,
      [
        data.title,
        // "http://" + req.headers.host + "/" + req.file.path,
        data.description,
        data.category,
        data.price,
        data.stock,
        data.sp_id,
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

router.patch("/publish", async (req, res) => {
  // var id = "";
  // console.log("http://" + req.headers.host + "/" + req.file.path);
  try {
    let data = req.body;

    var sql = "UPDATE Shop_Product SET visibility =? WHERE sp_id=? ";
    mysqlconnection.query(
      sql,
      [data.visibility, data.sp_id],
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
    var sql = "SELECT * FROM 	shop_product where visibility='true'";
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

router.get("/allShopingProduct", async (req, res) => {
  try {
    var sql = "SELECT * FROM 	shop_product ";
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

router.get("/productDetial/:id", async (req, res) => {
  try {
    var sql = "SELECT * FROM shop_product where sp_id=?";
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

router.delete("/DeleteProduct/:id", async (req, res) => {
  try {
    console.log(req.params.id);
    var sql = "DELETE FROM comment_sp WHERE sp_id=?";
    const output = mysqlconnection.query(
      sql,
      [req.params.id],
      (err, result) => {
        if (!err) {
          var sql = "DELETE FROM add_to_cart WHERE sp_id=?";
          const output = mysqlconnection.query(
            sql,
            [req.params.id],
            (err, result) => {
              if (!err) {
                var sql = "DELETE FROM shop_product WHERE sp_id=?";
                const output = mysqlconnection.query(
                  sql,
                  [req.params.id],
                  (err, result) => {
                    if (!err) {
                      res.status(200).json({
                        status: "ok",
                        data: "deleted sucessfully",
                      });
                    }
                  }
                );
              }
            }
          );
        }
      }
    );
  } catch (err) {
    res.json({
      message: err,
    });
  }
});

module.exports = router;
