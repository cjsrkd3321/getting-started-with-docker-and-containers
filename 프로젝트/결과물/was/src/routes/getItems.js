const db = require('../persistence');

module.exports = async (req, res) => {
    console.log(`${req.ip} getItems`)
    const items = await db.getItems();
    res.send(items);
};
