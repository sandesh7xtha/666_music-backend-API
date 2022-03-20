const express = require("express");
const router = express.Router();
const mysqlconnection = require("../database/db");
const path = require("path");
const multer = require("multer");
const auth = require("../middlewares/checkAuth");

//for image upload
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "public/secondhandIMG");
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
// upload.single("image")
//post allqueries
router.post("/", auth,upload.single("image"), async (req, res) => {
  // var id = "";
  console.log(req.body);
  var date = new Date();
  var postedDate =
    date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
  
  try {
    let data = req.body;

    var sql =
      "INSERT INTO secondhand_product SET title =?, image=?,description  = ?,category =?,price =?,used_duration    =?,contact_number    =?,email    =?,location     =?,date =?,user_id =?";
    mysqlconnection.query(
      sql,
      [
        data.title,
        "http://" + req.headers.host + "/" + req.file.path,
        // data.image,
        data.description,
        data.category,
        data.price,
        data.used_duration,
        data.contact_number,
        data.email,
        data.location,
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

router.get("/", async (req, res) => {
  try {
    var sql = "SELECT * FROM secondhand_product";
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

router.get("/MyProduct/:id", async (req, res) => {
  try {
    const id = req.params.id;
    var sql = "SELECT * FROM secondhand_product where user_id =?";

    const output = mysqlconnection.query(sql, [id], (err, result) => {
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
    var sql = "SELECT * FROM secondhand_product where shp_id=?";
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
    var sql = "DELETE FROM comment_shp WHERE shp_id=?";
    const output = mysqlconnection.query(
      sql,
      [req.params.id],
      (err, result) => {
        if (!err) {
          var sql = "DELETE FROM report WHERE shp_id=?";
          const output = mysqlconnection.query(
            sql,
            [req.params.id],
            (err, result) => {
              if (!err) {
                var sql = "DELETE FROM secondhand_product WHERE shp_id=?";
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
