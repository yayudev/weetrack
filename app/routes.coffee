# Dependencies.
path    = require "path"
express = require "express"
api     = require "./api"

# Module variables
router = express.Router()
assets = path.join __dirname, "assets"
libs   = path.join __dirname, "..", "bower_components"

# CORS
router.use (req, res, next) ->
  res.header('Access-Control-Allow-Origin', '*')
  res.header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PUT, DELETE')
  res.header('Access-Control-Allow-Headers', 'Origin, x-auth, X-Requested-With, Content-Type, Accept')
  next()

# Static files.
router.use "/assets", express.static(assets)
router.use "/libs", express.static(libs)

# API Routes.
router.use "/api", api

# Regex file for debugging
router.use "/regex_file", (req, res) ->
  res.sendFile path.join(__dirname, "regex.txt")

# Send index.html.
router.use "/", (req, res) ->
  res.sendFile path.join(__dirname, "assets", "html", "index.html")


# Export router.
module.exports = router
