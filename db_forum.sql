DROP TABLE posts;
DROP TABLE topics;
DROP TABLE categories;
DROP TABLE users;

CREATE TABLE users (
    user_id INT(8) NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(30) NOT NULL,
    user_pass VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_date DATETIME NOT NULL,
    user_level INT(8) NOT NULL,
    UNIQUE INDEX user_name_unique(user_name),
    PRIMARY KEY(user_id)
) ENGINE = INNODB;
CREATE TABLE categories (
    cat_id INT(8) NOT NULL AUTO_INCREMENT,
    cat_name VARCHAR(255) NOT NULL,
    cat_description VARCHAR(255) NOT NULL,
    UNIQUE INDEX cat_name_unique (cat_name),
    PRIMARY KEY (cat_id)
) ENGINE = INNODB;
CREATE TABLE topics (
    topic_id INT(8) NOT NULL AUTO_INCREMENT,
    topic_subject VARCHAR(255) NOT NULL,
    topic_date DATETIME NOT NULL,
    topic_cat INT(8) NOT NULL,
    topic_by INT(8) NOT NULL,
    PRIMARY KEY (topic_id)
) ENGINE = INNODB;
CREATE TABLE posts (
    post_id INT(8) NOT NULL AUTO_INCREMENT,
    post_content TEXT NOT NULL,
    post_date DATETIME NOT NULL,
    post_topic INT(8) NOT NULL,
    post_by INT(8) NOT NULL,
    PRIMARY KEY (post_id)
) ENGINE = INNODB;
ALTER TABLE topics
ADD FOREIGN KEY(topic_cat) REFERENCES categories(cat_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE topics
ADD FOREIGN KEY(topic_by) REFERENCES users(user_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE posts
ADD FOREIGN KEY(post_topic) REFERENCES topics(topic_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE posts
ADD FOREIGN KEY(post_by) REFERENCES users(user_id) ON DELETE RESTRICT ON UPDATE CASCADE;
INSERT INTO users (user_name, user_pass, user_email, user_date, user_level) VALUES
                                                                                ('admin', 'admin123', 'admin@example.com', NOW(), 9),
                                                                                ('john_doe', 'password1', 'john@example.com', NOW(), 1),
                                                                                ('jane_smith', 'letmein', 'jane@example.com', NOW(), 1),
                                                                                ('bob_jones', 'bob123', 'bob@example.com', NOW(), 1),
                                                                                ('alice_wonder', 'alicepass', 'alice@example.com', NOW(), 2);
INSERT INTO categories (cat_name, cat_description) VALUES
                                                       ('General Discussion', 'Talk about anything related to our community'),
                                                       ('Technical Support', 'Get help with technical issues'),
                                                       ('Suggestions', 'Share your ideas for improvement'),
                                                       ('Announcements', 'Important updates and news');
INSERT INTO topics (topic_subject, topic_date, topic_cat, topic_by) VALUES
                                                                        ('Welcome to our forum!', NOW(), 4, 1),
                                                                        ('How to reset password?', NOW(), 2, 2),
                                                                        ('New feature request', NOW(), 3, 3),
                                                                        ('What are you working on?', NOW(), 1, 4),
                                                                        ('Forum rules', NOW(), 4, 1);
INSERT INTO posts (post_content, post_date, post_topic, post_by) VALUES
                                                                     ('Welcome everyone to our new forum! Please read the rules before posting.', NOW(), 1, 1),
                                                                     ('I can''t seem to reset my password, any help?', NOW(), 2, 2),
                                                                     ('I think we should add a dark mode option.', NOW(), 3, 3),
                                                                     ('I''m currently working on a web development project.', NOW(), 4, 4),
                                                                     ('1. Be respectful to others. 2. No spam. 3. Keep it clean.', NOW(), 5, 1),
                                                                     ('Have you tried the "Forgot Password" link?', NOW(), 2, 5),
                                                                     ('Dark mode would be great for night browsing!', NOW(), 3, 2),
                                                                     ('I agree with the dark mode suggestion!', NOW(), 3, 4);