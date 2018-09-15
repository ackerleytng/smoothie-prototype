const updatePage = function (data) {
  $('#grabber').html(data.grabber)
  $('#snarky').html(data.snarky)
}

const setupDb = function (secrets) {
  const apikey = secrets.apikey
  const db = new restdb(apikey, {realtime: true})
  const collection = db.wendykong

  const handlePost = function (err, evt) {
    if (!err) {
      updatePage(evt.data)
    }
  }

  const handlePut = function (err, evt) {
    if (!err) {
      collection.find({"_id": evt.data}, {}, function(err, updated){
        updatePage(updated[0])
      });
    }
  }

  const handleConnect = function () {
    collection.find({},
                    {"$max": 1,"$orderby": {"_created": -1}},
                    function (err, lines) {
                      updatePage(lines[0])
	            })
  }

  db.on('CONNECT', handleConnect)
  db.on('RECONNECT', handleConnect)
  collection.on('POST', handlePost)
  collection.on('PUT', handlePut)
}

const main = function () {
  $.getJSON('/secrets.json', setupDb)
}

$(window).load(main)
