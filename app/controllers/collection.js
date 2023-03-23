const gwlist = require('../data/gwlist.json');

const controller = {
    list: (req, res)=>{
        res.render('collection', {gwlist});
    }
}

module.exports = controller;

