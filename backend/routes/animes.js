const express = require("express");
const router = express.Router();
const multer = require("multer")
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, "assets")
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname)
    }
})

const upload = multer({
    storage: storage
})

const db = require('../database/database');

const middlewareToken = (req, res, next)=>{
    const token = req.query.token;
    db.query(`SELECT * FROM users WHERE token = '${token}'`, (err, result)=>{
        if(err) res.status(400).send({message: err.message})
        if(result.length != 0) {
            next();
            return;
        }
        res.status(401).send({message: "Unathorized"})
    })
}

router.get("/", middlewareToken, (req, res, next)=>{
    db.query("SELECT * FROM animes", (err, result)=>{
        if(err){
            res.status(400).send({
                message: err.message
            })
        }
        res.status(200).send(result)
    })
})

router.get("/:id", (req, res, next) => {
    const id = req.params.id
    db.query(`SELECT * FROM animes WHERE id = ${id}`, (err, result)=>{
        if(err) res.status(400).send({message: err.message});
        if(result.length == 0) res.status(404).send({message: "Anime not found"})
        res.status(200).send(result[0])
    })
})


router.post("/", upload.single("image"), (req, res, next)=>{
    const {title, episodes, description} = req.body;
    const file = req.file;

    const filePath = "http://10.0.2.2:3000/" + file.path.replace("\\", "/")

    db.query(`INSERT INTO animes VALUES (0, '${title}', '${filePath}', '${episodes}', '${description}') `, (err, result)=>{
        if(err) res.status(400).send({message: err.message});
        res.status(200).send({message: "Anime inserted"})
    })
})

module.exports = router;
