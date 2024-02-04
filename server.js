const express = require('express');
const bodyParser = require('body-parser');
const { createPool } = require('mysql');
const bcrypt = require('bcrypt');

const app = express();
const port = 8001;
const pool = createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "ocams",
    connectionLimit: 10,
});

app.use(express.static('public'));
app.set('view engine', 'pug');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

// Route handlers
app.get('/', (req, res) => {
    res.render('index');
});

app.get('/register', (req, res) => {
    res.render('register');
});

app.get('/login', (req, res) => {
    res.render('login');
});

app.get('/adminhome', (req, res) => {
    res.render('users/admin/adminhome');
});

app.get('/userhome', (req, res) => {
    res.render('users/userhome');
});

app.get('/mpangaji', (req, res) => {
    res.render('users/mpangaji');
});

app.get('/mwenyekiti', (req, res) => {
    res.render('users/mwenyekiti');
});

app.get('/mmiliki', (req, res) => {
    res.render('users/mmiliki');
});

app.get('/dalali', (req, res) => {
    res.render('users/dalali');
});

app.get('/shahidi', (req, res) => {
    res.render('users/shahidi');
});

app.get('/mpangishaji', (req, res) => {
    res.render('users/mpangishaji');
});

app.get('/adminusers', (req, res) => {
    // Fetch user data from the database
    const selectUsersSql = 'SELECT * FROM user';
    pool.query(selectUsersSql, (error, results, fields) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error fetching user data');
            return;
        }

        // Render the template and pass the users data
        res.render('users/admin/adminusers', { users: results });
    });
});

// Handle registration form submission
app.post('/register', (req, res) => {
    const {
        firstName,
        lastName,
        email,
        password,
        retypePassword,
        gender,
        mobile,
    } = req.body;

    // Check if passwords match
    if (password !== retypePassword) {
        res.status(400).send('Passwords do not match');
        return;
    }

    // Hash the password using bcrypt
    bcrypt.hash(password, 10, (err, hashedPassword) => {
        if (err) {
            console.error(err);
            res.status(500).send('Error hashing password');
            return;
        }

        // Insert user data into the database
        const insertSql =
            'INSERT INTO user (first_name, last_name, user_email, user_password, user_gender, user_role, user_phone_number, user_signature) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
        pool.query(
            insertSql,
            [firstName, lastName, email, password, gender, 'otheruser', mobile, hashedPassword],
            (error, results, fields) => {
                if (error) {
                    console.error(error);
                    res.status(500).send('Error registering user');
                    return;
                }
                // Redirect to login page or another page after successful registration
                res.redirect('/login');
            }
        );
    });
});

// Handle login form submission
app.post("/login", (req, res) => {
    const { email, pas1 } = req.body;

    // Check if the user exists in the database
    const selectSql = "SELECT * FROM user WHERE user_email = ? AND user_password = ?";
    pool.query(selectSql, [email, pas1], (error, results, fields) => {
        if (error || results.length === 0) {
            console.error(error);
            res.status(401).send('Invalid credentials');
            return;
        }

        // Redirect to appropriate page after successful login
        if (results[0].user_role === "admin") {
            res.redirect("/adminhome");
        } else if (results[0].user_role === "otheruser") {
            res.redirect("userhome");
        } else {
            res.status(401).send('Invalid credentials');
        }
    });
});

// New route to handle user deletion
app.post("/delete-user", (req, res) => {
    const deleteUserId = req.body.deleteUserId;
  
    // Perform the deletion in the database
    const deleteSql = "DELETE FROM user WHERE user_id = ?";
    pool.query(deleteSql, [deleteUserId], (error, results, fields) => {
      if (error) {
        console.error(error);
        res.status(500).send("Internal Server Error");
        return;
      }
  
      // Redirect back to adminhome page after deletion
      res.redirect("/adminusers");
    });
});
  
// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
