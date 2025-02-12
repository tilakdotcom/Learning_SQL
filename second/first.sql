

CREATE TABLE tbluser (
  id SERIAL NOT NULL PRIMARY KEY,
  email VARCHAR(100) UNIQUE NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  contact VARCHAR(15),
  account TEXT[],
  password TEXT,
  country TEXT,
  currency VARCHAR(5) NOT NULL DEFAULT 'USD',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


  CREATE TABLE tblaccount (
    id SERIAL NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES tbluser(id),
    account_name VARCHAR(100) NOT NULL,
    account_number VARCHAR(50) NOT NULL,
    account_balance NUMERIC(10,2) NOT NULL DEFAULT '0.00',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  )


CREATE TABLE tbltransaction (
  id SERIAL NOT NULL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES tbluser(id),
  description TEXT NOT NULL,
  status VARCHAR(50) NOT NULL DEFAULT 'pending',
  amount NUMERIC(10,2) NOT NULL,
  transaction_type VARCHAR(10) NOT NULL  DEFAULT 'income',
  account_id INTEGER NOT NULL REFERENCES tblaccount(id),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)


SELECT * FROM  tblaccount;
SELECT * FROM tbluser;
SELECT * FROM tbltransaction;

INSERT INTO tbluser (email, first_name, last_name,password, contact, country, currency) 
VALUES
  ('anshoo@gmail.com','anshu', 'kumar', '123456', '9876543210','India','RUPEE');


INSERT INTO tbluser (first_name,email, password) VALUES ($1, $2 ,$3) RETURNING *;
SELECT EXISTS (SELECT * FROM tbluser WHERE email =$1)