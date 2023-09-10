var express = require('express');
var router = express.Router();
const db = require("../database/database")

/* GET users listing. */
router.get('/', function(req, res, next) {
  db.query("SELECT * FROM users", (error, result) => {
    if (error != null){
      res.status(400).send({
        "message": error.message
      })
    } else {
      res.send(result)
    }
  })
});

router.post('/login', (req, res, next)=>{
  const {email, password} = req.body;

  db.query(`SELECT * FROM users WHERE email = '${email}' AND password = '${password}'`, (err, result)=>{
    if (err != null){
      res.status(400).send({
        message: err.message
      })
    } 
    if (result.length == 0) {
      res.status(401).send({
        message: "Credentials not found"
      })
    }
  
    console.log(result)
    res.status(200).send(result[0])
  })
})

module.exports = router;
