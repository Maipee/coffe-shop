/// START REQUIRE

	///MODULES NODE
var xpress = require('express');
var app = xpress();
var session = require('express-session');
var routing = require('routing');
var bodyparser = require('body-parser');
var url = require('url');
var passport = require('passport');


	/// MODULES Coffee-cup
var cfg = require('config');//@TODO
var auth = require('authentification');//@TODO
var admin = require('admin');//@TODO
var mailrouting = require('emailrouting');//@TODO


var df = require('dateformat');
//@TODO classer use
app.use(function(req,res,next){
    var user = 'anonymous'
    if(typeof req == 'undefined'){
        console.log('Time : ',df(Date.now(),cfg.APP.dateformat),req.method,user,req.url);
        }
    //@TODO le next est la pour appliquer tout ce qui est avant à le faire à tout ce qui suit
    next();
});

/// END REQUIRE

/// START USE
app.use(xpress.static('public/web'));
app.use(xpress.static('public/web/admin'));//dossier web !

app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended: true}));

app.use(session({secret:"Thissecret",resave:true, saveUminitialized : true}));
app.use(passport.initialize());
app.use(passport.session());

app.use(function(req,res,next){
    var user = 'anonymous'
    if(typeof req == 'undefined'){
        console.log('Time : ',df(Date.now(),cfg.APP.dateformat),req.method,user,req.url);
        }
    //@TODO commentaire next
    next();
});

app.use("/",mailrouting);

app.use("/",routing);

/// END USE

/// 404 (LAST)

app.use(function(req,resp){
    // Si requête sans réponse
    if(typeof req.user =='undefined'){
        //alors on redirige vers la page 404
        resp.status(404).render('404.html.twig');
    }
    else
    {
        resp.status(404).render('404.html.twig',{"username":req.user.username});
    }
resp.render
});

app.listen(8088);
