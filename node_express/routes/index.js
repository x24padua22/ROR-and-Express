module.exports = function Route(app){
  	app.io.route('submit_data', function(req) {
    	console.log(req.data)
    	req.io.broadcast('send_data', req.data);
	})
}