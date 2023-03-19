CREATE TABLE IF NOT EXISTS users(
	user_id INT GENERATED BY DEFAULT AS IDENTITY,
    user_login varchar(256) NOT NULL UNIQUE,
	user_password varchar(256) NOT NULL,
	user_email varchar(256) NOT NULL,
    user_fname varchar(50) NOT NULL,
    user_lname varchar(50) NOT NULL,
	user_role varchar(50) DEFAULT 'student',
	PRIMARY KEY(user_id),
	CHECK(LENGTH(user_login)>=8),
	CHECK(LENGTH(user_password)>=8)
);

CREATE TABLE IF NOT EXISTS students(   
    student_id INT NOT NULL,
    student_curator varchar(50),
    student_group varchar(50),
    CONSTRAINT PK_S PRIMARY KEY (student_id)
)

CREATE TABLE IF NOT EXISTS teachers(   
    teacher_id INT NOT NULL,
    teacher_title varchar(50),
    teacher_degree varchar(50),
    CONSTRAINT PK_T PRIMARY KEY (teacher_id)
)

CREATE TABLE IF NOT EXISTS courses(
	course_id INT GENERATED BY DEFAULT AS IDENTITY,
    fk_user_id INT,
    course_title varchar(256) NOT NULL UNIQUE,
	course_subtitle varchar(256) NOT NULL,
    course_day_posted date DEFAULT CURRENT_DATE,
    course_content TEXT,
	PRIMARY KEY(course_id),
	CONSTRAINT fk_course
		FOREIGN KEY (fk_user_id)
			REFERENCES users(user_id)
);

INSERT INTO users VALUES (666,'Admin6666',
                              'c30db455c7a0bd7532830424cdacda8365818e6425995b07f186c9d6c6ced38a',
							  'c30db455c7a0bd7532830424cdacda8365818e6425995b07f186c9d6c6ced38a',
                              'alexanisandr@gmail.com',
                              'Oleksandr',
                              'Anisimov',
                              'admin')