# Dependencies
mongoose = require "mongoose" 
Schema   = mongoose.Schema


# Series
seriesSchema = new Schema 
  # Series info
  content:
    title: String
    img: String
    min: String
    status: String
    releaseDate: String
    episodes: Number
    season: String
    description: String
    pvs: [ String ]
    links: 
      official: String
      twitter: String
      mal: String

  # Regex for torrent filtering.
  regex: [ String ]

  # List of episodes.
  episodes: [
    type: Schema.Types.ObjectId
    ref: "Episode"
  ]
  
  # Date/Time info
  createdAt:
    type: String
  updatedAt:
    type: String


# Export model
Series = mongoose.model "Series", seriesSchema
 
module.exports = Series