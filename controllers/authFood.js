const mysql = require('mysql2');

const db = mysql.createConnection({
    host: process.env.DATABASE_HOST,
    port: process.env.DATABASE_PORT,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME
});

// * Checking if DB is connected
db.connect((err) => {
    err ? console.log('Error:', err) : console.log('DB Connected.');
});


exports.addFood = (request, response) => {
    const { food_name, price, food_category_id } = request.body;

    db.query(
        `SELECT food_name FROM food WHERE food_name = ?`, [food_name],
        async (err, result) => {
            if (err) {
                console.log(err);
                return response.render('addFood', { message: `Database has a problem. (${err})` });
            };

            if (result.length > 0) return response.render('addFood',
                { message: `Food Record Already Exists. If it's a variation of an existing food in the records, please indicate the variation/style of the food.` });

            db.query(
                'INSERT INTO food SET ?',
                {
                    food_name: food_name,
                    price: price,
                    food_category_id: food_category_id,
                },
                (err) => {
                    if (err) console.log(err);
                    else {
                        db.query(
                            `SELECT food_name, price, category
                          FROM food JOIN food_category ON food.food_category_id = food_category.food_category_id`,
                            (err, result) => {
                                if (err) console.log(err);
                                response.render('index', {
                                    foodRecord: result, title: 'Food Records Table',
                                    message: `Food with name: ${food_name} has been added.`, bgColor: 'bg-success'
                                })
                            }
                        );
                    }
                }
            );
        }
    );
};

exports.readFood = (request, response) => {
    db.query(
        `SELECT food_name, price, category
      FROM food JOIN food_category ON food.food_category_id = food_category.food_category_id`,
        (err, result) => {
            if (err) console.log(err);
            response.render('index', {
                foodRecord: result, title: 'Food Records Table'
            })
        }
    );
};

exports.updateForm = (request, response) => {
    const food_name = request.params.food_name;

    db.query(
        `SELECT food_name, price, food_category_id FROM food WHERE food_name = '${food_name}'`,
        (err, result) => {
            if (err) {
                console.log(err);
                return response.render('index', { message: `Database has a problem. (${err})` });
            }
            else return response.render('updateForm', {
                title: 'Edit Food Record', foodRecord: result[0],
                foodCategory1: result[0].food_category_id === 1,
                foodCategory2: result[0].food_category_id === 2,
                foodCategory3: result[0].food_category_id === 3,
                foodCategory4: result[0].food_category_id === 4,
                foodCategory5: result[0].food_category_id === 5,
            });
        }
    )
};

exports.updateFood = (request, response) => {
    const { prev_food_name, food_name, price, food_category_id } = request.body;

    db.query(
        `UPDATE food SET food_name = '${food_name}', price = '${price}', food_category_id = '${food_category_id}'
        WHERE food_name = '${prev_food_name}'`,
        (err) => {
            if (err) console.log(err);

            db.query(
                `SELECT food_name, price, category
                 FROM food JOIN food_category ON food.food_category_id = food_category.food_category_id`,
                (err, result) => {
                    if (err) console.log(err);
                    response.render('index', {
                        foodRecord: result, title: 'Food Records Table',
                        message: `Food with name: '${food_name}' has been updated.`, bgColor: 'bg-success'
                    })
                }
            );
        }
    )
}

exports.deleteItem = (request, response) => {
    const food_name = request.params.food_name;

    db.query(
        `DELETE FROM food WHERE food_name = '${food_name}'`,
        (err) => {
            if (err) {
                console.log(err);
                return response.render('index', { message: `Database has a problem. (${err})` });
            }
            else {
                db.query(
                    `SELECT food_name, price, category
                     FROM food JOIN food_category ON food.food_category_id = food_category.food_category_id`,
                    (err, result) => {
                        if (err) console.log(err);
                        response.render('index', {
                            foodRecord: result, title: 'Food Records Table',
                            message: `Food with name: '${food_name}' has been deleted.`, bgColor: 'bg-danger'
                        })
                    }
                );
            }
        }
    )
};