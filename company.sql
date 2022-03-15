create database company;
use company;

CREATE TABLE regions (
    region_id INT NOT NULL PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL
);

CREATE TABLE countries (
    country_id INT NOT NULL PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (region_id)
        REFERENCES regions (region_id)
);

alter table countries modify region_id int not null;
                        
CREATE TABLE locations (
    location_id INT NOT NULL PRIMARY KEY,
    street_address TEXT,
    postal_code INT,
    city VARCHAR(50),
    state VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id)
        REFERENCES countries (country_id)
);

alter table locations modify country_id int not null;
                        
CREATE TABLE departments (
    department_id INT NOT NULL PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT,
    FOREIGN KEY (location_id)
        REFERENCES locations (location_id)
);
                        
CREATE TABLE jobs (
    job_id INT NOT NULL PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary VARCHAR(20),
    max_salary VARCHAR(20)
);

CREATE TABLE employees (
    employee_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id INT,
    salary VARCHAR(20),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (job_id)
        REFERENCES jobs (job_id),
    FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);

alter table employees add foreign key(manager_id) references employees(employee_id);
alter table employees modify job_id int not null;


CREATE TABLE dependents (
    dependent_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    relationship VARCHAR(50),
    employee_id INT,
    FOREIGN KEY (employee_id)
        REFERENCES employees (employee_id)
);

alter table dependents modify employee_id int not null;


