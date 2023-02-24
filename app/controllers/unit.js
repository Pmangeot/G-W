const controller = {
    details: (req, res) =>{
        const modelName = req.params.modelName;

        const foundModel = gwlist.find((model)=>{
            return model.name == modelName;
        });
        if(foundModel !== undefined){
            res.render('modele', {foundModel});
        }
    }
}


module.exports = controller;
