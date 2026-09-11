# StudySync AI - Database Design

## 1. Users

Stores information about registered students.

| Column | Data Type | Key | Description |
|---|---|---|---|
| id | INT | Primary Key | Unique user ID |
| name | VARCHAR(100) | | Student name |
| email | VARCHAR(150) | UNIQUE | Student email |
| password | VARCHAR(255) | | Hashed password |
| branch | VARCHAR(50) | | Student branch |
| semester | INT | | Current semester |

---

## 2. Subjects

Stores subjects added by students.

| Column | Data Type | Key | Description |
|---|---|---|---|
| id | INT | Primary Key | Unique subject ID |
| user_id | INT | Foreign Key | Student who owns the subject |
| name | VARCHAR(100) | | Subject name |
| difficulty | INT | | Difficulty from 1-5 |
| exam_date | DATE | | Examination date |
| credits | INT | | Subject credits |

---

## 3. Topics

Stores topics belonging to a subject.

| Column | Data Type | Key | Description |
|---|---|---|---|
| id | INT | Primary Key | Unique topic ID |
| subject_id | INT | Foreign Key | Subject to which topic belongs |
| name | VARCHAR(150) | | Topic name |
| difficulty | INT | | Difficulty from 1-5 |
| estimated_hours | FLOAT | | Estimated study time |
| completed | BOOLEAN | | Whether topic is completed |

---

## 4. Study Schedule

Stores planned study tasks.

| Column | Data Type | Key | Description |
|---|---|---|---|
| id | INT | Primary Key | Unique schedule ID |
| topic_id | INT | Foreign Key | Topic being studied |
| date | DATE | | Scheduled date |
| start_time | TIME | | Starting time |
| duration | FLOAT | | Duration in hours |
| status | VARCHAR(20) | | Pending or completed |

---

## 5. Study Sessions

Stores actual study activity.

| Column | Data Type | Key | Description |
|---|---|---|---|
| id | INT | Primary Key | Unique session ID |
| user_id | INT | Foreign Key | Student |
| subject_id | INT | Foreign Key | Subject studied |
| date | DATE | | Date of study |
| duration | FLOAT | | Actual study duration |

---

## 6. Progress

Stores subject-wise learning progress.

| Column | Data Type | Key | Description |
|---|---|---|---|
| id | INT | Primary Key | Unique progress ID |
| subject_id | INT | Foreign Key | Subject |
| completed_topics | INT | | Number of completed topics |
| total_topics | INT | | Total number of topics |
| percentage | FLOAT | | Completion percentage |

---

# Relationships

## User → Subjects

One user can have many subjects.

## Subject → Topics

One subject can have many topics.

## Topic → Study Schedule

One topic can have multiple scheduled study sessions.

## User → Study Sessions

One user can have many study sessions.

## Subject → Progress

Each subject has progress information.