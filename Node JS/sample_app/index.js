const express = require('express');
const app = express();
const port = 3000;
const datas = require('./MOCK_DATA.json');
const fs = require('fs');
const mongoose = require("mongoose");

app.use(express.urlencoded({extended: false}));

app.get('/', (req, res) => {
    res.send('Hello world!');
});

// app.get('/users', (req, res) => {
//     const html = `
//     <ul>
//         ${datas.map((user) => 
//             `<li>${user.first_name}</li>`
//         ).join('')}
//     </ul>
//     `;
//     return res.send(html);
// });
app.route('/users/:id')
.get((req, res) => {
    const id = Number(req.params.id);
    const user = datas.find((user) => user.id === id);
    return res.json(user);
})
.patch((req,res) => {
    const id = Number(req.params.id);
    const body = req.body;
    datas[id] = {...datas[id], ...body};
    fs.writeFile('./MOCK_DATA.json', JSON.stringify(datas), (err, data) => {
        return res.json({status: "pending"});
    })
})
.delete((req, res) => {
    const id = Number(req.params.id);
    datas.splice(id, 1);
    fs.writeFile('./MOCK_DATA.json', JSON.stringify(datas), (err, data) => {
        return res.json({status: "pending"});
    })
});

app.post('/api/users', (req, res) => {
    const body = req.body;
    datas.push({...body, id: datas.length + 1});
    fs.writeFile('./MOCK_DATA.json', JSON.stringify(datas), (err, data) => {
        return res.json({ status: "pending"});
    });
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
