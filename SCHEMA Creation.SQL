CREATE TABLE student(
	id INT PRIMARY KEY ,
	username VARCHAR(25),
	password VARCHAR(25),
	education_lvl VARCHAR(25)
);

CREATE TABLE course(
	code VARCHAR(25) PRIMARY KEY,
	name VARCHAR(25),
	question_bank_id INT,
	CONSTRAINT unique_q_id UNIQUE (question_bank_id)
);
	
CREATE TABLE professor(
	id INT PRIMARY KEY ,
	name VARCHAR(25),
    	question_bank_id INT,
	CONSTRAINT q_id FOREIGN KEY (question_bank_id) REFERENCES course(question_bank_id)
);

CREATE TABLE department(
	id INT PRIMARY KEY,
	name VARCHAR(25),
   	supervisor_id INT,
	CONSTRAINT supv_id FOREIGN KEY (supervisor_id) REFERENCES professor(id)
);

CREATE TABLE exam(
	id INT PRIMARY KEY,
    	professor_id INT,
    	student_id INT,
    	course_code VARCHAR(25),
	CONSTRAINT prof_id FOREIGN KEY (professor_id) REFERENCES professor(id),
	CONSTRAINT std_id FOREIGN KEY (student_id) REFERENCES student(id),
	CONSTRAINT Cour_code FOREIGN KEY (course_code) REFERENCES course(code),
	result INT
);

CREATE TABLE course_prof_dept(
    	course_code VARCHAR(25),
    	professor_id INT,
    	department_id INT,
	CONSTRAINT CourT_code FOREIGN KEY (course_code) REFERENCES course(code),
	CONSTRAINT profT_id FOREIGN KEY (professor_id) REFERENCES professor(id),
	CONSTRAINT deptT_id FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE reviews(
	student_id INT,
    	course_code VARCHAR(25),
   	professor_id INT,
	CONSTRAINT stud_id FOREIGN KEY (student_id) REFERENCES student(id),
	CONSTRAINT Courr_code FOREIGN KEY (course_code) REFERENCES course(code),
	CONSTRAINT profe_id FOREIGN KEY (professor_id) REFERENCES professor(id),
	course_review INT,
	professor_review INT
);
